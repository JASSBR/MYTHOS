# Plan d'Implémentation et Déploiement – MYTHOS

## Plateforme de jeux narratifs multijoueur avec IA Maitre du Jeu

> **Projet** : MYTHOS
> **Version** : 1.0
> **Date** : 24 Fevrier 2026
> **Equipe** : 4 personnes (Scrum) — Kays ZAHIDI, Samy ZEROUALI, Youri EMMANUEL, Yassir SABBAR
> **Duree** : 14 semaines (7 sprints de 2 semaines)
> **Referentiel** : RNCP38822 -- Bloc 1

Ce plan d'implementation decrit concretement comment on deploie et livre MYTHOS. Yassir, responsable DevOps, a concu le pipeline CI/CD avec Kays. Chaque environnement (local, staging, production) a ete teste et valide des le Sprint 0 pour eviter les surprises de derniere minute. Yassir a configure tout le monitoring en une apres-midi, on etait impressionnes -- ca nous a permis de gagner du temps pour la suite. On a aussi pris le temps de faire un dry-run complet du flux de deploiement en equipe avant de passer a la suite, histoire que tout le monde soit a l'aise.

---

## Table des matieres

1. [Strategie de deploiement par phases](#1-strategie-de-deploiement-par-phases)
2. [Git Flow detaille](#2-git-flow-detaille)
3. [Pipeline CI/CD detaille](#3-pipeline-cicd-detaille)
4. [Infrastructure as Code](#4-infrastructure-as-code)
5. [Plan de migration de donnees](#5-plan-de-migration-de-donnees-prisma)
6. [Strategie de feature flags](#6-strategie-de-feature-flags)
7. [Plan de mise en production](#7-plan-de-mise-en-production)
8. [Documentation des environnements](#8-documentation-des-environnements)
9. [Procedure d'onboarding technique](#9-procedure-donboarding-technique)

---

## 1. Strategie de deploiement par phases

### 1.1 Philosophie generale

Le deploiement de MYTHOS suit une strategie **progressive a 3 paliers** pour s'assurer que chaque livraison est testee, validee et stable avant d'atteindre les utilisateurs finaux. Chaque environnement joue un role precis dans la chaine de qualite.

```
┌──────────────────────────────────────────────────────────────────────────┐
│                    CHAINE DE DEPLOIEMENT MYTHOS                         │
│                                                                         │
│   ┌─────────────┐      ┌──────────────┐      ┌──────────────────┐      │
│   │   LOCAL      │ ───> │   STAGING     │ ───> │   PRODUCTION     │     │
│   │  (develop)   │      │  (pre-prod)   │      │   (main)         │     │
│   │              │      │               │      │                  │     │
│   │ Chaque dev   │      │ Validation    │      │ Utilisateurs     │     │
│   │ sur sa       │      │ equipe +      │      │ finaux           │     │
│   │ machine      │      │ tests E2E     │      │                  │     │
│   └─────────────┘      └──────────────┘      └──────────────────┘     │
│                                                                         │
│   Docker Compose        Vercel Preview        Vercel Production         │
│   PostgreSQL local      Railway staging       Railway production        │
│   Redis local           Upstash staging       Upstash production        │
│   Hot reload            Donnees de test       Donnees reelles           │
│                                                                         │
│   Merge → develop       Merge → staging       Merge → main              │
│   CI: lint + tests      CI: lint + tests      CI: lint + tests          │
│                         + build + E2E         + build + E2E             │
│                         + deploy preview      + deploy prod             │
└──────────────────────────────────────────────────────────────────────────┘
```

### 1.2 Environnement LOCAL (Developpement)

**Objectif** : Permettre a chaque developpeur de coder, tester et iterer rapidement en isolation.

| Composant | Outil local | Configuration |
|-----------|-------------|---------------|
| Frontend (Next.js) | `npm run dev` | Hot Module Replacement, port 3000 |
| Backend (NestJS) | `npm run start:dev` | Watch mode, port 3001 |
| PostgreSQL | Docker Compose | Port 5432, base `mythos_dev` |
| Redis | Docker Compose | Port 6379, pas de mot de passe |
| Socket.io | Integre au backend NestJS | CORS ouvert sur localhost |
| API Anthropic | Cle API personnelle (dev) | Modele Haiku uniquement (economie) |

**Fichier `docker-compose.dev.yml`** :

```yaml
version: "3.8"
services:
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: mythos_dev
      POSTGRES_USER: mythos
      POSTGRES_PASSWORD: mythos_dev_password
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    command: redis-server --maxmemory 64mb --maxmemory-policy allkeys-lru

volumes:
  pgdata:
```

**Regles de l'environnement local** :
- Chaque developpeur clone le repo et lance `docker-compose up -d` + `npm run dev` dans chaque projet
- Les seeds Prisma creent les donnees de test (users, scenario packs)
- Les appels IA utilisent Claude Haiku pour reduire les couts en developpement
- Les fichiers `.env.local` ne sont JAMAIS commites (presents dans `.gitignore`)

### 1.3 Environnement STAGING (Pre-production)

**Objectif** : Valider l'integration complete avant la mise en production. Environnement miroir de la production.

| Composant | Service | Configuration |
|-----------|---------|---------------|
| Frontend | Vercel Preview Deployment | Branche `staging`, URL preview |
| Backend | Railway (service staging) | Service dedie, variables staging |
| PostgreSQL | Railway PostgreSQL (instance staging) | Base dediee, donnees de test |
| Redis | Upstash Redis (instance staging) | Base dediee, quota reduit |
| API Anthropic | Cle API projet (staging) | Modele Haiku + Sonnet, limites de cout |

**Declenchement** : Automatique a chaque merge sur la branche `staging`.

**Regles** :
- Les donnees sont reinitialises a chaque deploiement via les seeds Prisma
- Les tests E2E automatises tournent apres chaque deploiement staging
- L'equipe teste manuellement les flux critiques (partie complete)
- Kays (Product Owner) valide les fonctionnalites avant le passage en production
- Alerte Slack/Discord si le deploiement echoue

### 1.4 Environnement PRODUCTION

**Objectif** : Servir les utilisateurs finaux avec stabilite et performance maximales.

| Composant | Service | Configuration |
|-----------|---------|---------------|
| Frontend | Vercel Production | Branche `main`, domaine personnalise |
| Backend | Railway (service production) | Service dedie, scaling auto |
| PostgreSQL | Railway PostgreSQL (production) | Backups automatiques, SSL |
| Redis | Upstash Redis (production) | Quota production, persistance |
| API Anthropic | Cle API projet (production) | Sonnet + Haiku, monitoring couts |
| Monitoring | UptimeRobot + Logs Railway | Health check toutes les 5 minutes |

**Declenchement** : Merge sur `main` apres validation staging + approbation PR.

**Regles** :
- Zero deploiement en dehors des heures d'activite de l'equipe (sauf hotfix critique)
- Rollback automatique si le health check echoue dans les 5 minutes post-deploiement
- Monitoring actif : temps de reponse IA, taux d'erreur, WebSocket actifs
- Budget API Anthropic surveille quotidiennement

### 1.5 Matrice de progression des deploiements

```
Sprint 0-1 : LOCAL uniquement
             ┗━ Les developpeurs travaillent en local
             ┗━ CI/CD est configure mais ne deploie pas encore

Sprint 2   : LOCAL + STAGING
             ┗━ Premier deploiement staging pour valider l'integration
             ┗━ Tests E2E en staging

Sprint 3-4 : LOCAL + STAGING + PRODUCTION (beta)
             ┗━ Premier deploiement production
             ┗━ Tests avec l'equipe en conditions reelles

Sprint 5+  : Chaine complete stabilisee
             ┗━ Deploiement continu feature par feature
             ┗━ Feature flags pour les fonctionnalites a risque
```

---

## 2. Git Flow detaille

### 2.1 Schema des branches

```
main ─────────●──────────────●──────────────●──────── (production)
              │              ↑              ↑
              │         merge + tag    merge + tag
              │              │              │
staging ──────●──────●───────●──────●───────●──────── (pre-production)
              │      ↑       │      ↑       │
              │  merge PR    │  merge PR    │
              │      │       │      │       │
develop ──────●──●──●──●──●──●──●──●──●──●──●──────── (integration)
              │  ↑  ↑  ↑  ↑     ↑  ↑  ↑  ↑
              │  │  │  │  │     │  │  │  │
              │  │  │  │  │     │  │  │  └── feature/game-ui-resources
              │  │  │  │  │     │  │  └───── bugfix/ws-reconnection
              │  │  │  │  │     │  └──────── feature/deep-scenario
              │  │  │  │  │     └─────────── feature/tribunal-scenario
              │  │  │  │  └──────────────── feature/websocket-gateway
              │  │  │  └─────────────────── feature/game-engine-core
              │  │  └────────────────────── feature/ai-service-poc
              │  └───────────────────────── feature/auth-module
              └──────────────────────────── (Sprint 0: setup)
```

### 2.2 Convention de nommage des branches

| Type de branche | Format | Exemple | Usage |
|-----------------|--------|---------|-------|
| **Branche principale** | `main` | `main` | Code en production, toujours stable |
| **Pre-production** | `staging` | `staging` | Miroir de la production, validation finale |
| **Integration** | `develop` | `develop` | Integration continue, derniere version stable en dev |
| **Fonctionnalite** | `feature/<ticket-id>-<description>` | `feature/S2-06-game-loop-manager` | Nouvelle fonctionnalite |
| **Correction de bug** | `bugfix/<ticket-id>-<description>` | `bugfix/S3-07-ws-desync-fix` | Correction de bug non-critique |
| **Correctif urgent** | `hotfix/<description>` | `hotfix/fix-api-key-rotation` | Correction critique en production |
| **Version** | `release/<version>` | `release/1.0.0` | Preparation d'une release |
| **Spike technique** | `spike/<description>` | `spike/ai-streaming-poc` | Exploration technique time-boxee |

**Regles de nommage** :
- Toujours en minuscules
- Mots separes par des tirets (`-`)
- Inclure l'ID du ticket quand applicable (`S2-06`)
- Description courte et explicite (max 5 mots)

### 2.3 Politique de merge

```
┌─────────────────────────────────────────────────────────────────────┐
│                      POLITIQUE DE MERGE                             │
│                                                                     │
│  feature/* ──PR──> develop ──PR──> staging ──PR──> main             │
│  bugfix/*  ──PR──> develop                                          │
│  hotfix/*  ──PR──> main + develop (cherry-pick)                     │
│  release/* ──PR──> main + develop                                   │
│                                                                     │
│  REGLES :                                                           │
│  ┌────────────────────────────────────────────────────────────┐     │
│  │ 1. JAMAIS de push direct sur main, staging ou develop      │     │
│  │ 2. TOUTE modification passe par une Pull Request            │     │
│  │ 3. Minimum 1 review approuvee pour merger                   │     │
│  │ 4. CI verte obligatoire (lint + tests)                      │     │
│  │ 5. Pas de merge si des conversations sont non resolues      │     │
│  │ 6. Squash merge pour feature → develop (historique propre)  │     │
│  │ 7. Merge commit pour develop → staging → main (tracabilite) │     │
│  │ 8. Branch supprimee apres merge                             │     │
│  └────────────────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────────────┘
```

**Protection des branches (GitHub Settings)** :

| Branche | Reviews requises | CI obligatoire | Push direct | Force push |
|---------|:---:|:---:|:---:|:---:|
| `main` | 2 | Oui | Interdit | Interdit |
| `staging` | 1 | Oui | Interdit | Interdit |
| `develop` | 1 | Oui | Interdit | Interdit |

### 2.4 Convention de commits (Conventional Commits)

Le projet adopte la specification **Conventional Commits v1.0.0** pour avoir un historique lisible et permettre la generation automatique de changelogs.

**Format** :

```
<type>(<scope>): <description courte>

[corps optionnel]

[footer optionnel]
```

**Types autorises** :

| Type | Description | Exemple |
|------|-------------|---------|
| `feat` | Nouvelle fonctionnalite | `feat(game-engine): add game loop manager with 6 phases` |
| `fix` | Correction de bug | `fix(ws): resolve player desync on reconnection` |
| `docs` | Documentation uniquement | `docs(readme): add setup instructions for new developers` |
| `style` | Formatage, semicolons, etc. (pas de changement de logique) | `style(frontend): apply prettier formatting` |
| `refactor` | Refactoring sans changement fonctionnel | `refactor(ai-service): extract prompt builder into separate class` |
| `perf` | Amelioration de performance | `perf(api): add redis caching for scenario pack loading` |
| `test` | Ajout ou correction de tests | `test(choice-engine): add unit tests for vote mode` |
| `build` | Changement affectant le build ou les dependances | `build(deps): upgrade nestjs to v10.3` |
| `ci` | Changement de configuration CI/CD | `ci(github): add e2e test step to staging workflow` |
| `chore` | Taches de maintenance | `chore: update .gitignore for IDE files` |
| `revert` | Annulation d'un commit precedent | `revert: revert feat(game-engine): add timer system` |

**Scopes autorises** :

| Scope | Description |
|-------|-------------|
| `frontend` | Tout ce qui concerne le projet Next.js |
| `backend` | Tout ce qui concerne le projet NestJS |
| `game-engine` | Moteur de jeu (Game Loop, State, etc.) |
| `ai-service` | Service d'integration IA (prompts, parsing) |
| `ws` | WebSocket / Socket.io |
| `auth` | Authentification et autorisation |
| `db` | Base de donnees, migrations, seeds |
| `admin` | Panel d'administration |
| `ci` | CI/CD et workflows |
| `infra` | Infrastructure et deploiement |
| `a11y` | Accessibilite |
| `perf` | Performance |

**Exemples concrets** :

```
feat(game-engine): implement choice engine with vote and individual modes

The ChoiceEngine service now supports three action modes:
- individual: each player chooses secretly
- vote: majority wins, random on tie
- designated: one player decides for the group

Includes timer management with configurable timeout.

Closes #42
```

```
fix(ws): handle player reconnection after browser crash

Players who disconnect due to browser crash or network loss
can now rejoin their active game session within a 2-minute window.
Their game state is fully restored from Redis.

Fixes #67
```

### 2.5 Template de Pull Request

Le fichier `.github/PULL_REQUEST_TEMPLATE.md` suivant est utilise :

```markdown
## Description

<!-- Decrivez les changements effectues et leur objectif -->

### Type de changement

- [ ] Nouvelle fonctionnalite (feat)
- [ ] Correction de bug (fix)
- [ ] Refactoring (refactor)
- [ ] Documentation (docs)
- [ ] Infrastructure / CI (ci/infra)
- [ ] Tests (test)
- [ ] Autre : ___

### Ticket(s) lie(s)

Closes #___

## Changements effectues

<!-- Liste des modifications principales -->

-
-
-

## Captures d'ecran (si UI)

<!-- Ajoutez des captures avant/apres si applicable -->

## Checklist

### Code
- [ ] Mon code respecte les conventions TypeScript du projet
- [ ] J'ai ajoute/mis a jour les tests unitaires
- [ ] J'ai verifie que tous les tests passent (`npm test`)
- [ ] J'ai verifie le lint (`npm run lint`)
- [ ] J'ai ajoute les types TypeScript necessaires (pas de `any`)
- [ ] J'ai gere les cas d'erreur

### Fonctionnel
- [ ] Les criteres d'acceptation du ticket sont satisfaits
- [ ] J'ai teste manuellement la fonctionnalite
- [ ] Le comportement est correct sur mobile (si UI)
- [ ] L'accessibilite a ete verifiee (si UI)

### Documentation
- [ ] Le README est a jour (si necessaire)
- [ ] Les commentaires de code sont suffisants
- [ ] Les endpoints API sont documentes (si nouveau endpoint)

### Securite
- [ ] Aucune donnee sensible n'est exposee (cles API, mots de passe)
- [ ] Les entrees utilisateur sont validees et sanitisees
- [ ] Les endpoints sont correctement proteges (guards, auth)

## Notes pour le reviewer

<!-- Conseils, points d'attention, contexte supplementaire -->
```

### 2.6 Template d'Issue

```markdown
---
name: Bug Report / Feature Request / Task
about: Template pour les issues du projet MYTHOS
---

## Type

- [ ] Bug
- [ ] Feature
- [ ] Tache technique
- [ ] Spike (exploration)
- [ ] Documentation

## Description

<!-- Description claire et concise -->

## Criteres d'acceptation

- [ ] ...
- [ ] ...
- [ ] ...

## Details techniques

<!-- Si applicable : fichiers impactes, approche suggeree -->

## Estimation

- Story Points : ___
- Sprint cible : Sprint ___
- Priorite : Must Have / Should Have / Could Have

## Dependencies

<!-- Tickets bloquants -->

## Maquettes / References

<!-- Liens Figma, captures, liens externes -->
```

---

## 3. Pipeline CI/CD detaille

### 3.1 Architecture globale des workflows

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      ARCHITECTURE CI/CD MYTHOS                              │
│                                                                             │
│  ┌──────────────────────────────────────────────────────┐                   │
│  │              WORKFLOW 1 : CI (Pull Requests)          │                   │
│  │                                                       │                   │
│  │  Declencheur : Ouverture/mise a jour de PR            │                   │
│  │  Branches : toutes les PR vers develop/staging/main   │                   │
│  │                                                       │                   │
│  │  ┌─────────┐ ┌──────────┐ ┌─────────┐ ┌───────────┐  │                   │
│  │  │  Lint   │→│  Tests   │→│  Build  │→│  Audit    │  │                   │
│  │  │ ESLint  │ │ unitaires│ │ front + │ │ npm audit │  │                   │
│  │  │Prettier │ │ + integr.│ │ back    │ │ + Snyk    │  │                   │
│  │  └─────────┘ └──────────┘ └─────────┘ └───────────┘  │                   │
│  └──────────────────────────────────────────────────────┘                   │
│                                                                             │
│  ┌──────────────────────────────────────────────────────┐                   │
│  │        WORKFLOW 2 : Deploy Staging                    │                   │
│  │                                                       │                   │
│  │  Declencheur : Merge sur branche staging              │                   │
│  │                                                       │                   │
│  │  ┌─────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐  │                   │
│  │  │   CI    │→│ Deploy   │→│ Deploy   │→│ Tests    │  │                   │
│  │  │ complet │ │ Backend  │ │ Frontend │ │  E2E     │  │                   │
│  │  │ (W1)    │ │ Railway  │ │ Vercel   │ │ Staging  │  │                   │
│  │  └─────────┘ └──────────┘ └──────────┘ └──────────┘  │                   │
│  └──────────────────────────────────────────────────────┘                   │
│                                                                             │
│  ┌──────────────────────────────────────────────────────┐                   │
│  │        WORKFLOW 3 : Deploy Production                 │                   │
│  │                                                       │                   │
│  │  Declencheur : Merge sur branche main                 │                   │
│  │                                                       │                   │
│  │  ┌─────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐       │
│  │  │   CI    │→│ Deploy   │→│ Migrate  │→│ Deploy   │→│ Smoke    │       │
│  │  │ complet │ │ Backend  │ │  DB      │ │ Frontend │ │ Tests    │       │
│  │  │ (W1)    │ │ Railway  │ │ Prisma   │ │ Vercel   │ │ Health + │       │
│  │  │         │ │ prod     │ │ migrate  │ │ prod     │ │ E2E prod │       │
│  │  └─────────┘ └──────────┘ └──────────┘ └──────────┘ └──────────┘       │
│  └──────────────────────────────────────────────────────┘                   │
│                                                                             │
│  ┌──────────────────────────────────────────────────────┐                   │
│  │        WORKFLOW 4 : Scheduled                         │                   │
│  │                                                       │                   │
│  │  Declencheur : Cron quotidien (02:00 UTC)             │                   │
│  │                                                       │                   │
│  │  ┌──────────┐ ┌──────────┐ ┌──────────┐              │                   │
│  │  │ npm audit│→│ Lighthouse│→│ Rapport  │              │                   │
│  │  │ securite │ │ a11y +   │ │ Discord  │              │                   │
│  │  │          │ │ perf     │ │ webhook  │              │                   │
│  │  └──────────┘ └──────────┘ └──────────┘              │                   │
│  └──────────────────────────────────────────────────────┘                   │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 3.2 Workflow 1 : CI -- Integration Continue (Pull Requests)

**Fichier** : `.github/workflows/ci.yml`

```yaml
name: CI - Lint, Test, Build

on:
  pull_request:
    branches: [develop, staging, main]
    types: [opened, synchronize, reopened]

concurrency:
  group: ci-${{ github.ref }}
  cancel-in-progress: true

jobs:
  # ──────────────────────────────────────────────
  # ETAPE 1 : Lint (ESLint + Prettier)
  # ──────────────────────────────────────────────
  lint:
    name: Lint
    runs-on: ubuntu-latest
    strategy:
      matrix:
        project: [frontend, backend]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          cache: "npm"
          cache-dependency-path: "${{ matrix.project }}/package-lock.json"
      - run: cd ${{ matrix.project }} && npm ci
      - run: cd ${{ matrix.project }} && npm run lint
      - run: cd ${{ matrix.project }} && npx prettier --check "src/**/*.{ts,tsx}"

  # ──────────────────────────────────────────────
  # ETAPE 2 : Tests unitaires + integration
  # ──────────────────────────────────────────────
  test-backend:
    name: Test Backend
    runs-on: ubuntu-latest
    needs: lint
    services:
      postgres:
        image: postgres:16-alpine
        env:
          POSTGRES_DB: mythos_test
          POSTGRES_USER: mythos
          POSTGRES_PASSWORD: test_password
        ports: ["5432:5432"]
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
      redis:
        image: redis:7-alpine
        ports: ["6379:6379"]
        options: >-
          --health-cmd "redis-cli ping"
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          cache: "npm"
          cache-dependency-path: "backend/package-lock.json"
      - run: cd backend && npm ci
      - run: cd backend && npx prisma migrate deploy
        env:
          DATABASE_URL: "postgresql://mythos:test_password@localhost:5432/mythos_test"
      - run: cd backend && npm run test -- --coverage
        env:
          DATABASE_URL: "postgresql://mythos:test_password@localhost:5432/mythos_test"
          REDIS_URL: "redis://localhost:6379"
          JWT_SECRET: "test-secret-key"
          ANTHROPIC_API_KEY: "sk-ant-test-key"
      - uses: actions/upload-artifact@v4
        with:
          name: backend-coverage
          path: backend/coverage/lcov.info

  test-frontend:
    name: Test Frontend
    runs-on: ubuntu-latest
    needs: lint
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          cache: "npm"
          cache-dependency-path: "frontend/package-lock.json"
      - run: cd frontend && npm ci
      - run: cd frontend && npm run test -- --coverage
      - uses: actions/upload-artifact@v4
        with:
          name: frontend-coverage
          path: frontend/coverage/lcov.info

  # ──────────────────────────────────────────────
  # ETAPE 3 : Build
  # ──────────────────────────────────────────────
  build:
    name: Build
    runs-on: ubuntu-latest
    needs: [test-backend, test-frontend]
    strategy:
      matrix:
        project: [frontend, backend]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          cache: "npm"
          cache-dependency-path: "${{ matrix.project }}/package-lock.json"
      - run: cd ${{ matrix.project }} && npm ci
      - run: cd ${{ matrix.project }} && npm run build

  # ──────────────────────────────────────────────
  # ETAPE 4 : Audit securite
  # ──────────────────────────────────────────────
  security-audit:
    name: Security Audit
    runs-on: ubuntu-latest
    needs: lint
    strategy:
      matrix:
        project: [frontend, backend]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          cache: "npm"
          cache-dependency-path: "${{ matrix.project }}/package-lock.json"
      - run: cd ${{ matrix.project }} && npm ci
      - run: cd ${{ matrix.project }} && npm audit --audit-level=high
      - run: cd ${{ matrix.project }} && npx better-npm-audit audit
```

### 3.3 Workflow 2 : Deploy Staging

**Fichier** : `.github/workflows/deploy-staging.yml`

```yaml
name: Deploy Staging

on:
  push:
    branches: [staging]

jobs:
  ci:
    uses: ./.github/workflows/ci.yml

  deploy-backend-staging:
    name: Deploy Backend to Railway (Staging)
    runs-on: ubuntu-latest
    needs: ci
    environment: staging
    steps:
      - uses: actions/checkout@v4
      - uses: railwayapp/github-action@v1
        with:
          service: mythos-backend-staging
        env:
          RAILWAY_TOKEN: ${{ secrets.RAILWAY_TOKEN_STAGING }}

  deploy-frontend-staging:
    name: Deploy Frontend to Vercel (Staging)
    runs-on: ubuntu-latest
    needs: ci
    environment: staging
    steps:
      - uses: actions/checkout@v4
      - uses: amondnet/vercel-action@v25
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          working-directory: ./frontend

  e2e-staging:
    name: E2E Tests on Staging
    runs-on: ubuntu-latest
    needs: [deploy-backend-staging, deploy-frontend-staging]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
      - run: cd e2e && npm ci
      - run: npx playwright install --with-deps
      - run: cd e2e && npx playwright test
        env:
          BASE_URL: ${{ vars.STAGING_FRONTEND_URL }}
          API_URL: ${{ vars.STAGING_BACKEND_URL }}
```

### 3.4 Workflow 3 : Deploy Production

**Fichier** : `.github/workflows/deploy-production.yml`

```yaml
name: Deploy Production

on:
  push:
    branches: [main]

jobs:
  ci:
    uses: ./.github/workflows/ci.yml

  deploy-backend-production:
    name: Deploy Backend to Railway (Production)
    runs-on: ubuntu-latest
    needs: ci
    environment: production
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to Railway
        uses: railwayapp/github-action@v1
        with:
          service: mythos-backend-production
        env:
          RAILWAY_TOKEN: ${{ secrets.RAILWAY_TOKEN_PRODUCTION }}
      - name: Run Prisma Migrations
        run: |
          cd backend && npm ci
          npx prisma migrate deploy
        env:
          DATABASE_URL: ${{ secrets.PRODUCTION_DATABASE_URL }}

  deploy-frontend-production:
    name: Deploy Frontend to Vercel (Production)
    runs-on: ubuntu-latest
    needs: ci
    environment: production
    steps:
      - uses: actions/checkout@v4
      - uses: amondnet/vercel-action@v25
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          vercel-args: "--prod"
          working-directory: ./frontend

  smoke-tests:
    name: Smoke Tests (Production)
    runs-on: ubuntu-latest
    needs: [deploy-backend-production, deploy-frontend-production]
    steps:
      - uses: actions/checkout@v4
      - name: Health Check Backend
        run: |
          for i in {1..10}; do
            STATUS=$(curl -s -o /dev/null -w "%{http_code}" ${{ vars.PRODUCTION_BACKEND_URL }}/api/health)
            if [ "$STATUS" = "200" ]; then
              echo "Backend is healthy"
              exit 0
            fi
            echo "Attempt $i: Backend returned $STATUS, retrying in 15s..."
            sleep 15
          done
          echo "Backend health check failed"
          exit 1
      - name: Health Check Frontend
        run: |
          STATUS=$(curl -s -o /dev/null -w "%{http_code}" ${{ vars.PRODUCTION_FRONTEND_URL }})
          if [ "$STATUS" != "200" ]; then
            echo "Frontend health check failed with status $STATUS"
            exit 1
          fi
      - name: Run Smoke Tests
        run: |
          cd e2e && npm ci
          npx playwright install --with-deps
          npx playwright test --project=smoke
        env:
          BASE_URL: ${{ vars.PRODUCTION_FRONTEND_URL }}
          API_URL: ${{ vars.PRODUCTION_BACKEND_URL }}
```

### 3.5 Diagramme de flux CI/CD complet

```
                           Developpeur
                               │
                               ▼
                     ┌─────────────────┐
                     │  Push sur branch │
                     │  feature/*       │
                     └────────┬────────┘
                              │
                              ▼
                     ┌─────────────────┐
                     │  Ouvre PR vers   │
                     │  develop         │
                     └────────┬────────┘
                              │
                 ┌────────────┼────────────┐
                 ▼            ▼            ▼
          ┌───────────┐ ┌──────────┐ ┌──────────┐
          │   LINT    │ │  TESTS   │ │ SECURITY │
          │           │ │          │ │  AUDIT   │
          │ ESLint    │ │ Backend: │ │          │
          │ Prettier  │ │ Jest     │ │ npm audit│
          │ TypeCheck │ │ +Postgres│ │          │
          │           │ │ +Redis   │ │          │
          │           │ │          │ │          │
          │           │ │ Frontend:│ │          │
          │           │ │ Vitest   │ │          │
          └─────┬─────┘ └────┬─────┘ └────┬─────┘
                │            │            │
                └────────────┼────────────┘
                             │
                             ▼
                      ┌────────────┐
                      │   BUILD    │
                      │            │
                      │  next build│
                      │  nest build│
                      └──────┬─────┘
                             │
                             ▼
                     ┌───────────────┐
                     │ CI VERTE ?    │
                     │               │──── Non ──> PR bloquee, fix necessaire
                     └───────┬───────┘
                             │ Oui
                             ▼
                     ┌───────────────┐
                     │ CODE REVIEW   │
                     │ (1+ approval) │──── Refuse ──> Corrections demandees
                     └───────┬───────┘
                             │ Approuve
                             ▼
                     ┌───────────────┐
                     │ MERGE dans    │
                     │ develop       │
                     └───────┬───────┘
                             │
                             │ (quand sprint ready)
                             ▼
                     ┌───────────────┐
                     │ MERGE dans    │
                     │ staging       │
                     └───────┬───────┘
                             │
                 ┌───────────┼───────────┐
                 ▼           ▼           ▼
          ┌───────────┐ ┌──────────┐ ┌──────────┐
          │  DEPLOY   │ │ DEPLOY   │ │  TESTS   │
          │ Backend   │ │ Frontend │ │  E2E     │
          │ Railway   │ │ Vercel   │ │ Staging  │
          │ staging   │ │ preview  │ │Playwright│
          └───────────┘ └──────────┘ └────┬─────┘
                                          │
                         ┌────────────────┘
                         ▼
                ┌─────────────────┐
                │ VALIDATION PO   │
                │ + equipe        │──── KO ──> Retour sur develop
                └────────┬────────┘
                         │ OK
                         ▼
                ┌─────────────────┐
                │ MERGE dans main │
                └────────┬────────┘
                         │
             ┌───────────┼───────────┐
             ▼           ▼           ▼
      ┌───────────┐ ┌──────────┐ ┌──────────┐
      │  DEPLOY   │ │ MIGRATE  │ │  DEPLOY  │
      │ Backend   │ │ Prisma   │ │ Frontend │
      │ Railway   │ │ DB prod  │ │ Vercel   │
      │ production│ │          │ │ --prod   │
      └───────────┘ └──────────┘ └────┬─────┘
                                      │
                                      ▼
                              ┌──────────────┐
                              │ SMOKE TESTS  │
                              │ Health check │
                              │ + E2E smoke  │
                              └──────┬───────┘
                                     │
                            ┌────────┼────────┐
                            │ OK     │        │ KO
                            ▼        │        ▼
                    ┌────────────┐   │  ┌──────────────┐
                    │ DEPLOYE !  │   │  │  ROLLBACK    │
                    │ Notification   │  │  automatique  │
                    │ Discord    │   │  │  + alerte     │
                    └────────────┘   │  └──────────────┘
                                     │
                              (Tag de version)
```

---

## 4. Infrastructure as Code

### 4.1 Vue d'ensemble de l'infrastructure

```
┌─────────────────────────────────────────────────────────────────────┐
│                    INFRASTRUCTURE MYTHOS                             │
│                                                                     │
│   ┌────────────────────────┐    ┌────────────────────────────────┐  │
│   │     VERCEL (Frontend)  │    │      RAILWAY (Backend)          │  │
│   │                        │    │                                 │  │
│   │  ┌──────────────────┐  │    │  ┌─────────────────────┐       │  │
│   │  │   Next.js App    │  │    │  │   NestJS App        │       │  │
│   │  │   (SSR + Static) │  │    │  │   (API + WebSocket) │       │  │
│   │  └──────────────────┘  │    │  └──────────┬──────────┘       │  │
│   │                        │    │             │                   │  │
│   │  CDN Edge Network     │    │  ┌──────────┴──────────┐       │  │
│   │  SSL auto             │    │  │                     │       │  │
│   │  Preview deployments  │    │  ▼                     ▼       │  │
│   │                        │    │ ┌───────────┐ ┌────────────┐  │  │
│   └────────────────────────┘    │ │PostgreSQL │ │   Redis    │  │  │
│                                 │ │ (Railway) │ │ (Upstash)  │  │  │
│        ┌──────────────────┐     │ └───────────┘ └────────────┘  │  │
│        │   EXTERNAL APIs  │     │                                │  │
│        │                  │     └────────────────────────────────┘  │
│        │  Anthropic Claude│                                        │
│        │  (IA MJ)         │     ┌────────────────────────────────┐  │
│        └──────────────────┘     │      MONITORING                │  │
│                                 │  UptimeRobot + Railway Logs   │  │
│                                 │  + Anthropic Dashboard         │  │
│                                 └────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────┘
```

### 4.2 Configuration Vercel (Frontend)

**Fichier `vercel.json`** :

```json
{
  "buildCommand": "cd frontend && npm run build",
  "outputDirectory": "frontend/.next",
  "installCommand": "cd frontend && npm ci",
  "framework": "nextjs",
  "regions": ["cdg1"],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        { "key": "X-Content-Type-Options", "value": "nosniff" },
        { "key": "X-Frame-Options", "value": "DENY" },
        { "key": "X-XSS-Protection", "value": "1; mode=block" },
        { "key": "Referrer-Policy", "value": "strict-origin-when-cross-origin" },
        {
          "key": "Content-Security-Policy",
          "value": "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; connect-src 'self' wss://*.railway.app https://*.railway.app https://api.anthropic.com; img-src 'self' data:; font-src 'self';"
        }
      ]
    }
  ],
  "rewrites": [
    {
      "source": "/api/:path*",
      "destination": "https://mythos-backend-production.railway.app/api/:path*"
    }
  ]
}
```

**Configuration Vercel (Settings)** :

| Parametre | Valeur |
|-----------|--------|
| Framework Preset | Next.js |
| Node.js Version | 20.x |
| Build Command | `cd frontend && npm run build` |
| Output Directory | `frontend/.next` |
| Install Command | `cd frontend && npm ci` |
| Root Directory | `/` |
| Region | Paris (cdg1) -- proximite utilisateurs europeens |
| Automatic Deployments | Active sur `main` (production) |
| Preview Deployments | Active sur toutes les PR |

### 4.3 Configuration Railway (Backend)

**Fichier `railway.toml`** (dans le dossier backend) :

```toml
[build]
builder = "nixpacks"
buildCommand = "npm ci && npx prisma generate && npm run build"

[deploy]
startCommand = "npx prisma migrate deploy && node dist/main.js"
healthcheckPath = "/api/health"
healthcheckTimeout = 30
restartPolicyType = "on_failure"
restartPolicyMaxRetries = 3
numReplicas = 1

[service]
internalPort = 3001
```

**Services Railway** :

| Service | Type | Configuration |
|---------|------|---------------|
| `mythos-backend-staging` | Web Service | Node.js, port 3001, branche staging |
| `mythos-backend-production` | Web Service | Node.js, port 3001, branche main |
| `mythos-postgres-staging` | PostgreSQL | v16, 1GB storage |
| `mythos-postgres-production` | PostgreSQL | v16, 5GB storage, backups quotidiens |

### 4.4 Configuration Redis (Upstash)

| Parametre | Staging | Production |
|-----------|---------|------------|
| Region | eu-west-1 (Ireland) | eu-west-1 (Ireland) |
| Type | Pay as you go | Pay as you go |
| Max Daily Commands | 10,000 | 100,000 |
| Max Data Size | 256 MB | 1 GB |
| Eviction Policy | `allkeys-lru` | `allkeys-lru` |
| TLS | Active | Active |
| Max Connections | 100 | 1,000 |

### 4.5 Variables d'environnement

**IMPORTANT** : Les valeurs ne sont JAMAIS commitees dans le code. Elles sont configurees dans les settings de chaque service (Vercel, Railway, Upstash).

#### Variables Backend (NestJS)

| Variable | Description | Environnements |
|----------|-------------|-----------------|
| `NODE_ENV` | Environnement d'execution | `development` / `staging` / `production` |
| `PORT` | Port du serveur NestJS | `3001` |
| `DATABASE_URL` | URL de connexion PostgreSQL (Prisma) | Tous |
| `REDIS_URL` | URL de connexion Redis (Upstash) | Tous |
| `JWT_SECRET` | Secret de signature des tokens JWT | Tous |
| `JWT_EXPIRATION` | Duree de validite du JWT | `24h` |
| `ANTHROPIC_API_KEY` | Cle API Anthropic pour Claude | Tous |
| `ANTHROPIC_MODEL_NARRATION` | Modele pour la narration | `claude-sonnet-4-20250514` |
| `ANTHROPIC_MODEL_SIMPLE` | Modele pour les phases simples | `claude-haiku-4-20250514` |
| `ANTHROPIC_MAX_TOKENS` | Tokens max par appel IA | `2048` |
| `CORS_ORIGIN` | Domaine(s) autorise(s) pour CORS | URL frontend |
| `WS_CORS_ORIGIN` | Domaine(s) autorise(s) pour WebSocket | URL frontend |
| `RATE_LIMIT_TTL` | Fenetre de rate limiting (secondes) | `60` |
| `RATE_LIMIT_MAX` | Nombre max de requetes par fenetre | `100` |
| `AI_COST_LIMIT_DAILY` | Limite de cout IA quotidien (USD) | `5.00` |
| `SESSION_TTL_SECONDS` | Duree de vie d'une session Redis | `7200` (2h) |
| `LOG_LEVEL` | Niveau de log | `debug` / `info` / `warn` |

#### Variables Frontend (Next.js)

| Variable | Description | Environnements |
|----------|-------------|-----------------|
| `NEXT_PUBLIC_API_URL` | URL de l'API backend | Tous |
| `NEXT_PUBLIC_WS_URL` | URL du WebSocket backend | Tous |
| `NEXT_PUBLIC_APP_NAME` | Nom de l'application | `MYTHOS` |
| `NEXT_PUBLIC_APP_ENV` | Environnement courant | `development` / `staging` / `production` |
| `NEXT_PUBLIC_ENABLE_ANALYTICS` | Activer les analytics | `false` / `true` |

#### Variables CI/CD (GitHub Secrets)

| Secret | Description |
|--------|-------------|
| `VERCEL_TOKEN` | Token d'authentification Vercel |
| `VERCEL_ORG_ID` | ID de l'organisation Vercel |
| `VERCEL_PROJECT_ID` | ID du projet Vercel |
| `RAILWAY_TOKEN_STAGING` | Token Railway pour le service staging |
| `RAILWAY_TOKEN_PRODUCTION` | Token Railway pour le service production |
| `PRODUCTION_DATABASE_URL` | URL PostgreSQL de production (pour les migrations CI) |
| `DISCORD_WEBHOOK_URL` | Webhook Discord pour les notifications |

---

## 5. Plan de migration de donnees (Prisma)

### 5.1 Strategie de migration

```
┌─────────────────────────────────────────────────────────────────────┐
│                STRATEGIE DE MIGRATION PRISMA                        │
│                                                                     │
│  ┌──────────────┐                                                   │
│  │ Developpeur  │                                                   │
│  │ modifie      │                                                   │
│  │ schema.prisma│                                                   │
│  └──────┬───────┘                                                   │
│         │                                                           │
│         ▼                                                           │
│  ┌──────────────────────┐                                           │
│  │ npx prisma migrate   │ ← Genere un fichier SQL de migration      │
│  │ dev --name <nom>     │   dans prisma/migrations/                  │
│  └──────┬───────────────┘                                           │
│         │                                                           │
│         ▼                                                           │
│  ┌──────────────────────┐                                           │
│  │ Test en local        │ ← La migration est appliquee localement   │
│  │ (auto-appliquee)     │   et le developpeur verifie               │
│  └──────┬───────────────┘                                           │
│         │                                                           │
│         ▼                                                           │
│  ┌──────────────────────┐                                           │
│  │ Commit + PR          │ ← Le fichier de migration est commite     │
│  │ (migration incluse)  │   avec le code                            │
│  └──────┬───────────────┘                                           │
│         │                                                           │
│         ▼                                                           │
│  ┌──────────────────────┐                                           │
│  │ CI : prisma migrate  │ ← En staging/prod, la migration est       │
│  │ deploy               │   appliquee au deploiement                │
│  └──────────────────────┘                                           │
│                                                                     │
│  REGLES :                                                           │
│  - JAMAIS de prisma migrate dev en staging/production                │
│  - TOUJOURS prisma migrate deploy en staging/production              │
│  - JAMAIS de modification manuelle des fichiers de migration         │
│  - Une migration = un fichier SQL immutable                          │
│  - Les migrations destructrices (DROP, ALTER) doivent etre           │
│    validees par 2 reviewers                                          │
└─────────────────────────────────────────────────────────────────────┘
```

### 5.2 Convention de nommage des migrations

Format : `YYYYMMDDHHMMSS_<description_en_snake_case>`

Exemples :
- `20260201120000_init_schema`
- `20260215143000_add_game_round_table`
- `20260220160000_add_resources_to_game_state`
- `20260301090000_add_user_preferences`

### 5.3 Migrations prevues par sprint

| Sprint | Migration | Description | Risque |
|--------|-----------|-------------|--------|
| Sprint 1 | `init_schema` | Schema initial : User, GameSession, ScenarioPack, Player, GameRound, PlayerChoice | Faible (creation) |
| Sprint 1 | `add_scenario_seeds` | Insertion des Scenario Packs TRIBUNAL et DEEP | Faible (insert) |
| Sprint 2 | `add_game_state_fields` | Ajout de champs au GameSession (game_state JSON, current_phase) | Faible (ajout) |
| Sprint 3 | `add_session_code_index` | Index unique sur le code de session (performance lookup) | Faible (index) |
| Sprint 4 | `add_player_reconnection_fields` | Ajout champs reconnection (last_seen, reconnect_token) | Faible (ajout) |
| Sprint 5 | `add_admin_stats_views` | Vues materialisees pour les statistiques admin | Moyen (vue) |

### 5.4 Procedure de rollback

```
SITUATION : Une migration echoue en staging ou production

ETAPE 1 : Ne pas paniquer. Le deploiement est automatiquement arrete.

ETAPE 2 : Diagnostiquer l'erreur dans les logs Railway.

ETAPE 3 : Selon la situation :

  CAS A : Migration echouee AVANT application (erreur de syntaxe SQL)
  ┗━ Corriger le fichier de migration en local
  ┗━ Recree la migration avec prisma migrate dev
  ┗━ Commiter et redeployer

  CAS B : Migration partiellement appliquee (erreur en cours)
  ┗━ Se connecter a la base de donnees
  ┗━ Verifier l'etat de la table _prisma_migrations
  ┗━ Executer manuellement les rollback SQL si necessaire
  ┗━ Marquer la migration comme rollbackee
  ┗━ Corriger et redeployer

  CAS C : Migration appliquee mais le code ne fonctionne pas
  ┗━ Deployer une migration corrective (jamais supprimer une migration)
  ┗━ Creer une nouvelle migration qui annule les changements

REGLE D'OR : On ne supprime JAMAIS un fichier de migration.
             On cree TOUJOURS une migration corrective.
```

### 5.5 Seeds (donnees initiales)

**Fichier** : `prisma/seed.ts`

```typescript
// Structure des seeds MYTHOS
// Execution : npx prisma db seed

async function main() {
  // 1. Creer l'utilisateur admin
  await prisma.user.upsert({
    where: { email: 'admin@mythos.game' },
    update: {},
    create: {
      username: 'admin',
      email: 'admin@mythos.game',
      passwordHash: await bcrypt.hash('admin_password', 10),
      role: 'ADMIN',
    },
  });

  // 2. Creer les utilisateurs de test (dev/staging uniquement)
  if (process.env.NODE_ENV !== 'production') {
    for (let i = 1; i <= 5; i++) {
      await prisma.user.upsert({
        where: { email: `player${i}@test.com` },
        update: {},
        create: {
          username: `TestPlayer${i}`,
          email: `player${i}@test.com`,
          passwordHash: await bcrypt.hash('test1234', 10),
          role: 'PLAYER',
        },
      });
    }
  }

  // 3. Inserer les Scenario Packs
  await prisma.scenarioPack.upsert({
    where: { slug: 'tribunal' },
    update: { /* mise a jour config si changee */ },
    create: { /* Scenario Pack TRIBUNAL complet */ },
  });

  await prisma.scenarioPack.upsert({
    where: { slug: 'deep' },
    update: { /* mise a jour config si changee */ },
    create: { /* Scenario Pack DEEP complet */ },
  });
}
```

**Regles des seeds** :
- Utilisation de `upsert` pour l'idempotence (execution multiple sans erreur)
- Les donnees de test (joueurs fictifs) ne sont jamais creees en production
- Les Scenario Packs sont versionnes et mis a jour automatiquement
- Le seed est execute automatiquement apres `prisma migrate deploy` en staging

---

## 6. Strategie de feature flags

### 6.1 Objectif

Les feature flags permettent de :
- Deployer du code en production sans l'activer immediatement
- Tester des fonctionnalites avec un sous-ensemble d'utilisateurs
- Desactiver rapidement une fonctionnalite problematique sans rollback

### 6.2 Implementation

Pour le MVP, nous utilisons une approche legere basee sur des variables d'environnement et une table de configuration en base de donnees.

**Table `FeatureFlag`** :

```prisma
model FeatureFlag {
  id          String   @id @default(uuid())
  key         String   @unique
  enabled     Boolean  @default(false)
  description String?
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
}
```

**Service `FeatureFlagService`** :

```typescript
@Injectable()
export class FeatureFlagService {
  async isEnabled(key: string): Promise<boolean> {
    // 1. Verifier le cache Redis (TTL 60s)
    // 2. Si absent, requeter la BDD
    // 3. Mettre en cache et retourner
  }
}
```

### 6.3 Feature flags prevus

| Flag | Description | Sprint d'activation |
|------|-------------|---------------------|
| `FEATURE_AI_STREAMING` | Active le streaming des reponses IA | Sprint 4 |
| `FEATURE_SCENARIO_DEEP` | Active le scenario DEEP dans le catalogue | Sprint 4 |
| `FEATURE_ADMIN_PANEL` | Active l'acces au panel d'administration | Sprint 5 |
| `FEATURE_RECONNECTION` | Active la reconnexion joueur | Sprint 4 |
| `FEATURE_EXTENDED_TIMERS` | Active l'option timers prolonges (accessibilite) | Sprint 5 |
| `FEATURE_ANALYTICS` | Active la collecte de statistiques d'usage | Sprint 5 |

### 6.4 Processus d'activation

```
1. Le code est deploye avec le flag desactive (enabled: false)
2. L'equipe teste en staging avec le flag active manuellement
3. En Sprint Review, le PO valide la fonctionnalite
4. Le flag est active en production via l'API admin
5. Monitoring : si probleme, le flag est desactive immediatement
6. Quand la fonctionnalite est stable, le flag est retire du code (nettoyage)
```

---

## 7. Plan de mise en production

### 7.1 Checklist pre-deploiement

Avant chaque mise en production, l'equipe passe en revue la checklist suivante :

#### Tests et qualite

- [ ] Tous les tests unitaires passent en CI (backend > 60%, frontend > 40%)
- [ ] Tous les tests d'integration passent
- [ ] Les tests E2E passent sur l'environnement staging
- [ ] Le code a ete review et approuve par au moins 1 membre (2 pour main)
- [ ] Aucune regression n'a ete detectee sur les flux existants
- [ ] Le lint passe sans erreur ni warning

#### Fonctionnel

- [ ] Kays (Product Owner) a valide les fonctionnalites sur staging
- [ ] Les criteres d'acceptation des tickets sont tous satisfaits
- [ ] Les flux critiques ont ete testes manuellement :
  - [ ] Inscription / Connexion
  - [ ] Creation de session / Lobby
  - [ ] Partie complete TRIBUNAL (5 tours)
  - [ ] Partie complete DEEP (avec jauges)
  - [ ] Ecran de fin avec revelations
- [ ] Le responsive a ete verifie (mobile + desktop)

#### Infrastructure

- [ ] Les variables d'environnement de production sont configurees
- [ ] Les migrations Prisma sont incluses et testees sur staging
- [ ] Le health check du backend repond 200 sur staging
- [ ] Les quotas API Anthropic sont suffisants
- [ ] Les quotas Redis Upstash sont suffisants
- [ ] Le certificat SSL est valide

#### Securite

- [ ] `npm audit` ne signale aucune vulnerabilite haute ou critique
- [ ] Aucune donnee sensible n'est exposee dans le code (cles API, mots de passe)
- [ ] Les endpoints sont correctement proteges (auth guards)
- [ ] Le rate limiting est configure
- [ ] Les headers de securite sont presents (CSP, X-Frame-Options, etc.)

#### Documentation

- [ ] Le changelog est a jour
- [ ] La documentation API est a jour (si nouveaux endpoints)
- [ ] Le README est a jour (si changement de procedure)

#### Communication

- [ ] L'equipe est informee du deploiement prevu
- [ ] Un creneaux de deploiement est defini (heures d'activite de l'equipe)
- [ ] Le plan de rollback est clair et pret

### 7.2 Procedure de deploiement

```
PROCEDURE DE MISE EN PRODUCTION

T-30min : Annonce sur Discord "#deployments"
          "Deploiement v1.x.x prevu dans 30 minutes. Checklist validee."

T-15min : Verification finale staging
          - Derniere partie de test jouee sur staging
          - Tous les flags de feature configures

T-0    : Merge PR staging → main
          - Le pipeline CI/CD se declenche automatiquement
          - L'equipe monitore le pipeline dans GitHub Actions

T+5min : Verification du pipeline
          - CI verte ?
          - Deploy backend lance ?
          - Migrations appliquees ?
          - Deploy frontend lance ?

T+10min : Smoke tests automatiques
          - Health check backend → 200 ?
          - Page d'accueil frontend → 200 ?
          - Tests E2E smoke → OK ?

T+15min : Verification manuelle
          - Se connecter a la production
          - Creer une session test
          - Verifier le WebSocket
          - Jouer 1-2 tours d'une partie

T+20min : Confirmation
          - "Deploiement v1.x.x reussi. Tout est nominal."
          - Creer le tag Git : git tag v1.x.x
          - Mettre a jour le changelog

OU

T+10min : ROLLBACK (si smoke tests KO)
          - Voir procedure de rollback ci-dessous
```

### 7.3 Procedure de rollback

```
┌─────────────────────────────────────────────────────────────────────┐
│                    PROCEDURE DE ROLLBACK                            │
│                                                                     │
│  DECLENCHEUR :                                                      │
│  - Smoke tests echoues                                              │
│  - Health check backend KO                                          │
│  - Erreur critique detectee par l'equipe                            │
│  - Taux d'erreur > 5% dans les logs                                 │
│                                                                     │
│  ETAPES :                                                           │
│                                                                     │
│  1. COMMUNICATION                                                   │
│     ┗━ Annonce immediate sur Discord : "ROLLBACK EN COURS"          │
│     ┗━ Personne ne merge rien pendant le rollback                   │
│                                                                     │
│  2. ROLLBACK FRONTEND (Vercel)                                      │
│     ┗━ Dashboard Vercel → Deployments → Clic "Promote to           │
│        Production" sur le deploiement precedent                     │
│     ┗━ Instantane (< 30 secondes)                                   │
│                                                                     │
│  3. ROLLBACK BACKEND (Railway)                                      │
│     ┗━ Dashboard Railway → Deployments → "Rollback" sur le          │
│        deploiement precedent                                        │
│     ┗━ Ou : git revert du merge commit + push sur main              │
│     ┗━ Duree : 2-3 minutes                                         │
│                                                                     │
│  4. ROLLBACK DATABASE (si migration problematique)                  │
│     ┗━ Executer le script de rollback SQL prepare                   │
│     ┗━ Ou : creer une migration corrective                         │
│     ┗━ ATTENTION : les migrations destructrices (DROP) ne           │
│        sont PAS reversibles automatiquement                         │
│                                                                     │
│  5. VERIFICATION POST-ROLLBACK                                      │
│     ┗━ Health check backend → 200 ?                                 │
│     ┗━ Frontend accessible ?                                        │
│     ┗━ Partie de test jouable ?                                     │
│                                                                     │
│  6. POST-MORTEM                                                     │
│     ┗━ Dans les 24h : analyse de la cause racine                    │
│     ┗━ Document : "Que s'est-il passe ? Pourquoi ? Comment          │
│        eviter a l'avenir ?"                                         │
│     ┗━ Actions correctives integrees au backlog                     │
│                                                                     │
│  TEMPS CIBLE DE ROLLBACK COMPLET : < 10 minutes                    │
└─────────────────────────────────────────────────────────────────────┘
```

### 7.4 Validation post-deploiement

Apres chaque deploiement reussi, la checklist suivante est validee :

- [ ] Health check backend : `GET /api/health` → 200
- [ ] Page d'accueil frontend accessible et fonctionnelle
- [ ] Catalogue de scenarios affiche (TRIBUNAL + DEEP)
- [ ] Inscription d'un nouveau compte : OK
- [ ] Connexion avec un compte existant : OK
- [ ] Creation d'une session de jeu : OK
- [ ] WebSocket connexion dans le lobby : OK
- [ ] Envoi d'un message dans le chat lobby : OK
- [ ] Lancement d'une partie (si possible avec 2+ testeurs) : OK
- [ ] Narration IA generee correctement : OK
- [ ] Monitoring : aucune erreur dans les logs des 15 dernieres minutes
- [ ] Performance : temps de reponse API < 500ms (hors IA)
- [ ] Performance : temps de reponse IA < 5s

---

## 8. Documentation des environnements

### 8.1 URLs et acces

| Environnement | Service | URL | Acces |
|---------------|---------|-----|-------|
| **Local** | Frontend | `http://localhost:3000` | Developpeur uniquement |
| **Local** | Backend API | `http://localhost:3001/api` | Developpeur uniquement |
| **Local** | PostgreSQL | `localhost:5432` | `mythos` / `mythos_dev_password` |
| **Local** | Redis | `localhost:6379` | Pas de mot de passe |
| **Local** | Prisma Studio | `http://localhost:5555` | `npx prisma studio` |
| **Staging** | Frontend | `https://mythos-staging.vercel.app` | Equipe (lien preview Vercel) |
| **Staging** | Backend API | `https://mythos-backend-staging.railway.app/api` | Equipe |
| **Staging** | Backend Health | `https://mythos-backend-staging.railway.app/api/health` | Public |
| **Production** | Frontend | `https://mythos.game` (ou `https://mythos.vercel.app`) | Public |
| **Production** | Backend API | `https://mythos-backend.railway.app/api` | Public (via CORS) |
| **Production** | Backend Health | `https://mythos-backend.railway.app/api/health` | Public |

### 8.2 Acces aux dashboards

| Dashboard | URL | Qui y accede |
|-----------|-----|-------------|
| Vercel Dashboard | `https://vercel.com/team/mythos` | Yassir (DevOps) + Kays (Architecte) |
| Railway Dashboard | `https://railway.app/project/mythos` | Yassir (DevOps) + Kays (Architecte) |
| Upstash Console | `https://console.upstash.com` | Yassir (DevOps) + Kays (Architecte) |
| Anthropic Console | `https://console.anthropic.com` | Kays (Architecte) + Samy (IA) |
| UptimeRobot | `https://uptimerobot.com/dashboard` | Toute l'equipe |
| GitHub Actions | `https://github.com/team/mythos/actions` | Toute l'equipe |
| GitHub Projects | `https://github.com/orgs/team/projects/1` | Toute l'equipe |

### 8.3 Configuration reseau

```
┌────────────────────────────────────────────────────────┐
│                   FLUX RESEAU                           │
│                                                        │
│  Navigateur                                            │
│    │                                                   │
│    ├──HTTPS──> Vercel CDN ──> Next.js SSR              │
│    │           (frontend)                              │
│    │                                                   │
│    ├──HTTPS──> Railway                                 │
│    │           (REST API)                              │
│    │           /api/*                                  │
│    │                                                   │
│    └──WSS───> Railway                                  │
│               (WebSocket Socket.io)                    │
│               /socket.io/*                             │
│                                                        │
│  Railway Backend                                       │
│    │                                                   │
│    ├──TCP──> Railway PostgreSQL (port 5432, SSL)       │
│    │         (interne, pas d'acces public)             │
│    │                                                   │
│    ├──TLS──> Upstash Redis (port 6379, TLS)           │
│    │         (connexion securisee)                     │
│    │                                                   │
│    └──HTTPS──> Anthropic API                           │
│               (api.anthropic.com)                      │
│               (cle API en variable d'environnement)    │
└────────────────────────────────────────────────────────┘

PORTS :
- Frontend Vercel : 443 (HTTPS) -- gere par Vercel
- Backend Railway : 443 (HTTPS) + WSS -- gere par Railway
- PostgreSQL : 5432 (interne Railway uniquement)
- Redis Upstash : 6379 (TLS, externe)
```

---

## 9. Procedure d'onboarding technique

### 9.1 Pre-requis

Avant de commencer, le nouveau developpeur doit avoir installe :

| Outil | Version minimale | Commande de verification |
|-------|-----------------|-------------------------|
| **Node.js** | 20.x LTS | `node --version` |
| **npm** | 10.x | `npm --version` |
| **Git** | 2.40+ | `git --version` |
| **Docker Desktop** | 4.x | `docker --version` |
| **Docker Compose** | 2.x | `docker compose version` |
| **VS Code** (recommande) | Derniere version | - |

**Extensions VS Code recommandees** :
- ESLint
- Prettier - Code formatter
- Tailwind CSS IntelliSense
- Prisma
- GitLens
- Thunder Client (ou Postman)
- Auto Rename Tag

### 9.2 Procedure pas a pas

```
ONBOARDING TECHNIQUE MYTHOS
============================

Duree estimee : 1h30 - 2h

ETAPE 1 : Acces (5 min)
──────────────────────────
1. Etre ajoute a l'organisation GitHub du projet
2. Cloner le repository :
   git clone https://github.com/team/mythos.git
   cd mythos

3. Verifier l'acces aux branches :
   git branch -a
   → Vous devez voir main, staging, develop

4. Se positionner sur develop :
   git checkout develop


ETAPE 2 : Infrastructure locale (10 min)
──────────────────────────────────────────
1. Lancer les services Docker :
   docker compose -f docker-compose.dev.yml up -d

2. Verifier que PostgreSQL et Redis sont lances :
   docker compose -f docker-compose.dev.yml ps
   → postgres : Up, redis : Up

3. Verifier la connexion PostgreSQL :
   docker exec -it mythos-postgres psql -U mythos -d mythos_dev -c "SELECT 1;"


ETAPE 3 : Configuration Backend (15 min)
──────────────────────────────────────────
1. cd backend

2. Installer les dependances :
   npm ci

3. Copier le fichier d'environnement :
   cp .env.example .env.local

4. Remplir les variables dans .env.local :
   - DATABASE_URL=postgresql://mythos:mythos_dev_password@localhost:5432/mythos_dev
   - REDIS_URL=redis://localhost:6379
   - JWT_SECRET=dev-secret-change-me
   - ANTHROPIC_API_KEY=sk-ant-... (demander a l'equipe)

5. Generer le client Prisma :
   npx prisma generate

6. Appliquer les migrations :
   npx prisma migrate dev

7. Executer les seeds :
   npx prisma db seed

8. Verifier avec Prisma Studio :
   npx prisma studio
   → Ouvrir http://localhost:5555
   → Vous devez voir les tables User, ScenarioPack, etc.

9. Lancer le backend :
   npm run start:dev

10. Verifier le health check :
    curl http://localhost:3001/api/health
    → { "status": "ok", "timestamp": "..." }


ETAPE 4 : Configuration Frontend (10 min)
───────────────────────────────────────────
1. cd ../frontend (depuis la racine)

2. Installer les dependances :
   npm ci

3. Copier le fichier d'environnement :
   cp .env.example .env.local

4. Remplir les variables :
   - NEXT_PUBLIC_API_URL=http://localhost:3001/api
   - NEXT_PUBLIC_WS_URL=http://localhost:3001

5. Lancer le frontend :
   npm run dev

6. Ouvrir http://localhost:3000
   → La page d'accueil MYTHOS doit s'afficher


ETAPE 5 : Verification complete (15 min)
──────────────────────────────────────────
1. S'inscrire via l'interface (ou utiliser un compte test)
   Email: player1@test.com / Mot de passe: test1234

2. Verifier que le catalogue des scenarios s'affiche

3. Lancer les tests backend :
   cd backend && npm test

4. Lancer les tests frontend :
   cd ../frontend && npm test

5. Lancer le lint :
   cd backend && npm run lint
   cd ../frontend && npm run lint

6. Tout doit etre vert !


ETAPE 6 : Configuration Git (5 min)
─────────────────────────────────────
1. Configurer le template de commit (optionnel mais recommande) :
   git config commit.template .gitmessage

2. Verifier que les hooks pre-commit sont actifs :
   ls .husky/
   → pre-commit (lint-staged)

3. Creer une branche de test :
   git checkout -b feature/test-onboarding
   # Faire un petit changement
   git add .
   git commit -m "chore: test onboarding setup"
   # Le lint-staged doit s'executer automatiquement
   # Supprimer la branche ensuite :
   git checkout develop
   git branch -D feature/test-onboarding


ETAPE 7 : Decouverte du projet (30 min)
─────────────────────────────────────────
1. Lire le README.md du projet

2. Parcourir les documents cles :
   - CAHIER_DES_CHARGES.md (vision produit, architecture)
   - 01-faisabilite/GAME_ENGINE_CORE.md (moteur de jeu)
   - 04-plan-projet/BACKLOG_DETAILLE.md (tous les tickets)

3. Explorer la structure du code :
   backend/
   ├── src/
   │   ├── modules/          ← Modules NestJS (auth, game, session, ai...)
   │   ├── common/           ← Guards, pipes, decorators partages
   │   ├── config/           ← Configuration centralisee
   │   └── main.ts           ← Point d'entree
   ├── prisma/
   │   ├── schema.prisma     ← Schema de donnees
   │   ├── migrations/       ← Fichiers de migration SQL
   │   └── seed.ts           ← Donnees initiales
   └── test/                 ← Tests d'integration

   frontend/
   ├── app/                  ← Pages Next.js (App Router)
   ├── components/           ← Composants React reutilisables
   ├── lib/                  ← Utilitaires, API client, helpers
   ├── stores/               ← Stores Zustand (etat global)
   └── types/                ← Types TypeScript partages

4. Consulter le board GitHub Projects :
   → Kanban avec les tickets du sprint en cours

5. Consulter les PR recentes pour comprendre le style de code


ETAPE 8 : Premier ticket (variable)
─────────────────────────────────────
1. Samy (Scrum Master) vous assigne un ticket "starter" (petit, bien defini)
2. Creer la branche : git checkout -b feature/SX-XX-description
3. Developper, tester, commiter (Conventional Commits)
4. Ouvrir une PR vers develop
5. Demander une review a un membre de l'equipe
6. Bienvenue dans l'equipe MYTHOS !
```

### 9.3 Contacts et support

| Besoin | Qui contacter | Canal |
|--------|-------------|-------|
| Probleme Git / CI/CD | Yassir (DevOps) | Discord #tech-help |
| Question architecture backend | Kays (Architecte) / Samy (Backend) | Discord #backend |
| Question frontend / UI | Youri (Frontend) | Discord #frontend |
| Question IA / prompts | Samy (IA/Temps reel) | Discord #ai-service |
| Question produit / priorite | Kays (Product Owner) | Discord #product |
| Acces manquant | Samy (Scrum Master) | Discord #general |
| Cle API Anthropic | Kays (Architecte) | Message prive Discord |

### 9.4 Ressources d'apprentissage

| Sujet | Ressource |
|-------|-----------|
| Next.js 14 App Router | [https://nextjs.org/docs](https://nextjs.org/docs) |
| NestJS | [https://docs.nestjs.com](https://docs.nestjs.com) |
| Prisma | [https://www.prisma.io/docs](https://www.prisma.io/docs) |
| Socket.io | [https://socket.io/docs](https://socket.io/docs) |
| TailwindCSS | [https://tailwindcss.com/docs](https://tailwindcss.com/docs) |
| Zustand | [https://github.com/pmndrs/zustand](https://github.com/pmndrs/zustand) |
| Anthropic Claude API | [https://docs.anthropic.com](https://docs.anthropic.com) |
| Conventional Commits | [https://www.conventionalcommits.org](https://www.conventionalcommits.org) |
| Scrum Guide | [https://scrumguides.org](https://scrumguides.org) |

---

## Annexe A : Arborescence complete du repository

```
mythos/
├── .github/
│   ├── workflows/
│   │   ├── ci.yml                    ← Workflow CI (lint, tests, build)
│   │   ├── deploy-staging.yml        ← Workflow deploy staging
│   │   ├── deploy-production.yml     ← Workflow deploy production
│   │   └── scheduled.yml             ← Workflow audits quotidiens
│   ├── PULL_REQUEST_TEMPLATE.md      ← Template de PR
│   └── ISSUE_TEMPLATE/
│       ├── bug_report.md
│       ├── feature_request.md
│       └── task.md
├── frontend/
│   ├── app/                          ← Next.js App Router (pages)
│   ├── components/                   ← Composants React
│   ├── lib/                          ← Utilitaires, API client
│   ├── stores/                       ← Zustand stores
│   ├── types/                        ← Types TypeScript
│   ├── public/                       ← Assets statiques
│   ├── __tests__/                    ← Tests Vitest
│   ├── next.config.js
│   ├── tailwind.config.ts
│   ├── tsconfig.json
│   ├── package.json
│   └── .env.example
├── backend/
│   ├── src/
│   │   ├── modules/
│   │   │   ├── auth/                 ← Module authentification
│   │   │   ├── game/                 ← Module Game Engine
│   │   │   ├── session/              ← Module Session/Lobby
│   │   │   ├── ai/                   ← Module AI Service
│   │   │   ├── scenario/             ← Module Scenario Packs
│   │   │   ├── admin/                ← Module Administration
│   │   │   └── websocket/            ← Module WebSocket Gateway
│   │   ├── common/                   ← Guards, pipes, decorators
│   │   ├── config/                   ← Configuration
│   │   └── main.ts
│   ├── prisma/
│   │   ├── schema.prisma
│   │   ├── migrations/
│   │   └── seed.ts
│   ├── test/                         ← Tests d'integration
│   ├── railway.toml
│   ├── tsconfig.json
│   ├── package.json
│   └── .env.example
├── e2e/
│   ├── tests/                        ← Tests Playwright E2E
│   ├── playwright.config.ts
│   └── package.json
├── docs/
│   ├── api/                          ← Documentation API
│   ├── scenario-packs/               ← Documentation Scenario Packs
│   └── architecture/                 ← Diagrammes d'architecture
├── docker-compose.dev.yml            ← Services Docker pour le dev local
├── vercel.json                       ← Configuration Vercel
├── .gitignore
├── .gitmessage                       ← Template de commit
├── .husky/
│   └── pre-commit                    ← Hook lint-staged
├── README.md
└── CHANGELOG.md
```

---

## Annexe B : Commandes utiles

| Commande | Description |
|----------|-------------|
| `docker compose -f docker-compose.dev.yml up -d` | Lancer PostgreSQL + Redis en local |
| `docker compose -f docker-compose.dev.yml down` | Arreter les services Docker |
| `cd backend && npm run start:dev` | Lancer le backend en mode dev (watch) |
| `cd frontend && npm run dev` | Lancer le frontend en mode dev (HMR) |
| `cd backend && npx prisma migrate dev --name <nom>` | Creer une migration |
| `cd backend && npx prisma migrate deploy` | Appliquer les migrations |
| `cd backend && npx prisma db seed` | Executer les seeds |
| `cd backend && npx prisma studio` | Ouvrir l'interface Prisma Studio |
| `cd backend && npm test` | Lancer les tests backend |
| `cd frontend && npm test` | Lancer les tests frontend |
| `cd backend && npm test -- --coverage` | Tests avec rapport de couverture |
| `cd backend && npm run lint` | Lancer le lint backend |
| `cd frontend && npm run lint` | Lancer le lint frontend |
| `cd e2e && npx playwright test` | Lancer les tests E2E |
| `cd e2e && npx playwright test --ui` | Lancer les tests E2E avec interface |

---

> **Document maintenu par** : Kays (Architecte) / Yassir (DevOps)
> **Derniere mise a jour** : Sprint 0 – Fevrier 2026
> **Prochaine revue** : Sprint 2 (mise a jour post-deploiement staging)
