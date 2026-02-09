# Cahier des Charges – MYTHOS

## Plateforme de jeux narratifs multijoueur avec IA Maître du Jeu

> **Projet** : MYTHOS
> **Version** : 1.0
> **Date** : 12 Février 2026
> **Équipe** : Kays ZAHIDI (PO/Architecte), Samy ZEROUALI (SM/Backend + IA + Temps réel), Youri EMMANUEL (Frontend), Yassir SABBAR (Frontend/UX-UI + DevOps)
> **Contexte** : Workshop 5A TL – S1 – Bloc 1 RNCP38822

---

## Table des matières

1. [Contexte et objectifs du projet](#1-contexte-et-objectifs-du-projet)
2. [Étude de faisabilité](#2-étude-de-faisabilité-c11)
3. [Veille technologique et concurrentielle](#3-veille-technologique-et-concurrentielle-c12)
4. [Architecture logicielle proposée](#4-architecture-logicielle-proposée-c13)
5. [Spécifications fonctionnelles du MVP](#5-spécifications-fonctionnelles-du-mvp-c13)
6. [Spécifications techniques](#6-spécifications-techniques-c13)
7. [Analyse des risques](#7-analyse-des-risques-c11-c15)
8. [Feuille de route du projet](#8-feuille-de-route-du-projet-c14)
9. [Indicateurs de performance (KPI)](#9-indicateurs-de-performance-kpi-c16)
10. [Contraintes réglementaires, accessibilité et numérique durable](#10-contraintes-réglementaires-accessibilité-et-numérique-durable)
11. [Pilotage et supervision du projet](#11-pilotage-et-supervision-du-projet-c17)

---

## 1. Contexte et objectifs du projet

### 1.1 Présentation générale

En tant que chef de projet et architecte technique de l'equipe MYTHOS, j'ai redige ce cahier des charges qui regroupe tout notre travail de conception, de recherche et de planification. C'est notre document de reference pour le dev de la plateforme, et il repond aux exigences du Bloc 1 du referentiel RNCP38822.

**Projet** : MYTHOS – Plateforme de jeux narratifs multijoueur avec IA Maître du Jeu

**Entreprise commanditaire** : Mythos Interactive (SAS fictive)

Mythos Interactive est un studio de jeux indépendant spécialisé dans les expériences narratives numériques. L'entreprise souhaite développer une plateforme web innovante permettant à des joueurs connectés simultanément de vivre des aventures narratives immersives, pilotées en temps réel par une intelligence artificielle jouant le rôle de Maître du Jeu.

**Concept central** : Un seul moteur de jeu universel, une seule boucle de gameplay. L'IA Maître du Jeu reçoit un "Scenario Pack" (fichier de configuration + prompt système) et orchestre l'intégralité de l'expérience narrative. Chaque scénario (enquête, procès, survie, intrigues, premier contact...) n'est qu'une configuration différente du même moteur.

### 1.2 Origine du besoin

Le marche du jeu narratif en ligne est en pleine croissance, pousse par plusieurs tendances :

- **Essor de l'IA générative** : Les LLM (Large Language Models) permettent désormais de générer du contenu narratif cohérent et adaptatif en temps réel, ouvrant la voie à des expériences de jeu impossibles auparavant.
- **Succès des jeux sociaux** : Les jeux de déduction sociale (Among Us, Loup-Garou, Time Bomb) ont démontré l'appétit du grand public pour des expériences multijoueur courtes, sociales et accessibles.
- **Gap sur le marché** : Aucune plateforme ne combine actuellement narration IA dynamique, multijoueur synchrone et sessions courtes. Les solutions existantes sont soit solo (AI Dungeon, Character.AI), soit sans IA (Storium), soit sans narration (Among Us).
- **Modularité inexistante** : Aucun concurrent ne propose une plateforme multi-scénarios avec un moteur universel configurable.

### 1.3 Vision produit – MYTHOS

MYTHOS est une plateforme où l'IA est le Maître du Jeu universel. Les joueurs choisissent un scénario, invitent leurs amis, et l'IA raconte, arbitre et surprend.

```
┌──────────────────────────────────────────────────┐
│               MYTHOS - Plateforme                │
│                                                  │
│   ┌──────────┐  ┌──────────┐  ┌──────────┐      │
│   │ CHRONOS  │  │ TRIBUNAL │  │   DEEP   │      │
│   │ Enquête  │  │  Procès  │  │ Survie   │      │
│   │ temporelle│  │  fictif  │  │ sous-marin│     │
│   └──────────┘  └──────────┘  └──────────┘      │
│   ┌──────────┐  ┌──────────┐  ┌──────────┐      │
│   │MASCARADE │  │  SIGNAL  │  │ + futurs │      │
│   │ Intrigues│  │  Alien   │  │ scénarios│      │
│   └──────────┘  └──────────┘  └──────────┘      │
│                                                  │
│       ┌────────────────────────────────┐         │
│       │   Moteur universel MYTHOS      │         │
│       │   + IA Maître du Jeu           │         │
│       └────────────────────────────────┘         │
└──────────────────────────────────────────────────┘
```

**Les 5 scénarios conçus :**

| Scénario | Pitch | Type |
|----------|-------|------|
| **CHRONOS** | Agents temporels enquêtant sur un crime à travers différentes époques. Chaque voyage dans le temps modifie le présent. | Coopératif, enquête |
| **TRIBUNAL** | Procès fictif avec rôles cachés (juge, avocat, procureur, témoins). L'IA anime le procès et révèle des preuves. | Rôles cachés, déduction |
| **DEEP** | Équipage d'un sous-marin en détresse. L'IA (ordinateur de bord) génère des crises et gère les ressources (O2, énergie, coque). | Coopératif, survie, jauges |
| **MASCARADE** | Bal masqué à la Renaissance. Chaque joueur a un objectif secret interconnecté (assassinat, vol, séduction). | Rôles cachés, intrigues |
| **SIGNAL** | Premier contact avec une entité alien. Les joueurs décodent des messages et choisissent comment répondre. | Coopératif, communication |

### 1.4 Objectifs du projet

| Objectif | Description | Mesure de succès |
|----------|-------------|------------------|
| **O1** | Concevoir un moteur de jeu narratif universel et modulaire | Un moteur capable de faire tourner n'importe quel Scenario Pack |
| **O2** | Intégrer une IA comme Maître du Jeu temps réel | L'IA génère narration, choix et résolutions de manière cohérente |
| **O3** | Permettre des sessions multijoueur synchronisées | 2-8 joueurs simultanés par session, latence < 200ms |
| **O4** | Livrer un MVP avec 2 scénarios jouables | TRIBUNAL + DEEP fonctionnels de bout en bout |
| **O5** | Cibler les gamers occasionnels | Sessions de 15-25 min, onboarding < 2 min, zéro installation |

### 1.5 Public cible

**Persona principal** : Gamer occasionnel, 18-35 ans

- Joue principalement sur navigateur / mobile
- Cherche des expériences sociales courtes et engageantes
- Familier avec les jeux de type Loup-Garou, Time Bomb, Among Us
- Apprécie les jeux où la parole, le bluff et la stratégie sociale comptent
- Recherche la simplicité d'accès (pas d'installation, pas de compte obligatoire pour jouer)
- Joue en groupe d'amis (soirées, pauses, en ligne)

**Persona secondaire** : Passionné de jeux de rôle, 20-40 ans

- Connaît les JDR mais manque de temps ou de MJ disponible
- Attiré par l'idée d'un MJ IA toujours disponible
- Intéressé par la rejouabilité infinie (chaque partie est unique)

### 1.6 Périmètre du projet

#### Dans le périmètre – MVP

- Moteur de jeu universel (game loop en 6 phases)
- Système de Scenario Packs (configuration JSON + prompt IA)
- 2 scénarios complets : **TRIBUNAL** et **DEEP**
- Gestion des sessions multijoueur (création, invitation, lobby)
- IA Maître du Jeu (intégration API LLM)
- Système de choix synchronisés (vote, individuel, timer)
- Système de rôles secrets et infos privées par joueur
- Gestion de ressources / jauges (pour DEEP)
- Chat entre joueurs (phase discussion)
- Visualisation de l'état narratif et progression
- Interface utilisateur responsive (mobile-first)
- Interface d'administration basique
- Écran de fin avec révélations et résumé de partie

#### Hors périmètre – Roadmap V2+

- Scénarios CHRONOS, MASCARADE et SIGNAL
- Application mobile native
- Système de monétisation (freemium)
- Éditeur communautaire de Scenario Packs
- Système de classement / ranking
- Mode spectateur
- Enregistrement et replay des parties
- Intégration vocale (voice chat)

---

## 2. Étude de faisabilité (C1.1)

### 2.1 Analyse des besoins et de l'environnement

#### Besoins identifiés

| Besoin | Source | Priorité |
|--------|--------|----------|
| Jouer à des jeux narratifs sans MJ humain | Personas cibles | Critique |
| Sessions courtes et rejouables | Étude marché (gamers occasionnels) | Critique |
| Multijoueur synchrone en temps réel | Concept produit | Critique |
| Variété de scénarios et univers | Différenciation concurrentielle | Élevée |
| Zéro friction d'accès (pas d'installation) | Persona cible | Élevée |
| Chaque partie unique grâce à l'IA | Proposition de valeur | Élevée |

#### Environnement du projet

- **Marché** : Jeu narratif en ligne en croissance, porté par l'IA générative
- **Technologie** : APIs LLM matures (OpenAI, Anthropic), WebSocket bien établi, frameworks web performants
- **Concurrence** : Fragmentée, aucun acteur ne combine tous les axes de MYTHOS
- **Réglementation** : RGPD (données utilisateurs), modération du contenu IA

### 2.2 Faisabilité technique

#### Technologies envisagées

| Composant | Technologie retenue | Justification |
|-----------|-------------------|---------------|
| **Frontend** | Next.js + React | SSR pour le SEO, écosystème riche, performance, équipe compétente |
| **Styling** | TailwindCSS | Rapidité de développement, responsive natif, léger |
| **Backend** | NestJS (Node.js) | Architecture modulaire, TypeScript natif, WebSocket intégré, adapté au temps réel |
| **Base de données** | PostgreSQL | Robuste, requêtes complexes, données relationnelles (users, sessions, historiques) |
| **Cache / Sessions** | Redis | Stockage du game_state en temps réel, faible latence, pub/sub pour WebSocket |
| **Temps réel** | Socket.io | Abstraction WebSocket fiable, rooms natives (1 room = 1 session de jeu), reconnexion auto |
| **IA Générative** | API Anthropic (Claude) | Qualité narrative supérieure, bonne compréhension contextuelle, output structuré JSON fiable |
| **ORM** | Prisma | Type-safe, migrations simples, compatible PostgreSQL |
| **CI/CD** | GitHub Actions | Intégré à GitHub, gratuit pour les repos publics |
| **Hébergement** | Vercel (front) + Railway (back) | Tiers gratuits suffisants pour le MVP, déploiement simple |

#### Compétences de l'équipe

| Membre | Rôle principal | Compétences clés |
|--------|---------------|------------------|
| Kays | PO / Chef de projet / Architecte technique | Gestion de projet Agile, architecture logicielle, NestJS |
| Samy | Scrum Master / Dev Backend + IA + Temps réel | Prompt engineering, Socket.io, intégration API LLM, NestJS |
| Youri | Dev Frontend | React, Next.js, TailwindCSS, responsive design |
| Yassir | Dev Frontend / UX-UI + DevOps | Figma, accessibilité WCAG, GitHub Actions, déploiement, React, Next.js |

#### Contraintes techniques identifiées

| Contrainte | Impact | Mitigation |
|-----------|--------|------------|
| Latence API LLM (3-5s par appel) | L'immersion peut être rompue pendant l'attente | Animations de "l'IA réfléchit", streaming de la réponse, cache des intros |
| Cohérence narrative sur plusieurs tours | L'IA peut se contredire au fil des tours | Envoi du game_state complet avec historique résumé à chaque appel |
| Synchronisation temps réel multi-joueurs | Désync possible entre clients | Architecture événementielle via Socket.io rooms, état centralisé côté serveur |
| Coût des appels API IA | Budget limité pour le MVP | Limites par session, modèle optimisé (Claude Haiku pour les phases simples, Sonnet pour la narration) |
| Modularité du moteur (multi-scénario) | Complexité architecturale accrue | Conception Scenario Pack claire dès le sprint 0, interfaces strictes |

### 2.3 Faisabilité organisationnelle

#### Ressources humaines
- Équipe de 4-5 étudiants en 5ème année
- Durée du projet : 1 semestre (~14 semaines)
- Disponibilité estimée : 15-20h/semaine/personne (en parallèle des cours)
- Total capacité : ~1000-1400 heures-personne

#### Contraintes organisationnelles
- Contraintes académiques (cours, examens, autres projets)
- Travail hybride (présentiel + distanciel)
- Nécessité de coordination synchrone pour les phases critiques (intégration, tests)
- Dépendance entre les composants (le frontend dépend de l'API, l'API dépend du moteur)

### 2.4 Faisabilité financière

#### Estimation budgétaire

| Poste | Coût estimé (MVP) | Détail |
|-------|--------------------|--------|
| Hébergement Frontend (Vercel) | 0€ | Tier gratuit (hobby) |
| Hébergement Backend (Railway) | 0 - 5€/mois | Tier gratuit limité, puis starter |
| Base de données (Railway PostgreSQL) | 0 - 5€/mois | Inclus dans Railway |
| Redis (Upstash) | 0€ | Tier gratuit (10K requêtes/jour) |
| API IA Anthropic (Claude) | 30 - 80€/mois | ~2000-5000 appels/mois en dev+test |
| Nom de domaine | 10 - 15€/an | mythos.game ou similaire (optionnel) |
| Outils (GitHub, Figma, Notion) | 0€ | Tiers gratuits / plans étudiants |
| **Total MVP (sur 4 mois)** | **~120 - 360€** | |

#### Retour sur investissement (ROI) – Projection hypothétique

| Indicateur | Estimation |
|-----------|-----------|
| **Modèle économique** | Freemium : 3 parties/jour gratuites, illimité à 4.99€/mois |
| **Marché adressable** | ~50M de joueurs de jeux sociaux en Europe (Among Us, Loup-Garou) |
| **Cible réaliste Y1** | 10 000 utilisateurs actifs mensuels |
| **Taux de conversion** | 5% (500 abonnés premium) |
| **Revenu Y1** | ~30 000€/an |
| **Coûts d'exploitation Y1** | ~12 000€/an (serveurs + API IA) |
| **ROI estimé Y1** | ~150% |

### 2.5 Synthèse de faisabilité

| Dimension | Faisabilité | Risque | Commentaire |
|-----------|-------------|--------|-------------|
| **Technique** | Élevée | Moyen | Stack maîtrisée. IA = défi principal (latence, cohérence). Architecture modulaire prouvée. |
| **Organisationnelle** | Moyenne | Moyen | Équipe compétente mais contrainte en temps. Scrum nécessaire. |
| **Financière** | Élevée | Faible | Coûts maîtrisés grâce aux tiers gratuits. ROI hypothétique positif dès Y1. |

**Conclusion** : Le projet MYTHOS est faisable. Le perimetre MVP (moteur + 2 scenarios) est realiste pour une equipe de 4 personnes sur un semestre, a condition de bien cadrer avec la methodo Agile et de faire une priorisation MoSCoW serieuse.

---

## 3. Veille technologique et concurrentielle (C1.2)

### 3.1 Plan de veille technologique

#### Objectifs de la veille
- Identifier les meilleures solutions d'IA générative pour la narration interactive
- Évaluer les technologies de communication temps réel (WebSocket, SSE, WebRTC)
- Surveiller l'évolution du marché des jeux narratifs et sociaux
- Identifier les bonnes pratiques d'éco-conception web et d'accessibilité
- Détecter les opportunités d'innovation (nouvelles API, nouveaux modèles IA)

#### Outils et méthodes de veille

| Outil/Méthode | Usage | Fréquence |
|---------------|-------|-----------|
| **Google Alerts** | Mots-clés : "AI game master", "multiplayer narrative", "LLM gaming", "jeu narratif IA" | Quotidien (automatisé) |
| **Feedly / RSS** | Agrégation : dev.to, Medium, Hacker News, Anthropic Blog, OpenAI Blog | Hebdomadaire |
| **GitHub Trending** | Projets open source : moteurs narratifs, frameworks jeu en ligne, SDK LLM | Hebdomadaire |
| **Product Hunt** | Nouveaux produits dans le domaine jeu + IA | Hebdomadaire |
| **Reddit** | r/gamedev, r/indiegaming, r/LocalLLaMA, r/ChatGPT | Hebdomadaire |
| **Discord** | Serveurs communautaires : AI game dev, indie game devs | En continu |
| **Benchmark concurrentiel** | Test des concurrents directs (AI Dungeon, Storium, etc.) | Mensuel |
| **Conférences** | GDC, AI conferences, meetups game dev | Ponctuel |

#### Organisation de la veille

- **Responsable veille** : Rotation hebdomadaire entre les membres de l'équipe
- **Synthèse** : Note de veille partagée dans Notion chaque semaine
- **Décision** : Les apports identifiés sont discutés en Sprint Review et intégrés au backlog si pertinents

### 3.2 Analyse concurrentielle

| Concurrent | Type | Forces | Faiblesses | Positionnement MYTHOS |
|------------|------|--------|------------|----------------------|
| **AI Dungeon** | Jeu narratif IA solo/multijoueur | Pionnier du genre, grande communauté, contenu libre | Qualité narrative variable, multijoueur asynchrone, pas de structure de jeu | Multijoueur synchrone, sessions structurées, MJ IA dirigé |
| **Storium** | Narration collaborative en ligne | Système de narration coopérative éprouvé | Pas d'IA, tour par tour très lent, niche | IA générative temps réel, sessions courtes |
| **Among Us** | Déduction sociale multijoueur | Énorme base joueurs, simple, viral | Zéro narration évolutive, mécaniques fixes | Narration profonde + déduction sociale, chaque partie unique |
| **Werewolf Online** | Loup-garou numérique | Social deduction pure, accessible | Mécaniques fixes, pas de narration | Narration dynamique IA + rôles sociaux |
| **Character.AI** | Chatbot IA conversationnel | IA conversationnelle très avancée | Solo uniquement, pas de jeu structuré | Multijoueur synchronisé, game loop structuré |
| **Hidden Agenda** | Jeu narratif choix multi (PS) | Bonne narration, multijoueur local | Pas d'IA, scénarios fixes, non rejouable | IA = rejouabilité infinie, 100% web |

**Positionnement unique de MYTHOS** : Aucun concurrent ne combine ces 4 axes simultanément :
1. IA Maître du Jeu en temps réel
2. Multijoueur synchrone
3. Sessions courtes (15-25 min)
4. Plateforme multi-scénarios modulaire

### 3.3 Analyse technologique comparative

#### Solutions d'IA générative

| Solution | Qualité narrative | Latence | Output JSON | Coût | Verdict |
|----------|------------------|---------|-------------|------|---------|
| **Anthropic Claude Sonnet** | Excellente | ~2-4s | Fiable | ~$0.003/1K input, $0.015/1K output | Retenu (narration) |
| **Anthropic Claude Haiku** | Bonne | ~0.5-1s | Fiable | ~$0.00025/1K input, $0.00125/1K output | Retenu (phases simples) |
| **OpenAI GPT-4o** | Excellente | ~2-3s | Bon | ~$0.005/1K input, $0.015/1K output | Alternative viable |
| **OpenAI GPT-4o-mini** | Bonne | ~1s | Bon | ~$0.00015/1K input, $0.0006/1K output | Alternative budget |
| **Mistral Large** | Bonne | ~2-3s | Moyen | ~$0.002/1K input, $0.006/1K output | Option européenne (RGPD) |
| **LLM local (Llama 3)** | Moyenne | Variable | Moyen | Coût GPU serveur | Non viable pour MVP |

**Choix retenu** : Anthropic Claude avec stratégie duale :
- **Claude Sonnet** pour les phases de narration et résolution (qualité maximale)
- **Claude Haiku** pour les phases simples (setup, validation d'actions) (coût minimal)

#### Solutions temps réel

| Solution | Avantages | Inconvénients | Verdict |
|----------|-----------|---------------|---------|
| **Socket.io** | Abstraction WebSocket, rooms natives, reconnexion auto, très documenté | Overhead par rapport au WebSocket brut | Retenu |
| **WebSocket natif (ws)** | Léger, performant | Pas de rooms, reconnexion manuelle | Non retenu (trop bas niveau) |
| **Pusher / Ably** | SaaS, zéro infra | Coût, dépendance externe, limites tier gratuit | Non retenu (coût) |
| **SSE (Server-Sent Events)** | Simple, natif HTTP | Unidirectionnel seulement | Non adapté (besoin bidirectionnel) |

#### Frameworks backend

| Solution | Avantages | Inconvénients | Verdict |
|----------|-----------|---------------|---------|
| **NestJS** | Modulaire, TypeScript natif, WebSocket intégré, injection de dépendances, architecture structurée (vs Express), écosystème complet (vs Fastify) | Courbe d'apprentissage | Retenu (Express et Fastify écartés) |

### 3.4 Apports de la veille -- Innovations integrees au projet

> C'est pendant la veille que Samy est tombe sur la strategie duale LLM (Haiku + Sonnet) dans un benchmark Reddit. On a teste et ca nous a fait economiser pas mal sur les couts API tout en gardant une bonne qualite de narration.

| Apport identifie | Source | Integration dans MYTHOS |
|-----------------|--------|------------------------|
| **Streaming LLM** | Blogs Anthropic/OpenAI | La narration s'affiche progressivement (effet "l'IA écrit en temps réel") pour masquer la latence |
| **Structured Output JSON** | Documentation API Claude | L'IA retourne directement un JSON structuré (narration + options + messages privés), simplifiant le parsing |
| **Architecture Scenario Pack** | Inspiration : modding de jeux vidéo | Les scénarios sont des fichiers de config indépendants du moteur, permettant extensibilité future |
| **Stratégie duale LLM** | Benchmarks communautaires | Utiliser un modèle léger (Haiku) pour les phases simples et un modèle puissant (Sonnet) pour la narration |
| **Éco-conception** | Référentiel GreenIT | Minimiser les appels IA inutiles par du cache et des prompts optimisés |

---

## 4. Architecture logicielle proposée (C1.3)

### 4.1 Architecture macro

```
┌─────────────────────────────────────────────────────────────┐
│                     CLIENTS (Navigateurs)                     │
│  ┌─────────────┐  ┌─────────────┐       ┌─────────────┐     │
│  │  Joueur 1   │  │  Joueur 2   │  ...  │  Joueur N   │     │
│  └──────┬──────┘  └──────┬──────┘       └──────┬──────┘     │
└─────────┼────────────────┼──────────────────────┼────────────┘
          │                │                      │
          ▼                ▼                      ▼
┌─────────────────────────────────────────────────────────────┐
│                 FRONTEND – Next.js + React                    │
│                                                              │
│  ┌───────────┐ ┌───────────┐ ┌──────────┐ ┌──────────────┐  │
│  │  Accueil  │ │  Lobby    │ │ Game UI  │ │    Admin     │  │
│  │ + Catalog │ │ + Chat    │ │ (moteur) │ │   Panel      │  │
│  └───────────┘ └───────────┘ └──────────┘ └──────────────┘  │
└────────────────────────┬────────────────────────────────────┘
                         │ REST API + WebSocket (Socket.io)
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                 BACKEND – NestJS                              │
│                                                              │
│  ┌───────────────┐  ┌────────────────┐  ┌────────────────┐  │
│  │   REST API    │  │  WS Gateway    │  │  Game Engine   │  │
│  │ (Auth, CRUD)  │  │ (Socket.io)    │  │  (Game Loop)   │  │
│  └───────────────┘  └────────────────┘  └───────┬────────┘  │
│                                                  │           │
│  ┌────────────────┐  ┌────────────────┐  ┌──────┴────────┐  │
│  │ Session Manager│  │  Role Manager  │  │  AI Service   │  │
│  │ (lobby, rooms) │  │ (rôles secrets)│  │ (prompt+parse)│  │
│  └────────────────┘  └────────────────┘  └───────┬───────┘  │
│                                                  │           │
│                                          ┌───────┴───────┐   │
│                                          │  Anthropic API│   │
│                                          │ (Claude)      │   │
│                                          └───────────────┘   │
└──────────────┬──────────────────┬───────────────────────────┘
               │                  │
               ▼                  ▼
┌──────────────────┐  ┌──────────────────┐
│   PostgreSQL     │  │     Redis        │
│  (persistant)    │  │  (game_state     │
│  Users, history, │  │   sessions,      │
│  scenario packs  │  │   cache IA)      │
└──────────────────┘  └──────────────────┘
```

### 4.2 Architecture du Game Engine (moteur universel)

Le Game Engine est le composant central. Il orchestre la boucle de jeu universelle :

```
┌──────────────────────────────────────────────────────┐
│                    GAME ENGINE                        │
│                                                      │
│  ┌──────────────┐    ┌──────────────────────────┐    │
│  │ Scenario     │───>│     Game Loop Manager    │    │
│  │ Pack Loader  │    │                          │    │
│  │ (JSON config)│    │  SETUP ──> NARRATION     │    │
│  └──────────────┘    │    ──> ACTION             │    │
│                      │    ──> RÉSOLUTION          │    │
│  ┌──────────────┐    │    ──> DISCUSSION          │    │
│  │ Game State   │<──>│    ──> CHECK FIN           │    │
│  │ Manager      │    │    ──> FINALE              │    │
│  └──────────────┘    └──────────────────────────┘    │
│                                                      │
│  ┌──────────────┐    ┌──────────────────────────┐    │
│  │ Choice       │    │    Resource Manager       │    │
│  │ Engine       │    │    (jauges, si scénario)  │    │
│  │ (vote/indiv) │    └──────────────────────────┘    │
│  └──────────────┘                                    │
└──────────────────────────────────────────────────────┘
```

**Principe fondamental** : Le Game Engine ne connaît pas les scénarios. Il lit un Scenario Pack et exécute la boucle de jeu en déléguant la narration à l'IA.

### 4.3 Description des composants

| Composant | Responsabilité | Technologie |
|-----------|---------------|-------------|
| **Frontend (Next.js)** | Interface utilisateur : accueil, catalogue scénarios, lobby, game UI, admin | Next.js 14+, React, TailwindCSS |
| **REST API** | Authentification, CRUD utilisateurs, gestion sessions, CRUD scenario packs | NestJS, JWT |
| **WS Gateway** | Communication bidirectionnelle temps réel entre serveur et clients | Socket.io via NestJS Gateway |
| **Game Engine** | Boucle de jeu universelle, orchestration des phases, gestion du game_state | Service NestJS custom |
| **Scenario Pack Loader** | Chargement et validation des fichiers de configuration scénario | Service NestJS |
| **Game State Manager** | Maintien et mise à jour de l'état du jeu en cours | Redis + service NestJS |
| **Choice Engine** | Gestion des modes de choix (vote, individuel, désigné, simultané) + timers | Service NestJS |
| **Resource Manager** | Gestion des jauges/ressources si le scénario en définit | Service NestJS |
| **Role Manager** | Distribution aléatoire des rôles secrets, gestion des infos privées | Service NestJS |
| **AI Service** | Construction des prompts, appel API Anthropic, parsing des réponses JSON | Service NestJS + SDK Anthropic |
| **Session Manager** | Création/destruction de rooms, gestion du lobby, invitations | Service NestJS + Socket.io rooms |
| **PostgreSQL** | Données persistantes : utilisateurs, historiques de parties, scenario packs | PostgreSQL 16+ via Prisma |
| **Redis** | Données éphémères : game_state en cours, cache des réponses IA, sessions | Redis 7+ via Upstash |

### 4.4 Flux de données – Déroulement d'un tour

```
1. Game Engine déclenche la phase NARRATION
2. Game State Manager envoie le game_state actuel à AI Service
3. AI Service construit le prompt (system prompt scénario + game_state + instructions)
4. AI Service appelle l'API Anthropic (Claude)
5. Claude retourne un JSON : { narration, options, private_messages }
6. AI Service parse et valide la réponse
7. WS Gateway broadcast la narration + options à tous les joueurs
8. WS Gateway envoie les private_messages individuellement
9. Game Engine passe en phase ACTION
10. Choice Engine collecte les choix des joueurs via WebSocket
11. Timer expire OU tous les joueurs ont choisi
12. Game Engine passe en phase RÉSOLUTION
13. AI Service renvoie les choix + game_state à Claude
14. Claude génère les conséquences narratives
15. Game State Manager met à jour le game_state (ressources, statuts, historique)
16. WS Gateway broadcast les résultats
17. Game Engine passe en phase DISCUSSION (chat libre)
18. Retour à l'étape 1 OU passage en FINALE si condition de fin atteinte
```

---

## 5. Spécifications fonctionnelles du MVP (C1.3)

### 5.1 Acteurs du système

| Acteur | Description |
|--------|-------------|
| **Joueur** | Utilisateur participant à une session de jeu narratif |
| **Hôte** | Joueur qui crée une session, choisit le scénario et lance la partie |
| **Administrateur** | Gestionnaire de la plateforme (modération, stats, config) |
| **IA Maître du Jeu** | Intelligence artificielle orchestrant la narration et les résolutions |

### 5.2 Fonctionnalités MVP

#### F1 – Catalogue et sélection de scénarios
- F1.1 : Afficher le catalogue des scénarios disponibles (TRIBUNAL, DEEP)
- F1.2 : Consulter la fiche détaillée d'un scénario (description, nb joueurs, durée, type)
- F1.3 : Sélectionner un scénario pour créer une session

#### F2 – Gestion des sessions multijoueur
- F2.1 : Créer une session de jeu (scénario choisi, configuration)
- F2.2 : Générer un code/lien d'invitation unique
- F2.3 : Rejoindre une session via code ou lien
- F2.4 : Lobby d'attente avec liste des joueurs connectés
- F2.5 : Chat de lobby (pré-partie)
- F2.6 : Lancement de la partie par l'hôte (quand min_players atteint)

#### F3 – Moteur de jeu universel (Game Engine)
- F3.1 : Chargement du Scenario Pack sélectionné
- F3.2 : Exécution de la boucle de jeu en 6 phases (Setup, Narration, Action, Résolution, Discussion, Finale)
- F3.3 : Gestion des transitions de phases automatiques
- F3.4 : Vérification des conditions de fin à chaque tour

#### F4 – IA Maître du Jeu
- F4.1 : Génération du contexte initial et distribution des rôles
- F4.2 : Génération de la narration à chaque tour (scènes, événements, rebondissements)
- F4.3 : Proposition d'options d'action contextuelles
- F4.4 : Résolution narrative des conséquences des choix
- F4.5 : Envoi de messages privés individuels (infos secrètes liées au rôle)
- F4.6 : Génération du climax final et de l'épilogue

#### F5 – Système de choix synchronisés
- F5.1 : Affichage des options d'action à chaque joueur
- F5.2 : Mode de choix configurable (vote majoritaire, individuel secret, joueur désigné)
- F5.3 : Timer configurable par phase avec compte à rebours visuel
- F5.4 : Gestion du timeout (choix par défaut ou aléatoire)
- F5.5 : Révélation des résultats en temps réel

#### F6 – Système de rôles et informations privées
- F6.1 : Attribution aléatoire des rôles secrets en début de partie
- F6.2 : Affichage des informations privées (rôle, objectif, indices) uniquement au joueur concerné
- F6.3 : Gestion d'informations révélées progressivement au fil des tours

#### F7 – Gestion des ressources (scénarios avec jauges)
- F7.1 : Affichage des jauges de ressources (ex: O2, énergie, coque pour DEEP)
- F7.2 : Décroissance automatique par tour (configurable dans le Scenario Pack)
- F7.3 : Modification des ressources selon les choix des joueurs
- F7.4 : Déclenchement des conditions de fin liées aux ressources

#### F8 – Chat et discussion
- F8.1 : Chat textuel entre joueurs pendant la phase Discussion
- F8.2 : Timer de discussion avec bouton "Prêt" pour raccourcir
- F8.3 : Passage automatique au tour suivant quand tous les joueurs sont prêts ou timer expiré

#### F9 – Visualisation de l'état narratif
- F9.1 : Affichage du texte narratif (avec effet de streaming/apparition progressive)
- F9.2 : Timeline des événements passés (historique des tours)
- F9.3 : Indicateurs visuels de progression (tour actuel / total, jauges)
- F9.4 : Informations spécifiques au rôle du joueur (panneau privé)

#### F10 – Écran de fin de partie
- F10.1 : Affichage du climax narratif final
- F10.2 : Révélation de tous les rôles secrets
- F10.3 : Résumé de la partie (choix clés, moments forts)
- F10.4 : Résultat (victoire/défaite/score selon le scénario)
- F10.5 : Option "Rejouer" ou "Retour au catalogue"

#### F11 – Interface utilisateur
- F11.1 : Page d'accueil avec catalogue des scénarios
- F11.2 : Responsive design mobile-first
- F11.3 : Accessibilité WCAG 2.1 AA minimum
- F11.4 : Thème visuel sombre immersif, adapté au jeu narratif
- F11.5 : Animations de transition entre les phases

#### F12 – Administration
- F12.1 : Tableau de bord : sessions actives, sessions passées, nombre de joueurs
- F12.2 : Gestion des utilisateurs (ban, modération)
- F12.3 : Statistiques d'utilisation (scénarios joués, durée moyenne, taux de complétion)
- F12.4 : Configuration des paramètres IA (modèle, limites d'appels)

### 5.3 User Stories principales

| ID | En tant que... | Je veux... | Afin de... | Priorité |
|----|---------------|------------|------------|----------|
| US01 | Joueur | voir le catalogue des scénarios disponibles | choisir une expérience qui me plaît | Must Have |
| US02 | Hôte | créer une session en choisissant un scénario | lancer une partie avec mes amis | Must Have |
| US03 | Joueur | rejoindre une session via un lien/code | accéder à la partie sans friction | Must Have |
| US04 | Joueur | recevoir un rôle secret en début de partie | avoir des objectifs et infos uniques | Must Have |
| US05 | Joueur | lire la narration générée par l'IA | être immergé dans l'histoire | Must Have |
| US06 | Joueur | faire des choix qui impactent l'histoire | me sentir acteur de la narration | Must Have |
| US07 | Joueur | discuter avec les autres joueurs | argumenter, bluffer, collaborer | Must Have |
| US08 | Joueur | voir l'évolution des jauges (DEEP) | comprendre les enjeux de survie | Must Have |
| US09 | Joueur | voir le dénouement final et les révélations | connaître la conclusion de l'histoire | Must Have |
| US10 | Joueur | rejouer immédiatement avec un autre scénario | enchaîner les parties | Should Have |
| US11 | Hôte | configurer la durée des timers | adapter le rythme à mon groupe | Should Have |
| US12 | Admin | voir les statistiques d'utilisation | suivre l'adoption de la plateforme | Could Have |

### 5.4 Contraintes de performance cible

| Indicateur | Cible MVP | Justification |
|------------|-----------|---------------|
| Temps de chargement initial | < 3s | Seuil d'attention des gamers occasionnels |
| Latence WebSocket | < 200ms | Synchronisation fluide des choix |
| Temps de génération IA (narration) | < 5s | Immersion maintenue avec animation d'attente |
| Temps de génération IA (setup) | < 10s | Acceptable car unique en début de partie |
| Joueurs simultanés par session | 2-8 | Fourchette optimale pour les scénarios conçus |
| Sessions concurrentes | 10+ | Suffisant pour le MVP |
| Disponibilité | 95% | Standard MVP |
| Poids d'une page | < 1 Mo | Éco-conception |

### 5.5 Accessibilité (C1.3 – Ce1.3.3)

La solution respecte les principes d'accessibilité WCAG 2.1 niveau AA :

- Navigation complète au clavier (tabulation, entrée, échap)
- Compatibilité lecteurs d'écran (attributs ARIA, rôles sémantiques)
- Contrastes suffisants (ratio minimum 4.5:1 pour le texte)
- Textes alternatifs pour tous les éléments visuels
- Taille de police ajustable sans perte de fonctionnalité
- Pas de contenu dépendant uniquement de la couleur (jauges avec labels textuels)
- Timer avec option de prolongation pour les personnes en situation de handicap
- Narration IA compatible avec les technologies d'assistance (texte brut structuré)

### 5.6 Numérique responsable (C1.3 – Ce1.3.4)

- Stratégie duale LLM (Haiku pour les phases simples) pour réduire la consommation énergétique
- Cache des réponses IA récurrentes (intros de scénarios, descriptions de rôles)
- Prompts optimisés (concis, structurés) pour minimiser les tokens consommés
- Lazy loading des assets, compression des images
- Hébergement sur datacenters certifiés (Vercel : énergies renouvelables)
- Mesure continue de l'éco-index via GreenIT Analysis

---

## 6. Spécifications techniques (C1.3)

### 6.1 Stack technique retenue

| Couche | Technologie | Version | Justification |
|--------|------------|---------|---------------|
| Frontend | Next.js + React | 14+ | SSR/SSG pour performance, App Router, écosystème riche |
| Styling | TailwindCSS | 3+ | Utility-first, responsive natif, bundle optimisé (purge CSS) |
| État client | Zustand | 4+ | Léger, simple, pas de boilerplate (vs Redux) |
| Backend | NestJS | 10+ | Architecture modulaire, DI, WebSocket natif, TypeScript |
| ORM | Prisma | 5+ | Type-safe, migrations auto, compatible PostgreSQL |
| BDD | PostgreSQL | 16+ | Robuste, JSON natif pour les Scenario Packs, requêtes complexes |
| Cache/State | Redis (Upstash) | 7+ | Game state temps réel, pub/sub, TTL automatique |
| Temps réel | Socket.io | 4+ | Rooms, reconnexion auto, fallback polling |
| IA | API Anthropic (Claude) | Messages API | Structured output JSON, streaming, qualité narrative |
| Auth | JWT + bcrypt | - | Stateless, compatible REST, simple |
| Tests | Vitest (front) + Jest (back) | - | Rapides, compatibles TypeScript |
| CI/CD | GitHub Actions | - | Intégré, gratuit, workflows YAML |
| Frontend hosting | Vercel | - | Optimisé Next.js, CDN global, tier gratuit |
| Backend hosting | Railway | - | PostgreSQL + Redis inclus, déploiement Git, tier starter |

### 6.2 Modèle de données

```
┌──────────────┐       ┌──────────────────┐       ┌──────────────┐
│    User      │       │   GameSession    │       │ ScenarioPack │
├──────────────┤       ├──────────────────┤       ├──────────────┤
│ id        PK │       │ id            PK │       │ id        PK │
│ username     │       │ scenario_id   FK │──────>│ name         │
│ email        │       │ host_id       FK │       │ slug         │
│ password_hash│       │ code (unique)    │       │ description  │
│ role (enum)  │       │ status (enum)    │       │ config (JSON)│
│ created_at   │       │ max_players      │       │ ai_prompt    │
│ updated_at   │       │ current_round    │       │ min_players  │
└──────┬───────┘       │ game_state (JSON)│       │ max_players  │
       │               │ created_at       │       │ version      │
       │               │ ended_at         │       └──────────────┘
       │               └────────┬─────────┘
       │                        │
       │    ┌───────────────────┤
       │    │                   │
       ▼    ▼                   ▼
┌──────────────────┐   ┌──────────────────┐
│     Player       │   │   GameRound      │
├──────────────────┤   ├──────────────────┤
│ id            PK │   │ id            PK │
│ user_id       FK │   │ session_id    FK │
│ session_id    FK │   │ round_number     │
│ role_id          │   │ phase (enum)     │
│ secret_info(JSON)│   │ narration (text) │
│ status (enum)    │   │ options (JSON)   │
│ joined_at        │   │ created_at       │
└──────────────────┘   └────────┬─────────┘
                                │
                                ▼
                       ┌──────────────────┐
                       │  PlayerChoice    │
                       ├──────────────────┤
                       │ id            PK │
                       │ round_id      FK │
                       │ player_id     FK │
                       │ choice_id        │
                       │ timestamp        │
                       └──────────────────┘
```

**Enums :**
- `SessionStatus` : `lobby` | `in_progress` | `finished` | `cancelled`
- `Phase` : `setup` | `narration` | `action` | `resolution` | `discussion` | `finale`
- `PlayerStatus` : `alive` | `eliminated` | `disconnected`
- `UserRole` : `player` | `admin`

### 6.3 API REST (endpoints principaux)

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| POST | `/api/auth/register` | Inscription |
| POST | `/api/auth/login` | Connexion (retourne JWT) |
| GET | `/api/scenarios` | Liste des scénarios disponibles |
| GET | `/api/scenarios/:slug` | Détail d'un scénario |
| POST | `/api/sessions` | Créer une session (choix scénario) |
| GET | `/api/sessions/:code` | Info d'une session (pour rejoindre) |
| POST | `/api/sessions/:code/join` | Rejoindre une session |
| GET | `/api/sessions/:id/history` | Historique d'une partie terminée |
| GET | `/api/admin/stats` | Statistiques (admin) |
| GET | `/api/admin/sessions` | Liste des sessions (admin) |

### 6.4 Événements WebSocket (Socket.io)

| Événement | Direction | Description |
|-----------|-----------|-------------|
| `player:join` | Client → Serveur | Un joueur rejoint le lobby |
| `player:leave` | Client → Serveur | Un joueur quitte |
| `game:start` | Client → Serveur | L'hôte lance la partie |
| `game:phase_change` | Serveur → Clients | Changement de phase |
| `game:narration` | Serveur → Clients | Texte narratif de l'IA (peut être streamé) |
| `game:options` | Serveur → Clients | Options d'action disponibles |
| `game:private_message` | Serveur → Client (1) | Info privée pour un joueur spécifique |
| `player:choice` | Client → Serveur | Le joueur soumet son choix |
| `game:resolution` | Serveur → Clients | Résultat narratif du tour |
| `game:resources_update` | Serveur → Clients | Mise à jour des jauges |
| `game:finale` | Serveur → Clients | Écran de fin + révélations |
| `chat:message` | Client → Serveur | Message chat (phase discussion) |
| `chat:broadcast` | Serveur → Clients | Diffusion du message chat |
| `timer:tick` | Serveur → Clients | Compte à rebours |
| `player:ready` | Client → Serveur | Le joueur est prêt (phase discussion) |

### 6.5 Structure d'un Scenario Pack

```json
{
  "id": "tribunal",
  "name": "TRIBUNAL",
  "slug": "tribunal",
  "description": "Procès fictif avec rôles cachés. L'IA anime le procès.",
  "version": "1.0",
  "min_players": 4,
  "max_players": 8,
  "estimated_duration_minutes": 20,
  "tags": ["déduction", "rôles cachés", "procès"],

  "settings": {
    "rounds": 5,
    "discussion_enabled": true,
    "discussion_timer_seconds": 90,
    "action_timer_seconds": 60,
    "default_action_mode": "individual"
  },

  "roles": [
    {
      "id": "juge",
      "name": "Le Juge",
      "team": "neutral",
      "count": 1,
      "description": "Vous présidez le procès.",
      "secret": "Vous avez un lien personnel avec la victime."
    }
  ],

  "resources": [],

  "phases_override": {
    "round_5": { "name": "Verdict", "action_mode": "vote" }
  },

  "end_conditions": [
    { "type": "max_rounds", "value": 5 },
    { "type": "vote_reached", "target": "verdict" }
  ],

  "ai_system_prompt": "Tu es le Maître du Jeu d'un procès fictif..."
}
```

### 6.6 Sécurité

| Mesure | Détail |
|--------|--------|
| **Authentification** | JWT avec expiration (24h), refresh token |
| **Validation des entrées** | Validation DTO avec class-validator (NestJS), protection XSS |
| **Rate limiting** | Limite sur les endpoints sensibles (auth, API IA) via @nestjs/throttler |
| **HTTPS** | Obligatoire en production (géré par Vercel/Railway) |
| **Sanitisation IA** | Les outputs de l'IA sont sanitisés avant affichage (protection injection de prompt) |
| **CORS** | Restriction aux domaines autorisés |
| **Secrets** | Variables d'environnement, jamais dans le code (clé API Anthropic) |
| **WebSocket auth** | Vérification du JWT à la connexion WebSocket |

---

## 7. Analyse des risques (C1.1 / C1.5)

### 7.1 Matrice des risques

| ID | Risque | Catégorie | Probabilité | Impact | Criticité | Plan de mitigation |
|----|--------|-----------|-------------|--------|-----------|-------------------|
| R1 | Latence excessive API IA (>5s) | Technique | Moyenne | Élevé | Critique | Streaming des réponses, animation d'attente immersive "L'IA réfléchit...", cache des intros, stratégie duale Haiku/Sonnet |
| R2 | Incoherence narrative de l'IA au fil des tours | Technique | Elevee | Eleve | Critique | Envoi du game_state complet resume a chaque appel, prompt engineering soigne, tests de scenarios complets |
| R3 | Coûts API IA dépassant le budget | Financier | Moyenne | Moyen | Majeur | Stratégie duale (Haiku pour phases simples), limites d'appels par session, cache, monitoring des coûts |
| R4 | Désynchronisation entre joueurs (WebSocket) | Technique | Faible | Élevé | Majeur | État centralisé côté serveur (Redis), mécanisme de reconnexion Socket.io, heartbeat régulier |
| R5 | Dépassement du calendrier | Organisationnel | Élevée | Moyen | Majeur | Scrum sprints de 2 semaines, priorisation MoSCoW stricte, sprint buffer en fin de projet |
| R6 | Disponibilité réduite de membres de l'équipe | Organisationnel | Moyenne | Moyen | Modéré | Documentation continue, code review systématique, polyvalence encouragée, planning partagé |
| R7 | Contenu inapproprié généré par l'IA | Technique/Légal | Faible | Élevé | Majeur | Guardrails dans les prompts système, modération post-génération, signalement utilisateur |
| R8 | Non-conformité RGPD | Réglementaire | Faible | Élevé | Modéré | Privacy by design, audit RGPD dès le sprint 0, minimisation des données collectées |
| R9 | Indisponibilité de l'API Anthropic | Technique | Faible | Élevé | Modéré | Fallback vers OpenAI en secours, gestion d'erreur gracieuse côté client |
| R10 | Complexité du moteur universel sous-estimée | Technique | Moyenne | Moyen | Majeur | Proof of concept dès le sprint 1, interface Scenario Pack validée avant implémentation |

### 7.2 Plan de gestion des risques

> On a fait cette analyse de risques en equipe et ca a donne lieu a un vrai debat sur R5 (depassement calendrier). Youri pensait qu'on etait trop optimistes sur les sprints 2 et 3, et au final on a rajoute un sprint buffer pour se proteger.

**Risques critiques (R1, R2)** – Actions immédiates :
1. **Sprint 1** : Proof of concept du flux IA complet (prompt → réponse → affichage) pour valider la latence et la cohérence
2. Rédaction d'une bibliothèque de prompts testés et validés par scénario
3. Monitoring temps de réponse IA dès l'intégration

**Risques majeurs (R3, R4, R5, R7, R10)** – Actions préventives :
1. Suivi budgétaire hebdomadaire des coûts API
2. Tests d'intégration WebSocket automatisés
3. Burndown chart suivi quotidiennement
4. Instructions de modération dans tous les prompts système
5. Validation de l'architecture Scenario Pack par un POC avec 2 scénarios

---

## 8. Feuille de route du projet (C1.4)

### 8.1 Méthodologie : Scrum (Agile)

| Élément | Choix | Justification |
|---------|-------|---------------|
| **Framework** | Scrum | Adapté aux projets à périmètre évolutif, itérations courtes, feedback régulier |
| **Durée des sprints** | 2 semaines | Bon compromis entre vélocité et profondeur de développement |
| **Cérémonies** | Sprint Planning, Daily (async), Review, Rétrospective | Cadre complet pour le suivi et l'amélioration continue |
| **Outil principal** | GitHub Projects | Kanban + Backlog intégrés au dépôt de code, gratuit |
| **Approche DevOps** | CI/CD avec GitHub Actions | Déploiement automatique à chaque merge sur main |

### 8.2 Planning prévisionnel

| Sprint | Semaines | Objectif | Livrables clés |
|--------|----------|----------|-----------------|
| **Sprint 0** | Sem 1-2 | Cadrage & Setup | Cahier des charges v1, repo Git, CI/CD, architecture validée, maquettes Figma |
| **Sprint 1** | Sem 3-4 | Fondations + POC IA | Auth, modèle de données, API CRUD, POC moteur IA (1 flux complet) |
| **Sprint 2** | Sem 5-6 | Game Engine core | Boucle de jeu 6 phases, Scenario Pack loader, Game State Manager |
| **Sprint 3** | Sem 7-8 | Multijoueur + Scénario TRIBUNAL | WebSocket, lobby, sessions, Scenario Pack TRIBUNAL jouable |
| **Sprint 4** | Sem 9-10 | Scénario DEEP + UI | Resource Manager (jauges), Scenario Pack DEEP jouable, UI game complète |
| **Sprint 5** | Sem 11-12 | Intégration + Admin + Polish | Admin panel, tests E2E, responsive, accessibilité, déploiement prod |
| **Buffer** | Sem 13-14 | Finalisation | Correction bugs, documentation, vidéo démo, préparation soutenance |

### 8.3 Répartition des rôles

| Rôle Scrum | Membre | Responsabilités principales |
|------------|--------|---------------------------|
| **PO / Chef de projet / Architecte technique** | Kays | Vision produit, priorisation backlog, validation des livrables, architecture |
| **Scrum Master / Dev Backend + IA + Temps réel** | Samy | Facilitation des cérémonies, suivi vélocité, AI Service, prompt engineering, Socket.io, intégration Scenario Packs |
| **Dev Frontend** | Youri | UI/UX, game UI, responsive, accessibilité |
| **Dev Frontend / UX-UI + DevOps** | Yassir | Design Figma, accessibilité WCAG, CI/CD GitHub Actions, déploiement |

### 8.4 Outils de pilotage

| Outil | Usage |
|-------|-------|
| **GitHub Projects** | Backlog produit, board Kanban (To Do / In Progress / Review / Done), sprint tracking |
| **GitHub** | Versioning (Git Flow), Pull Requests, code review, CI/CD (Actions) |
| **Discord** | Communication quotidienne, standup async, canaux par sujet |
| **Figma** | Maquettes UI/UX, design system, prototypage |
| **Notion** | Documentation projet, journal de bord, comptes-rendus de réunions, veille techno |

### 8.5 Budget prévisionnel détaillé

| Phase | Poste | Coût estimé |
|-------|-------|-------------|
| Sprint 0-1 | Infrastructure (tiers gratuits) | 0€ |
| Sprint 2-3 | API IA – développement/test (~1000 appels) | ~20-40€ |
| Sprint 4-5 | API IA – intégration/test (~3000 appels) | ~40-80€ |
| Sprint 5+ | Hébergement production (Railway starter) | ~10-20€/mois |
| Transversal | Nom de domaine (optionnel) | ~15€ |
| **Total projet (14 semaines)** | | **~308€** |

---

## 9. Indicateurs de performance – KPI (C1.6)

### 9.1 KPI Projet (suivi d'avancement)

| KPI | Cible | Outil de mesure | Fréquence |
|-----|-------|-----------------|-----------|
| **Vélocité d'équipe** | Stable ou croissante sprint après sprint | GitHub Projects (story points) | Par sprint |
| **Burndown chart** | Trajectoire linéaire descendante | GitHub Projects | Quotidien |
| **Taux de complétion sprint** | > 80% des story points planifiés | GitHub Projects | Par sprint |
| **Nombre de bugs critiques ouverts** | 0 en fin de sprint | GitHub Issues (label: critical) | Par sprint |
| **Couverture de tests** | > 60% (back), > 40% (front) | Vitest/Jest + CI coverage report | Par commit |
| **Respect du budget** | Écart < 20% vs prévisionnel | Suivi tableur + dashboard API Anthropic | Mensuel |
| **Respect du calendrier** | Retard < 1 semaine sur les jalons | Planning vs réalisé | Par sprint |

### 9.2 KPI Produit (qualité du MVP)

| KPI | Cible | Outil de mesure | Fréquence |
|-----|-------|-----------------|-----------|
| **Temps de réponse IA (narration)** | < 5s (P95) | Logs applicatifs + monitoring | Continu |
| **Temps de réponse IA (setup)** | < 10s | Logs applicatifs | Continu |
| **Latence WebSocket** | < 200ms (P95) | Monitoring réseau (Socket.io admin) | Continu |
| **Temps de chargement page** | < 3s (LCP) | Google Lighthouse | Par déploiement |
| **Uptime** | > 95% | Health check automatisé (UptimeRobot) | Continu |
| **Taux de complétion de session** | > 70% des parties démarrées vont au bout | Logs applicatifs | Hebdomadaire |
| **Taux d'erreurs IA** | < 5% (réponses non-parsables) | Logs AI Service | Continu |

### 9.3 KPI Conformité

| KPI | Cible | Référentiel | Outil |
|-----|-------|-------------|-------|
| **Conformité RGPD** | 100% des traitements documentés | RGPD / CNIL | Registre de traitement |
| **Score accessibilité** | > 90 (Lighthouse Accessibility) | WCAG 2.1 AA | Google Lighthouse |
| **Score accessibilité WAVE** | 0 erreur | WCAG 2.1 | WAVE (WebAIM) |
| **Éco-index** | > 50 | GreenIT | GreenIT Analysis |
| **Poids moyen des pages** | < 1 Mo | Éco-conception | Lighthouse / DevTools |
| **Conformité ANSSI** | Respect des bonnes pratiques de sécurité web | Guide ANSSI | Audit interne |

### 9.4 Tableau de bord de reporting

Un tableau de bord synthétique est produit à chaque Sprint Review, contenant :
- Burndown chart du sprint
- Vélocité (comparaison sprints précédents)
- KPI produit (temps de réponse IA, latence, uptime)
- Budget consommé vs prévisionnel
- Risques actifs et actions en cours
- Démonstration des fonctionnalités livrées

---

## 10. Contraintes réglementaires, accessibilité et numérique durable

### 10.1 RGPD – Conformité au Règlement Général sur la Protection des Données

#### Données collectées et traitées

| Donnée | Finalité | Base légale | Durée de conservation |
|--------|----------|-------------|----------------------|
| Pseudo | Identification en jeu | Exécution du contrat | Durée du compte |
| Email | Authentification, notifications | Consentement | Durée du compte |
| Mot de passe (hashé) | Authentification | Exécution du contrat | Durée du compte |
| Choix en jeu | Fonctionnement du jeu | Exécution du contrat | 6 mois après la partie |
| Logs de session | Statistiques, debugging | Intérêt légitime | 3 mois |
| Messages chat | Fonctionnement du jeu | Exécution du contrat | Fin de la session |

#### Principes appliqués
- **Minimisation** : Seules les données strictement nécessaires sont collectées (pas de nom réel, pas de géolocalisation)
- **Privacy by design** : Protection des données intégrée dès la conception
- **Consentement** : Bandeau de consentement clair, opt-in explicite
- **Droits des utilisateurs** : Accès, rectification, suppression, portabilité (endpoint API dédié)
- **Sécurité** : Chiffrement des mots de passe (bcrypt), HTTPS, tokens sécurisés
- **Sous-traitants** : Anthropic (API IA) – données textuelles envoyées pour la génération narrative. Clauses contractuelles standards exigées.

#### Registre de traitement
Un registre de traitement conforme à l'article 30 du RGPD est tenu à jour dans la documentation projet (Notion).

### 10.2 Conformité ANSSI / ITIL

- Respect des bonnes pratiques de sécurité web de l'ANSSI (guide d'hygiène informatique)
- Gestion des incidents selon les principes ITIL : détection, classification, résolution, capitalisation
- Veille sur les CVE (Common Vulnerabilities and Exposures) des dépendances utilisées
- Audit de sécurité des dépendances via `npm audit` automatisé en CI

### 10.3 Accessibilité

Conformité WCAG 2.1 niveau AA, conforme au RGAA (Référentiel Général d'Amélioration de l'Accessibilité) :

| Critère | Implémentation |
|---------|---------------|
| **Perceptible** | Contrastes 4.5:1, textes alternatifs, pas d'info par couleur seule, jauges avec labels textuels |
| **Utilisable** | Navigation clavier complète, timers extensibles, pas de piège clavier |
| **Compréhensible** | Langage clair, messages d'erreur explicites, navigation cohérente |
| **Robuste** | HTML sémantique, attributs ARIA, compatible lecteurs d'écran (NVDA, VoiceOver) |

**Adaptation spécifique au jeu** :
- Les timers de choix peuvent être prolongés (paramètre d'accessibilité dans les options)
- La narration IA est en texte brut structuré (compatible lecteurs d'écran)
- Les jauges de ressources (DEEP) ont des indicateurs textuels en plus des barres visuelles

### 10.4 Numérique responsable / Informatique durable

| Principe | Application dans MYTHOS |
|----------|------------------------|
| **Sobriété** | Fonctionnalités essentielles uniquement dans le MVP, pas de gadgets |
| **Efficience IA** | Stratégie duale Haiku/Sonnet, cache, prompts optimisés |
| **Performance** | Lazy loading, compression assets, bundle splitting (Next.js) |
| **Poids des pages** | Cible < 1 Mo par page |
| **Hébergement** | Vercel : alimenté par des sources d'énergie renouvelable |
| **Mesure** | Suivi éco-index (GreenIT Analysis), score Lighthouse performance |
| **Durabilité du code** | Architecture modulaire facilitant la maintenance et l'évolution |

---

## 11. Pilotage et supervision du projet (C1.7)

### 11.1 Processus de suivi

| Événement | Fréquence | Participants | Objectif | Durée |
|-----------|-----------|-------------|----------|-------|
| **Daily Standup** (async Discord) | Quotidien | Toute l'équipe | Synchronisation : fait / à faire / blocages | 5 min (écrit) |
| **Sprint Planning** | Début de sprint | Toute l'équipe | Sélection des stories, estimation, engagement | 1h |
| **Sprint Review** | Fin de sprint | Équipe + encadrant | Démo des fonctionnalités livrées, feedback | 30 min |
| **Rétrospective** | Fin de sprint | Toute l'équipe | Amélioration continue du processus | 30 min |
| **Point budget** | Mensuel | PO + Scrum Master | Suivi coûts API IA et hébergement | 15 min |
| **Point risques** | Bi-hebdomadaire | Toute l'équipe | Revue de la matrice des risques, actions | 15 min |

### 11.2 Processus de gestion du changement

Tout changement de périmètre, de technologie ou de planning suit ce processus :

1. **Identification** : Le changement est identifié par un membre de l'équipe ou un stakeholder
2. **Formalisation** : Création d'une issue GitHub avec le label `change-request`
3. **Analyse d'impact** : Évaluation de l'impact sur le planning, le budget, la qualité et les risques
4. **Décision** : Vote de l'équipe en Sprint Planning (PO a le dernier mot pour le périmètre)
5. **Mise à jour** : Backlog, planning et documentation mis à jour
6. **Communication** : Information aux parties prenantes (encadrant, client fictif)

### 11.3 Communication avec les parties prenantes

| Partie prenante | Canal | Fréquence | Contenu |
|-----------------|-------|-----------|---------|
| **Client fictif** (Mythos Interactive) | Sprint Review + email de synthèse | Bi-hebdomadaire | Démo, avancement, décisions à prendre |
| **Encadrant académique** | Rapport d'avancement (Notion) | Hebdomadaire | KPI, risques, blocages, décisions |
| **Équipe de développement** | Discord + GitHub | Quotidien | Coordination technique, code review |
| **Jury de soutenance** | Cahier des charges + présentation orale | Fin de projet | Livrable final + défense du projet |

### 11.4 Processus de résolution de problèmes

1. **Détection** : Via les KPI (dashboards), daily standup, ou remontée directe
2. **Qualification** : Criticité (bloquant / majeur / mineur), impact sur le sprint en cours
3. **Analyse** : Recherche de la cause racine (méthode des 5 Pourquoi)
4. **Action** : Création d'une issue corrective dans le backlog, priorisée immédiatement si bloquant
5. **Résolution** : Assignation, développement, code review, merge
6. **Vérification** : Test de non-régression, validation en Sprint Review
7. **Capitalisation** : Documentation de l'incident et de la solution dans le journal de bord (Notion)

### 11.5 Ajustement du calendrier et des ressources

En cas de retard ou de blocage identifié :

| Situation | Action |
|-----------|--------|
| Retard < 2 jours | Réaffectation des tâches au sein du sprint |
| Retard 2-5 jours | Réduction du périmètre du sprint (stories reportées) |
| Retard > 1 semaine | Sprint de rattrapage, réunion exceptionnelle, arbitrage PO |
| Membre indisponible | Réaffectation des stories, pair programming si besoin |
| Dépassement budget IA | Passage à Claude Haiku uniquement, réduction du nb de tests |
| Risque technique avéré | Spike technique dédié (time-boxé à 2 jours) |

---

## Annexes

### A. Glossaire

| Terme | Définition |
|-------|-----------|
| **Scenario Pack** | Fichier de configuration JSON définissant un scénario de jeu (rôles, règles, prompt IA) |
| **Game State** | État complet d'une partie en cours (joueurs, tour, historique, ressources) |
| **Game Loop** | Boucle de jeu universelle en 6 phases exécutée par le moteur MYTHOS |
| **LLM** | Large Language Model – modèle d'IA générative (ex: Claude, GPT) |
| **MJ / Game Master** | Maître du Jeu – rôle tenu par l'IA dans MYTHOS |
| **MVP** | Minimum Viable Product – version minimale fonctionnelle du produit |
| **MoSCoW** | Méthode de priorisation : Must / Should / Could / Won't |
| **Sprint** | Itération de développement de 2 semaines (Scrum) |
| **WebSocket** | Protocole de communication bidirectionnelle temps réel |
| **Room** | Espace Socket.io isolé correspondant à une session de jeu |

### B. Références

- RNCP38822 – Bloc 1 : Planifier et organiser un projet de développement logiciel
- RGPD – Règlement (UE) 2016/679
- WCAG 2.1 – Web Content Accessibility Guidelines
- RGAA 4.1 – Référentiel Général d'Amélioration de l'Accessibilité
- Guide d'hygiène informatique – ANSSI
- ITIL v4 – Référentiel de gestion des services informatiques
- GreenIT Analysis – Outil de mesure d'éco-index

### C. Maquettes UI

<!-- TODO: Liens Figma à ajouter -->

Écrans prévus :
1. Page d'accueil + catalogue des scénarios
2. Page détail scénario
3. Lobby (attente des joueurs)
4. Game UI – Phase narration
5. Game UI – Phase choix
6. Game UI – Phase discussion (chat)
7. Game UI – Jauges de ressources (DEEP)
8. Écran de fin / révélations
9. Panel d'administration

### D. Backlog initial (Product Backlog)

| Épic | Stories | Sprint cible | Priorité |
|------|---------|-------------|----------|
| **Auth & Users** | Register, Login, JWT, profil | Sprint 1 | Must Have |
| **Sessions** | Création, code invitation, lobby, join | Sprint 1-3 | Must Have |
| **Game Engine** | Game Loop, phases, transitions, Scenario Pack loader | Sprint 2 | Must Have |
| **AI Service** | Prompt builder, appel API, parsing JSON, streaming | Sprint 2 | Must Have |
| **Choice Engine** | Vote, individuel, timer, résolution | Sprint 3 | Must Have |
| **TRIBUNAL** | Scenario Pack, rôles, tests complets | Sprint 3 | Must Have |
| **WebSocket** | Gateway, rooms, événements, reconnexion | Sprint 3 | Must Have |
| **Resource Manager** | Jauges, décroissance, conditions de fin | Sprint 4 | Must Have |
| **DEEP** | Scenario Pack, jauges, tests complets | Sprint 4 | Must Have |
| **Game UI** | Narration, choix, chat, jauges, fin | Sprint 4-5 | Must Have |
| **Admin** | Dashboard, stats, gestion users | Sprint 5 | Should Have |
| **Accessibilité** | WCAG AA, ARIA, clavier, contrastes | Sprint 5 | Must Have |
| **Déploiement** | CI/CD, Vercel, Railway, monitoring | Sprint 5 | Must Have |
| **Tests** | Unitaires, intégration, E2E | Transversal | Must Have |

### E. Scenario Packs détaillés

Voir document séparé : `01-faisabilite/GAME_ENGINE_CORE.md`
