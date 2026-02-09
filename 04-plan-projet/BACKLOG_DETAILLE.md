# MYTHOS – Backlog Détaillé & Planification des Sprints

> **Méthodologie** : Scrum (Agile)
> **Durée des sprints** : 2 semaines
> **Outil** : GitHub Projects (Kanban)
> **Estimation** : Story Points (suite de Fibonacci : 1, 2, 3, 5, 8, 13)
> **Priorisation** : MoSCoW (Must / Should / Could / Won't)

Le backlog a été construit collaborativement lors de nos sessions de Sprint Planning. Chaque ticket a fait l'objet d'un Planning Poker pour estimer sa complexité. Les priorités reflètent notre stratégie de livraison progressive : d'abord les fondations techniques, puis le moteur de jeu, enfin les scénarios.

---

## Légende

| Story Points | Effort estimé |
|:---:|---|
| **1** | Très simple (~1-2h) – configuration, documentation |
| **2** | Simple (~2-4h) – petite fonctionnalité, bug fix |
| **3** | Modéré (~4-8h) – fonctionnalité standard |
| **5** | Significatif (~1-2 jours) – fonctionnalité complexe |
| **8** | Important (~2-3 jours) – module complet |
| **13** | Très complexe (~3-5 jours) – composant majeur |

| Label | Signification |
|---|---|
| `must-have` | Indispensable au MVP |
| `should-have` | Important mais pas bloquant |
| `could-have` | Nice to have si le temps le permet |
| `tech` | Tâche technique (infra, CI/CD, refacto) |
| `doc` | Documentation |
| `bug` | Correction de bug |
| `spike` | Exploration technique time-boxée |

---

## Vélocité cible

| Sprint | Vélocité cible (SP) | Justification |
|--------|:---:|---|
| Sprint 0 | 21 | Sprint de cadrage, pas de code complexe |
| Sprint 1 | 26 | Fondations + POC, montée en charge |
| Sprint 2 | 34 | Game Engine core, sprint le plus technique |
| Sprint 3 | 34 | Multijoueur + TRIBUNAL, intégration lourde |
| Sprint 4 | 31 | DEEP + UI, capitalisation sur le moteur existant |
| Sprint 5 | 26 | Polish, admin, tests, déploiement |
| Buffer | 13 | Bugs, docs, soutenance |
| **Total** | **185 SP** | |

---

# SPRINT 0 – Cadrage & Setup (Sem 1-2)

> **Objectif** : Poser toutes les bases du projet (documentation, infrastructure, architecture, maquettes) pour que l'équipe puisse coder dès le Sprint 1.
> **Vélocité cible** : 21 SP
> **Critère de succès** : Cahier des charges v1 validé, repo configuré, CI/CD fonctionnel, maquettes approuvées.

## Tickets Sprint 0

### S0-01 : Rédiger le cahier des charges v1
| Champ | Valeur |
|-------|--------|
| **ID** | S0-01 |
| **Épic** | Documentation |
| **Priorité** | `must-have` |
| **Assigné** | Toute l'équipe |
| **Story Points** | 8 |
| **Description** | Rédiger la première version complète du cahier des charges MYTHOS couvrant toutes les sections requises par le RNCP Bloc 1 (faisabilité, veille, architecture, spécifications, risques, planning, KPI, réglementation). |
| **Critères d'acceptation** | - Toutes les 11 sections du CDC sont rédigées |
| | - Chaque compétence C1.1 à C1.7 est couverte |
| | - Le document est relu par tous les membres de l'équipe |
| | - Version PDF exportée et archivée |
| **Dépendances** | Aucune |

### S0-02 : Initialiser le repository GitHub
| Champ | Valeur |
|-------|--------|
| **ID** | S0-02 |
| **Épic** | Infrastructure |
| **Priorité** | `must-have` |
| **Assigné** | Karim + Sofia |
| **Story Points** | 2 |
| **Description** | Créer le repository GitHub avec la structure monorepo (ou multi-repo) pour le projet MYTHOS. Configurer les branches (main, develop, feature/*), les règles de protection de branche, et le template de PR. |
| **Critères d'acceptation** | - Repository créé et accessible par toute l'équipe |
| | - Branche `main` protégée (review obligatoire) |
| | - Branche `develop` créée |
| | - `.gitignore` configuré (Node.js, Next.js, .env) |
| | - README.md avec instructions de setup |
| | - Template de PR et d'issues créés |
| **Dépendances** | Aucune |

### S0-03 : Configurer le projet Next.js (Frontend)
| Champ | Valeur |
|-------|--------|
| **ID** | S0-03 |
| **Épic** | Infrastructure |
| **Priorité** | `must-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 2 |
| **Description** | Initialiser le projet Next.js 14+ avec App Router, TailwindCSS, TypeScript, Zustand. Configurer ESLint, Prettier, et la structure de dossiers. |
| **Critères d'acceptation** | - `npx create-next-app` exécuté avec TypeScript + App Router |
| | - TailwindCSS installé et configuré |
| | - Zustand installé |
| | - ESLint + Prettier configurés |
| | - Structure de dossiers : `app/`, `components/`, `lib/`, `stores/`, `types/` |
| | - Page d'accueil placeholder visible sur `localhost:3000` |
| **Dépendances** | S0-02 |

### S0-04 : Configurer le projet NestJS (Backend)
| Champ | Valeur |
|-------|--------|
| **ID** | S0-04 |
| **Épic** | Infrastructure |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 2 |
| **Description** | Initialiser le projet NestJS avec TypeScript. Configurer les modules de base, Prisma ORM, et la connexion à PostgreSQL. |
| **Critères d'acceptation** | - Projet NestJS créé avec `@nestjs/cli` |
| | - Prisma installé et configuré |
| | - `schema.prisma` avec les premiers modèles (User, GameSession) |
| | - Connexion PostgreSQL fonctionnelle (local ou Docker) |
| | - Endpoint de santé `GET /api/health` → 200 OK |
| | - Structure : `modules/`, `common/`, `config/` |
| **Dépendances** | S0-02 |

### S0-05 : Configurer CI/CD avec GitHub Actions
| Champ | Valeur |
|-------|--------|
| **ID** | S0-05 |
| **Épic** | Infrastructure |
| **Priorité** | `must-have` |
| **Assigné** | Sofia |
| **Story Points** | 3 |
| **Description** | Mettre en place les workflows GitHub Actions pour le lint, les tests, et le déploiement automatique sur Vercel (front) et Railway (back). |
| **Critères d'acceptation** | - Workflow `ci.yml` : lint + tests sur chaque PR |
| | - Workflow `deploy-front.yml` : déploiement Vercel sur merge dans main |
| | - Workflow `deploy-back.yml` : déploiement Railway sur merge dans main |
| | - Badge de statut CI dans le README |
| | - `npm audit` intégré au pipeline |
| **Dépendances** | S0-03, S0-04 |

### S0-06 : Créer les maquettes UI/UX (Figma)
| Champ | Valeur |
|-------|--------|
| **ID** | S0-06 |
| **Épic** | Design |
| **Priorité** | `must-have` |
| **Assigné** | Sofia |
| **Story Points** | 5 |
| **Description** | Concevoir les maquettes de tous les écrans clés de MYTHOS dans Figma : page d'accueil, catalogue scénarios, lobby, game UI (narration, choix, discussion, jauges), écran de fin, admin. Définir le design system (couleurs, typo, composants). |
| **Critères d'acceptation** | - Design system défini (palette sombre immersive, typographies, spacing) |
| | - Maquettes desktop + mobile pour : |
| |   - Page d'accueil + catalogue (2 scénarios) |
| |   - Page détail scénario |
| |   - Lobby (liste joueurs, chat, bouton lancer) |
| |   - Game UI : phase narration (texte streaming) |
| |   - Game UI : phase choix (options + timer) |
| |   - Game UI : phase discussion (chat + bouton prêt) |
| |   - Game UI : jauges de ressources (DEEP) |
| |   - Écran de fin (révélations, résumé, rejouer) |
| |   - Panel admin (dashboard, stats) |
| | - Lien Figma partagé avec l'équipe |
| **Dépendances** | Aucune |

### S0-07 : Configurer GitHub Projects (Kanban)
| Champ | Valeur |
|-------|--------|
| **ID** | S0-07 |
| **Épic** | Gestion de projet |
| **Priorité** | `must-have` |
| **Assigné** | Yasmine |
| **Story Points** | 1 |
| **Description** | Configurer le board GitHub Projects avec les colonnes Kanban, les labels, les milestones (sprints), et importer le backlog initial. |
| **Critères d'acceptation** | - Board avec colonnes : Backlog / To Do / In Progress / Review / Done |
| | - Labels créés : must-have, should-have, could-have, tech, doc, bug, spike |
| | - Milestones : Sprint 0 à Sprint 5 + Buffer |
| | - Tous les tickets du Sprint 0 importés |
| | - Vue Kanban + vue Table configurées |
| **Dépendances** | S0-02 |

---

# SPRINT 1 – Fondations + POC IA (Sem 3-4)

> **Objectif** : Mettre en place l'authentification, le modèle de données complet, et réaliser un POC du flux IA (prompt → génération → affichage) pour valider la faisabilité technique du Game Master IA.
> **Vélocité cible** : 26 SP
> **Critère de succès** : Un utilisateur peut s'inscrire/se connecter ; un appel IA génère une scène narrative jouable en isolation.

## Tickets Sprint 1

### S1-01 : Implémenter le modèle de données complet (Prisma)
| Champ | Valeur |
|-------|--------|
| **ID** | S1-01 |
| **Épic** | Backend – Data |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Définir le schéma Prisma complet avec toutes les entités : User, GameSession, ScenarioPack, Player, GameRound, PlayerChoice. Créer les migrations et les seeds de données initiales (2 Scenario Packs : TRIBUNAL + DEEP). |
| **Critères d'acceptation** | - `schema.prisma` complet avec toutes les entités et relations |
| | - Enums définis : SessionStatus, Phase, PlayerStatus, UserRole |
| | - Migration initiale exécutable (`npx prisma migrate dev`) |
| | - Seed avec : 1 admin, 2 users test, Scenario Pack TRIBUNAL, Scenario Pack DEEP |
| | - `npx prisma studio` permet de visualiser les données |
| **Dépendances** | S0-04 |

### S1-02 : Implémenter l'authentification (Register + Login)
| Champ | Valeur |
|-------|--------|
| **ID** | S1-02 |
| **Épic** | Backend – Auth |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Implémenter le module Auth NestJS avec inscription (register), connexion (login), et middleware JWT. Inclure la validation des entrées et le hashage des mots de passe. |
| **Critères d'acceptation** | - `POST /api/auth/register` : crée un user, retourne JWT |
| | - `POST /api/auth/login` : vérifie credentials, retourne JWT |
| | - Mots de passe hashés avec bcrypt (salt rounds: 10) |
| | - JWT avec expiration 24h, contient userId et role |
| | - Guard `@UseGuards(JwtAuthGuard)` fonctionnel |
| | - Validation DTO avec class-validator (email valide, password min 8 chars) |
| | - Tests unitaires du service Auth (≥ 80% coverage) |
| **Dépendances** | S1-01 |

### S1-03 : Créer les pages Auth frontend (Register + Login)
| Champ | Valeur |
|-------|--------|
| **ID** | S1-03 |
| **Épic** | Frontend – Auth |
| **Priorité** | `must-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 3 |
| **Description** | Créer les pages d'inscription et de connexion avec formulaires, validation côté client, et gestion du token JWT dans le store Zustand. |
| **Critères d'acceptation** | - Page `/register` avec formulaire (username, email, password, confirmation) |
| | - Page `/login` avec formulaire (email, password) |
| | - Validation des champs côté client |
| | - Appels API vers le backend |
| | - Token JWT stocké dans Zustand + localStorage |
| | - Redirection vers `/` après connexion réussie |
| | - Messages d'erreur affichés (email déjà pris, mot de passe incorrect) |
| **Dépendances** | S1-02, S0-03 |

### S1-04 : Créer l'API CRUD Scénarios
| Champ | Valeur |
|-------|--------|
| **ID** | S1-04 |
| **Épic** | Backend – Scenarios |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 3 |
| **Description** | Implémenter les endpoints REST pour lister et consulter les Scenario Packs. |
| **Critères d'acceptation** | - `GET /api/scenarios` : retourne la liste des scénarios (id, name, slug, description, min/max players, duration, tags) |
| | - `GET /api/scenarios/:slug` : retourne le détail complet d'un scénario |
| | - Réponses paginées si nécessaire |
| | - Tests unitaires |
| **Dépendances** | S1-01 |

### S1-05 : POC – AI Service (appel API Anthropic)
| Champ | Valeur |
|-------|--------|
| **ID** | S1-05 |
| **Épic** | Backend – IA |
| **Priorité** | `must-have` | `spike` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Créer le service AI dans NestJS. Implémenter le premier flux complet : construction du prompt à partir d'un Scenario Pack + game_state → appel API Claude → parsing de la réponse JSON (narration + options + private_messages). Valider la latence et la qualité. |
| **Critères d'acceptation** | - `AiService` NestJS créé avec le SDK Anthropic installé |
| | - Méthode `generateNarration(scenarioPack, gameState)` fonctionnelle |
| | - Prompt construit dynamiquement : system prompt scénario + game_state + instructions |
| | - Réponse IA parsée en JSON valide : `{ narration, options, private_messages }` |
| | - Gestion d'erreur : retry 1 fois si parsing échoue, fallback si API down |
| | - Log du temps de réponse (cible < 5s) |
| | - Stratégie duale validée : Sonnet pour narration, Haiku pour setup |
| | - Test avec Scenario Pack TRIBUNAL : génération de 3 tours consécutifs cohérents |
| **Dépendances** | S1-01, S1-04 |

### S1-06 : POC – Page de test IA (frontend)
| Champ | Valeur |
|-------|--------|
| **ID** | S1-06 |
| **Épic** | Frontend – IA |
| **Priorité** | `must-have` | `spike` |
| **Assigné** | Lucas + Karim |
| **Story Points** | 3 |
| **Description** | Créer une page de test temporaire `/poc-ai` qui permet de tester le flux IA de bout en bout : sélectionner un scénario, simuler un game_state, appeler l'API, afficher la narration et les options. |
| **Critères d'acceptation** | - Page `/poc-ai` accessible (dev only) |
| | - Sélection d'un scénario |
| | - Bouton "Générer une scène" qui appelle le backend |
| | - Affichage de la narration avec effet de streaming (texte progressif) |
| | - Affichage des options d'action |
| | - Affichage du temps de réponse |
| | - Possibilité de cliquer sur une option et relancer une génération (tour suivant) |
| **Dépendances** | S1-05 |

### S1-07 : Rédiger les Scenario Packs TRIBUNAL et DEEP (JSON)
| Champ | Valeur |
|-------|--------|
| **ID** | S1-07 |
| **Épic** | Game Design |
| **Priorité** | `must-have` |
| **Assigné** | Zahid + Karim |
| **Story Points** | 5 |
| **Description** | Rédiger les fichiers JSON complets des Scenario Packs TRIBUNAL et DEEP avec tous les champs : settings, roles, resources, phases_override, end_conditions, ai_system_prompt. Tester et itérer les prompts IA pour garantir la qualité narrative. |
| **Critères d'acceptation** | - `tribunal.json` complet : 5 rôles, 5 rounds, phases override, prompt IA testé |
| | - `deep.json` complet : 3 rôles, 4 ressources (O2, énergie, coque, profondeur), 8 rounds, prompt IA testé |
| | - Prompts IA testés sur ≥ 3 parties simulées chacun |
| | - Narration cohérente, options variées, messages privés pertinents |
| | - Les deux fichiers validés en JSON Schema |
| | - Documentés dans `01-faisabilite/GAME_ENGINE_CORE.md` |
| **Dépendances** | S1-05 |

---

# SPRINT 2 – Game Engine Core (Sem 5-6)

> **Objectif** : Implémenter le moteur de jeu universel : boucle de jeu en 6 phases, Game State Manager, Choice Engine, Scenario Pack Loader. Le moteur doit être capable de faire tourner une partie complète en mode "simulation" (sans WebSocket).
> **Vélocité cible** : 34 SP
> **Critère de succès** : Une partie complète de TRIBUNAL peut être jouée via des appels API REST (sans temps réel).

## Tickets Sprint 2

### S2-01 : Implémenter le Scenario Pack Loader
| Champ | Valeur |
|-------|--------|
| **ID** | S2-01 |
| **Épic** | Backend – Game Engine |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 3 |
| **Description** | Service qui charge un Scenario Pack depuis la BDD, valide sa structure JSON, et le rend disponible au Game Engine. |
| **Critères d'acceptation** | - `ScenarioPackLoaderService` créé |
| | - Méthode `load(scenarioId)` retourne un objet Scenario Pack typé |
| | - Validation du JSON contre un schéma TypeScript (interface `ScenarioPack`) |
| | - Erreur explicite si le Scenario Pack est invalide ou introuvable |
| | - Tests unitaires avec fixture TRIBUNAL et DEEP |
| **Dépendances** | S1-01, S1-07 |

### S2-02 : Implémenter le Game State Manager
| Champ | Valeur |
|-------|--------|
| **ID** | S2-02 |
| **Épic** | Backend – Game Engine |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Service qui crée, lit, met à jour et persiste le game_state dans Redis. Le game_state contient : session_id, scenario, current_round, phase, players (avec rôles et secret_info), public_state (narrative_history, revealed_info, resources), private_states, actions_history, end_conditions_met. |
| **Critères d'acceptation** | - `GameStateManagerService` créé |
| | - Méthode `create(sessionId, scenarioPack, players)` → initialise le game_state |
| | - Méthode `get(sessionId)` → retourne le game_state depuis Redis |
| | - Méthode `update(sessionId, partialState)` → merge partiel dans Redis |
| | - Méthode `addToHistory(sessionId, round, narration)` |
| | - Méthode `recordAction(sessionId, round, playerId, action)` |
| | - TTL Redis de 2h (auto-cleanup des sessions abandonnées) |
| | - Tests unitaires complets |
| **Dépendances** | S0-04 |

### S2-03 : Implémenter le Role Manager
| Champ | Valeur |
|-------|--------|
| **ID** | S2-03 |
| **Épic** | Backend – Game Engine |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 3 |
| **Description** | Service qui distribue aléatoirement les rôles aux joueurs en début de partie, en respectant les contraintes du Scenario Pack (count par rôle, rôles "fill" pour compléter). |
| **Critères d'acceptation** | - `RoleManagerService` créé |
| | - Méthode `assignRoles(players, scenarioPack.roles)` → retourne l'assignation |
| | - Rôles fixes (count: 1) assignés en premier, puis "fill" pour compléter |
| | - Distribution aléatoire (Fisher-Yates shuffle) |
| | - Chaque joueur reçoit : role_id, role_name, description, secret_info |
| | - Cas d'erreur : pas assez de joueurs pour les rôles obligatoires |
| | - Tests unitaires (distribution correcte pour 4, 5, 6, 7, 8 joueurs) |
| **Dépendances** | S2-01 |

### S2-04 : Implémenter le Choice Engine
| Champ | Valeur |
|-------|--------|
| **ID** | S2-04 |
| **Épic** | Backend – Game Engine |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Service qui gère la collecte des choix des joueurs pendant la phase ACTION. Supporte les modes : individual (chaque joueur choisit secrètement), vote (majorité), designated (un joueur désigné choisit). Gère les timers et le timeout. |
| **Critères d'acceptation** | - `ChoiceEngineService` créé |
| | - Méthode `startActionPhase(sessionId, options, mode, timerSeconds)` |
| | - Méthode `submitChoice(sessionId, playerId, choiceId)` |
| | - Méthode `getResults(sessionId)` → retourne les choix + résultat agrégé |
| | - Mode `individual` : chaque joueur choisit, résultats envoyés à l'IA individuellement |
| | - Mode `vote` : majorité l'emporte, égalité = aléatoire |
| | - Mode `designated` : seul le joueur désigné choisit |
| | - Timeout : action par défaut configurable (aléatoire ou "passe") |
| | - Tests unitaires pour chaque mode |
| **Dépendances** | S2-02 |

### S2-05 : Implémenter le Resource Manager
| Champ | Valeur |
|-------|--------|
| **ID** | S2-05 |
| **Épic** | Backend – Game Engine |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 3 |
| **Description** | Service qui gère les jauges de ressources pour les scénarios qui en définissent (ex: DEEP). Applique la décroissance par tour, modifie les ressources selon les choix des joueurs, et vérifie les conditions de fin liées aux ressources. |
| **Critères d'acceptation** | - `ResourceManagerService` créé |
| | - Méthode `initResources(scenarioPack.resources)` → initialise les jauges |
| | - Méthode `applyDecay(resources)` → applique decay_per_round |
| | - Méthode `modifyResource(resourceId, delta)` → +/- une valeur (clampée min/max) |
| | - Méthode `checkEndConditions(resources, endConditions)` → boolean + type de fin |
| | - Test avec le Scenario Pack DEEP : O2 descend, coque stable, profondeur modifiable |
| **Dépendances** | S2-02, S2-01 |

### S2-06 : Implémenter le Game Loop Manager
| Champ | Valeur |
|-------|--------|
| **ID** | S2-06 |
| **Épic** | Backend – Game Engine |
| **Priorité** | `must-have` |
| **Assigné** | Karim + Zahid |
| **Story Points** | 13 |
| **Description** | Service central qui orchestre la boucle de jeu en 6 phases. C'est le chef d'orchestre du Game Engine : il appelle le Scenario Pack Loader, le Role Manager, le Game State Manager, le AI Service, le Choice Engine, et le Resource Manager dans le bon ordre. |
| **Critères d'acceptation** | - `GameLoopManagerService` créé |
| | - Phase SETUP : charge le scénario, assigne les rôles, appelle l'IA pour le contexte initial, crée le game_state |
| | - Phase NARRATION : envoie le game_state à l'IA, récupère narration + options |
| | - Phase ACTION : démarre le Choice Engine, collecte les choix |
| | - Phase RÉSOLUTION : envoie les choix à l'IA, met à jour le game_state (y compris ressources) |
| | - Phase DISCUSSION : démarre un timer de discussion |
| | - Phase CHECK FIN : vérifie les end_conditions (max_rounds, resource_zero, vote_reached) |
| | - Phase FINALE : appelle l'IA pour le climax, révèle les rôles |
| | - Transitions de phase automatiques |
| | - Support des `phases_override` du Scenario Pack |
| | - Test d'intégration : partie complète de TRIBUNAL (5 tours) en mode API REST |
| **Dépendances** | S2-01, S2-02, S2-03, S2-04, S2-05, S1-05 |

### S2-07 : Écrire les tests d'intégration du Game Engine
| Champ | Valeur |
|-------|--------|
| **ID** | S2-07 |
| **Épic** | Tests |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Rédiger une suite de tests d'intégration qui simulent une partie complète pour chaque scénario (TRIBUNAL et DEEP) via le Game Loop Manager. |
| **Critères d'acceptation** | - Test TRIBUNAL : partie de 5 tours avec 4 joueurs simulés, vérifie les transitions de phase |
| | - Test DEEP : partie avec jauges, vérifie la décroissance et les conditions de fin |
| | - Test d'erreur : joueur déconnecté en cours de partie |
| | - Test timeout : timer expiré sans choix |
| | - Couverture du Game Engine > 70% |
| | - Tests exécutables en CI (mock de l'API IA pour éviter les coûts) |
| **Dépendances** | S2-06 |

---

# SPRINT 3 – Multijoueur + Scénario TRIBUNAL (Sem 7-8)

> **Objectif** : Ajouter le temps réel (WebSocket), le système de sessions/lobby, et rendre le scénario TRIBUNAL jouable de bout en bout en multijoueur.
> **Vélocité cible** : 34 SP
> **Critère de succès** : 4 joueurs peuvent rejoindre une session, jouer une partie complète de TRIBUNAL en temps réel, et voir l'écran de fin.

## Tickets Sprint 3

### S3-01 : Implémenter le WebSocket Gateway (NestJS + Socket.io)
| Champ | Valeur |
|-------|--------|
| **ID** | S3-01 |
| **Épic** | Backend – Temps réel |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Créer le WebSocket Gateway NestJS avec Socket.io. Implémenter l'authentification JWT sur la connexion WebSocket, la gestion des rooms (1 room = 1 session), et les événements de base. |
| **Critères d'acceptation** | - `GameGateway` NestJS créé avec `@WebSocketGateway()` |
| | - Authentification JWT vérifiée au `handleConnection` |
| | - Événements implémentés : `player:join`, `player:leave`, `game:start` |
| | - Gestion des rooms : un joueur rejoint automatiquement la room de sa session |
| | - Déconnexion propre : le joueur est marqué `disconnected` dans le game_state |
| | - Reconnexion : le joueur retrouve sa room et son état |
| | - Logs des connexions/déconnexions |
| **Dépendances** | S1-02 |

### S3-02 : Implémenter le Session Manager (création + lobby)
| Champ | Valeur |
|-------|--------|
| **ID** | S3-02 |
| **Épic** | Backend – Sessions |
| **Priorité** | `must-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Service gérant le cycle de vie des sessions : création (choix scénario → génère un code unique), gestion du lobby (joueurs connectés, chat pré-partie), et lancement de la partie par l'hôte. |
| **Critères d'acceptation** | - `POST /api/sessions` : crée une session avec code aléatoire (6 chars alphanumériques) |
| | - `GET /api/sessions/:code` : retourne info session + liste joueurs dans le lobby |
| | - `POST /api/sessions/:code/join` : ajoute le joueur à la session |
| | - Événement WS `lobby:player_joined` broadcast quand un joueur rejoint |
| | - Événement WS `lobby:player_left` broadcast quand un joueur quitte |
| | - Événement WS `lobby:chat` pour le chat de lobby |
| | - L'hôte peut lancer la partie quand `nb_joueurs >= min_players` |
| | - Événement WS `game:start` déclenche le Game Loop Manager |
| **Dépendances** | S3-01, S2-06 |

### S3-03 : Connecter le Game Loop au WebSocket
| Champ | Valeur |
|-------|--------|
| **ID** | S3-03 |
| **Épic** | Backend – Intégration |
| **Priorité** | `must-have` |
| **Assigné** | Karim + Zahid |
| **Story Points** | 8 |
| **Description** | Brancher le Game Loop Manager sur le WebSocket Gateway pour que toutes les phases émettent les événements temps réel aux clients : narration, options, résolution, messages privés, jauges, fin de partie. |
| **Critères d'acceptation** | - Phase NARRATION : émet `game:narration` (broadcast) + `game:options` (broadcast) + `game:private_message` (individuel) |
| | - Phase ACTION : écoute `player:choice`, transmet au Choice Engine |
| | - Phase RÉSOLUTION : émet `game:resolution` (broadcast) + `game:resources_update` (si applicable) |
| | - Phase DISCUSSION : émet `game:phase_change` → les clients affichent le chat |
| | - Phase FINALE : émet `game:finale` avec toutes les révélations |
| | - `timer:tick` émis chaque seconde pendant les phases avec timer |
| | - `game:phase_change` émis à chaque transition de phase |
| | - Test : 2 clients WebSocket connectés simultanément reçoivent les bonnes données |
| **Dépendances** | S3-01, S3-02, S2-06 |

### S3-04 : Frontend – Page catalogue des scénarios
| Champ | Valeur |
|-------|--------|
| **ID** | S3-04 |
| **Épic** | Frontend – Pages |
| **Priorité** | `must-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 3 |
| **Description** | Page d'accueil affichant les scénarios disponibles sous forme de cartes. Clic sur une carte → page détail du scénario. Bouton "Créer une partie". |
| **Critères d'acceptation** | - Page `/` affiche les cards scénarios (appel `GET /api/scenarios`) |
| | - Chaque card : nom, description courte, tags, nb joueurs, durée |
| | - Clic sur card → `/scenarios/:slug` (page détail) |
| | - Page détail : description complète, bouton "Créer une partie" |
| | - Responsive (grille 2 colonnes desktop, 1 colonne mobile) |
| | - Design conforme aux maquettes Figma |
| **Dépendances** | S1-04, S0-06 |

### S3-05 : Frontend – Page lobby
| Champ | Valeur |
|-------|--------|
| **ID** | S3-05 |
| **Épic** | Frontend – Pages |
| **Priorité** | `must-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 5 |
| **Description** | Page de lobby pour attendre les joueurs avant le lancement. Affiche la liste des joueurs connectés en temps réel, un chat de lobby, le code d'invitation copiable, et le bouton "Lancer la partie" (hôte uniquement). |
| **Critères d'acceptation** | - Page `/session/:code` accessible après création ou join |
| | - Connexion WebSocket établie automatiquement |
| | - Liste des joueurs mise à jour en temps réel (join/leave) |
| | - Code d'invitation affiché avec bouton "Copier" |
| | - Chat de lobby fonctionnel (envoi/réception via WS) |
| | - Bouton "Lancer" visible uniquement par l'hôte, activé quand min_players atteint |
| | - Clic "Lancer" → transition vers la Game UI |
| **Dépendances** | S3-02, S3-01 |

### S3-06 : Frontend – Game UI (narration + choix + discussion)
| Champ | Valeur |
|-------|--------|
| **ID** | S3-06 |
| **Épic** | Frontend – Game UI |
| **Priorité** | `must-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 8 |
| **Description** | Interface de jeu principale. Affiche la narration (avec streaming), les options de choix (avec timer), la phase de discussion (chat), le panneau d'infos privées (rôle, secret), et l'indicateur de tour. |
| **Critères d'acceptation** | - Composant `NarrationPanel` : affiche le texte narratif avec effet de streaming |
| | - Composant `ChoicePanel` : affiche les options + timer + bouton de sélection |
| | - Composant `DiscussionPanel` : chat libre + bouton "Prêt" + timer |
| | - Composant `PrivateInfoPanel` : affiche rôle, objectif, indices secrets du joueur |
| | - Composant `ProgressBar` : tour actuel / total |
| | - Composant `PhaseIndicator` : affiche la phase en cours |
| | - Transitions animées entre les phases |
| | - Écoute des événements WS et mise à jour réactive via Zustand |
| | - Responsive mobile |
| **Dépendances** | S3-03, S0-06 |

### S3-07 : Test E2E – Partie complète TRIBUNAL
| Champ | Valeur |
|-------|--------|
| **ID** | S3-07 |
| **Épic** | Tests |
| **Priorité** | `must-have` |
| **Assigné** | Toute l'équipe |
| **Story Points** | 3 |
| **Description** | Test de bout en bout d'une partie complète de TRIBUNAL avec 4 joueurs (navigateurs réels ou puppeteer). Vérifier que toutes les phases se déroulent correctement. |
| **Critères d'acceptation** | - 4 navigateurs/onglets ouverts simultanément |
| | - Créer session → 3 joueurs rejoignent → Lancer |
| | - 5 tours joués : narration, choix, résolution, discussion |
| | - Rôles secrets correctement distribués et affichés |
| | - Écran de fin avec révélations |
| | - Aucune erreur console, aucun crash |
| | - Temps de réponse IA < 5s mesuré |
| **Dépendances** | S3-06 |

---

# SPRINT 4 – Scénario DEEP + UI complète (Sem 9-10)

> **Objectif** : Rendre le scénario DEEP jouable (avec jauges de ressources), finaliser l'UI game complète, ajouter l'écran de fin et le streaming IA.
> **Vélocité cible** : 31 SP
> **Critère de succès** : DEEP et TRIBUNAL sont jouables de bout en bout. L'UI est conforme aux maquettes.

## Tickets Sprint 4

### S4-01 : Frontend – Composant jauges de ressources
| Champ | Valeur |
|-------|--------|
| **ID** | S4-01 |
| **Épic** | Frontend – Game UI |
| **Priorité** | `must-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 3 |
| **Description** | Composant React affichant les jauges de ressources (O2, énergie, coque, profondeur) pour le scénario DEEP. Barres visuelles + labels textuels (accessibilité). Animation de transition quand une valeur change. |
| **Critères d'acceptation** | - Composant `ResourceGauges` affiche les barres de jauges dynamiquement |
| | - Couleurs : vert > 60%, orange 30-60%, rouge < 30% |
| | - Labels textuels (ex: "Oxygène : 45/100") pour l'accessibilité |
| | - Animation smooth quand une valeur change |
| | - Écoute de l'événement WS `game:resources_update` |
| | - Conditionnel : le composant ne s'affiche que si le scénario a des resources |
| | - Responsive |
| **Dépendances** | S2-05, S3-06 |

### S4-02 : Frontend – Écran de fin de partie
| Champ | Valeur |
|-------|--------|
| **ID** | S4-02 |
| **Épic** | Frontend – Game UI |
| **Priorité** | `must-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 5 |
| **Description** | Écran affiché à la fin de la partie : climax narratif, révélation de tous les rôles, résumé de la partie (choix clés), résultat (victoire/défaite), et boutons "Rejouer" / "Retour au catalogue". |
| **Critères d'acceptation** | - Section : texte du climax final (narration IA) |
| | - Section : tableau de révélation des rôles (joueur → rôle → objectif secret) |
| | - Section : timeline résumée (moments clés de chaque tour) |
| | - Section : résultat (victoire/défaite avec explication) |
| | - Pour DEEP : affichage final des jauges |
| | - Bouton "Rejouer" → retour au lobby avec même session |
| | - Bouton "Nouveau scénario" → retour au catalogue |
| | - Animations d'apparition (reveal progressif) |
| **Dépendances** | S3-06 |

### S4-03 : Implémenter le streaming IA (réponse progressive)
| Champ | Valeur |
|-------|--------|
| **ID** | S4-03 |
| **Épic** | Backend – IA |
| **Priorité** | `should-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Modifier l'AI Service pour utiliser le streaming de l'API Claude. La narration est envoyée progressivement via WebSocket au fur et à mesure que l'IA génère le texte, donnant un effet "l'IA écrit en temps réel". |
| **Critères d'acceptation** | - AI Service utilise `stream: true` dans l'appel API Anthropic |
| | - Les chunks de texte sont émis via WS `game:narration_chunk` |
| | - Le frontend concatène les chunks et affiche le texte progressivement |
| | - Le JSON structuré (options, private_messages) est parsé à la fin du stream |
| | - Fallback : si le streaming échoue, retour au mode non-streamé |
| | - Temps perçu par le joueur réduit (première ligne visible < 1s) |
| **Dépendances** | S1-05, S3-03 |

### S4-04 : Test E2E – Partie complète DEEP
| Champ | Valeur |
|-------|--------|
| **ID** | S4-04 |
| **Épic** | Tests |
| **Priorité** | `must-have` |
| **Assigné** | Toute l'équipe |
| **Story Points** | 3 |
| **Description** | Test de bout en bout d'une partie complète de DEEP avec 3-4 joueurs. Vérifier les jauges, la décroissance, les conditions de fin (victoire et défaite). |
| **Critères d'acceptation** | - Partie DEEP jouable de bout en bout |
| | - Jauges affichées et mises à jour à chaque tour |
| | - Scénario de victoire testé (profondeur → 0) |
| | - Scénario de défaite testé (O2 → 0) |
| | - Écran de fin cohérent avec le résultat |
| **Dépendances** | S4-01, S4-02 |

### S4-05 : Frontend – Historique narratif (timeline)
| Champ | Valeur |
|-------|--------|
| **ID** | S4-05 |
| **Épic** | Frontend – Game UI |
| **Priorité** | `should-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 3 |
| **Description** | Panneau latéral ou modal affichant l'historique des tours passés : résumé de chaque narration et choix effectués. Permet au joueur de se rafraîchir la mémoire. |
| **Critères d'acceptation** | - Bouton "Historique" dans la Game UI |
| | - Panel/modal avec la liste des tours (1, 2, 3...) |
| | - Chaque tour : résumé de la narration + choix effectué |
| | - Scrollable |
| | - Fermeture facile (clic extérieur ou bouton fermer) |
| **Dépendances** | S3-06 |

### S4-06 : Polir l'UI Game – Responsive + Animations
| Champ | Valeur |
|-------|--------|
| **ID** | S4-06 |
| **Épic** | Frontend – Polish |
| **Priorité** | `must-have` |
| **Assigné** | Lucas + Sofia |
| **Story Points** | 5 |
| **Description** | Pass de polish sur toute la Game UI : responsive mobile parfait, animations de transition entre phases, micro-interactions, loading states, états vides/erreur. |
| **Critères d'acceptation** | - Game UI parfaitement utilisable sur mobile (320px+) |
| | - Transitions animées entre chaque phase (fade/slide) |
| | - Loading state "L'IA réfléchit..." avec animation |
| | - Timer : animation de compte à rebours (cercle ou barre) |
| | - États d'erreur : message clair si déconnexion, timeout IA, etc. |
| | - Conformité avec les maquettes Figma |
| **Dépendances** | S3-06, S0-06 |

### S4-07 : Gestion de la reconnexion joueur
| Champ | Valeur |
|-------|--------|
| **ID** | S4-07 |
| **Épic** | Backend – Robustesse |
| **Priorité** | `should-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Gérer le cas où un joueur se déconnecte en cours de partie (fermeture navigateur, perte réseau). Le joueur doit pouvoir se reconnecter et retrouver l'état de la partie. |
| **Critères d'acceptation** | - Déconnexion détectée : joueur marqué `disconnected` dans le game_state |
| | - La partie continue (le joueur disconnecté passe en timeout automatique) |
| | - Reconnexion : le joueur rejoint la room et reçoit le game_state courant |
| | - L'UI se remet à jour immédiatement après reconnexion |
| | - Si le joueur ne revient pas après 2 minutes : il est définitivement sorti |
| | - Message aux autres joueurs : "[Joueur] s'est déconnecté / reconnecté" |
| **Dépendances** | S3-01, S3-03 |

---

# SPRINT 5 – Admin + Accessibilité + Déploiement (Sem 11-12)

> **Objectif** : Ajouter le panel d'administration, garantir l'accessibilité WCAG AA, déployer en production, et écrire les tests finaux.
> **Vélocité cible** : 26 SP
> **Critère de succès** : MVP déployé en production, accessible, avec panel admin fonctionnel.

## Tickets Sprint 5

### S5-01 : Backend – API Admin (stats + gestion)
| Champ | Valeur |
|-------|--------|
| **ID** | S5-01 |
| **Épic** | Backend – Admin |
| **Priorité** | `should-have` |
| **Assigné** | Karim |
| **Story Points** | 5 |
| **Description** | Endpoints admin protégés (role: admin) : statistiques d'utilisation, liste des sessions, gestion des utilisateurs. |
| **Critères d'acceptation** | - `GET /api/admin/stats` : nb sessions total, nb joueurs, scénario le plus joué, durée moyenne, taux de complétion |
| | - `GET /api/admin/sessions` : liste paginée des sessions (actives + passées) |
| | - `GET /api/admin/users` : liste paginée des utilisateurs |
| | - `PATCH /api/admin/users/:id` : ban/unban un utilisateur |
| | - Tous les endpoints protégés par `AdminGuard` (vérifie role: admin dans JWT) |
| | - Tests unitaires |
| **Dépendances** | S1-02 |

### S5-02 : Frontend – Panel d'administration
| Champ | Valeur |
|-------|--------|
| **ID** | S5-02 |
| **Épic** | Frontend – Admin |
| **Priorité** | `should-have` |
| **Assigné** | Yasmine + Lucas |
| **Story Points** | 5 |
| **Description** | Interface d'administration avec dashboard de stats, liste des sessions, et gestion des utilisateurs. Accessible uniquement aux admins. |
| **Critères d'acceptation** | - Page `/admin` protégée (redirect si non-admin) |
| | - Dashboard : cartes de stats (nb sessions, joueurs, scénario populaire, durée moyenne) |
| | - Tableau des sessions (filtres : actives/terminées/annulées) |
| | - Tableau des utilisateurs (recherche, bouton ban) |
| | - Design conforme, responsive |
| **Dépendances** | S5-01 |

### S5-03 : Audit et corrections d'accessibilité
| Champ | Valeur |
|-------|--------|
| **ID** | S5-03 |
| **Épic** | Accessibilité |
| **Priorité** | `must-have` |
| **Assigné** | Sofia + Lucas |
| **Story Points** | 5 |
| **Description** | Audit complet d'accessibilité (Lighthouse + WAVE + test manuel clavier/lecteur d'écran) et corrections pour atteindre WCAG 2.1 AA sur toutes les pages. |
| **Critères d'acceptation** | - Lighthouse Accessibility > 90 sur toutes les pages |
| | - WAVE : 0 erreur, alertes justifiées documentées |
| | - Navigation clavier : toutes les actions accessibles au clavier |
| | - Lecteur d'écran : test VoiceOver (Mac) ou NVDA (Windows) sur le flux de jeu complet |
| | - Contrastes : ratio ≥ 4.5:1 vérifié |
| | - Attributs ARIA sur tous les composants interactifs |
| | - Option "Timers prolongés" dans les paramètres du lobby |
| | - Rapport d'audit exporté (PDF) pour le dossier RNCP |
| **Dépendances** | S4-06 |

### S5-04 : Déploiement production
| Champ | Valeur |
|-------|--------|
| **ID** | S5-04 |
| **Épic** | Infrastructure |
| **Priorité** | `must-have` |
| **Assigné** | Sofia |
| **Story Points** | 3 |
| **Description** | Déployer le MVP complet en production sur Vercel (front) + Railway (back + PostgreSQL + Redis). Configurer les variables d'environnement, le domaine, et le monitoring de base. |
| **Critères d'acceptation** | - Frontend déployé sur Vercel avec URL publique |
| | - Backend déployé sur Railway avec URL publique |
| | - PostgreSQL et Redis provisionés sur Railway |
| | - Variables d'environnement configurées (API keys, DB URL, etc.) |
| | - HTTPS actif sur les deux URLs |
| | - Health check fonctionnel (`/api/health` → 200) |
| | - CORS configuré pour le domaine frontend |
| | - Test de bout en bout sur la prod (1 partie complète) |
| **Dépendances** | S5-03 |

### S5-05 : Configurer le monitoring et le health check
| Champ | Valeur |
|-------|--------|
| **ID** | S5-05 |
| **Épic** | Infrastructure |
| **Priorité** | `should-have` |
| **Assigné** | Sofia |
| **Story Points** | 2 |
| **Description** | Mettre en place le monitoring de base : UptimeRobot pour le health check, logging structuré côté backend, et dashboard des coûts API Anthropic. |
| **Critères d'acceptation** | - UptimeRobot configuré : ping `/api/health` toutes les 5 min |
| | - Alertes par email/Discord si downtime |
| | - Logs structurés (JSON) côté NestJS avec niveaux (info, warn, error) |
| | - Dashboard Anthropic consulté : coûts du mois en cours |
| | - Métriques basiques loguées : nb sessions/jour, temps moyen IA, erreurs IA |
| **Dépendances** | S5-04 |

### S5-06 : Écrire les tests finaux (couverture cible)
| Champ | Valeur |
|-------|--------|
| **ID** | S5-06 |
| **Épic** | Tests |
| **Priorité** | `must-have` |
| **Assigné** | Toute l'équipe |
| **Story Points** | 5 |
| **Description** | Compléter les tests unitaires et d'intégration pour atteindre la couverture cible. Rédiger les tests E2E critiques. |
| **Critères d'acceptation** | - Backend : couverture > 60% |
| | - Frontend : couverture > 40% |
| | - Tests E2E : flux complet (register → créer session → jouer → fin) automatisé |
| | - Tous les tests passent en CI |
| | - Rapport de couverture généré et archivé |
| **Dépendances** | Tous les tickets précédents |

### S5-07 : Mesurer l'éco-index
| Champ | Valeur |
|-------|--------|
| **ID** | S5-07 |
| **Épic** | Numérique responsable |
| **Priorité** | `must-have` |
| **Assigné** | Sofia |
| **Story Points** | 1 |
| **Description** | Exécuter GreenIT Analysis sur toutes les pages en production. Documenter les scores et les axes d'amélioration. |
| **Critères d'acceptation** | - GreenIT Analysis exécuté sur : accueil, lobby, game UI, admin |
| | - Score éco-index ≥ 50 sur toutes les pages |
| | - Poids des pages < 1 Mo |
| | - Rapport exporté pour le dossier RNCP |
| | - Si score < 50 : actions correctives listées |
| **Dépendances** | S5-04 |

---

# SPRINT BUFFER – Finalisation (Sem 13-14)

> **Objectif** : Corriger les derniers bugs, finaliser la documentation, préparer la soutenance, tourner la vidéo de démo.
> **Vélocité cible** : 13 SP
> **Critère de succès** : Tous les livrables prêts pour la soutenance.

## Tickets Sprint Buffer

### SB-01 : Corriger les bugs restants
| Champ | Valeur |
|-------|--------|
| **ID** | SB-01 |
| **Épic** | Bugs |
| **Priorité** | `must-have` |
| **Assigné** | Toute l'équipe |
| **Story Points** | 5 |
| **Description** | Traiter tous les bugs ouverts identifiés pendant les sprints précédents. Prioriser les bugs bloquants et majeurs. |
| **Critères d'acceptation** | - 0 bug bloquant ouvert |
| | - 0 bug majeur ouvert |
| | - Bugs mineurs documentés comme "limites connues" |
| | - Chaque fix accompagné d'un test de non-régression |
| **Dépendances** | Tous les sprints |

### SB-02 : Rédiger la documentation technique finale
| Champ | Valeur |
|-------|--------|
| **ID** | SB-02 |
| **Épic** | Documentation |
| **Priorité** | `must-have` |
| **Assigné** | Toute l'équipe |
| **Story Points** | 3 |
| **Description** | Finaliser toute la documentation du projet : README avec procédure de démarrage, documentation technique (API, WebSocket, Scenario Packs), et mise à jour du cahier des charges si nécessaire. |
| **Critères d'acceptation** | - README complet : description, stack, procédure d'installation, migrations/seeds, lancement dev, lancement tests |
| | - Documentation API (endpoints REST + événements WS) à jour |
| | - Documentation Scenario Pack (comment en créer un nouveau) |
| | - Cahier des charges mis à jour (version finale) |
| | - Journal de bord d'équipe finalisé (Notion) |
| **Dépendances** | SB-01 |

### SB-03 : Rédiger l'annexe retour d'expérience
| Champ | Valeur |
|-------|--------|
| **ID** | SB-03 |
| **Épic** | Documentation |
| **Priorité** | `must-have` |
| **Assigné** | Toute l'équipe (individuel) |
| **Story Points** | 2 |
| **Description** | Chaque membre rédige son annexe de retour d'expérience : écarts entre prévisionnel et réalisé, limites identifiées, axes d'amélioration du cahier des charges. |
| **Critères d'acceptation** | - Chaque membre a un document individuel (PDF, 2-3 pages) |
| | - Écarts documentés (planning, budget, fonctionnalités) |
| | - Limites techniques identifiées (latence IA, cohérence narrative, etc.) |
| | - Propositions concrètes d'amélioration |
| | - Bilan personnel / analyse réflexive |
| **Dépendances** | SB-01 |

### SB-04 : Tourner la vidéo de démonstration
| Champ | Valeur |
|-------|--------|
| **ID** | SB-04 |
| **Épic** | Livrable |
| **Priorité** | `must-have` |
| **Assigné** | Sofia + Zahid |
| **Story Points** | 2 |
| **Description** | Tourner et monter une vidéo de démonstration du MVP montrant le parcours complet : catalogue → création session → lobby → partie TRIBUNAL → partie DEEP → écran de fin. |
| **Critères d'acceptation** | - Durée : 3-5 minutes |
| | - Montre les 2 scénarios (TRIBUNAL + DEEP) |
| | - Qualité professionnelle (résolution ≥ 1080p, voix off ou sous-titres) |
| | - Publiée sur YouTube (lien public) |
| | - Lien ajouté dans le README |
| **Dépendances** | SB-01 |

### SB-05 : Préparer la soutenance
| Champ | Valeur |
|-------|--------|
| **ID** | SB-05 |
| **Épic** | Soutenance |
| **Priorité** | `must-have` |
| **Assigné** | Toute l'équipe |
| **Story Points** | 3 |
| **Description** | Préparer les supports de soutenance : slides pour la présentation collective (10 min) et préparation individuelle pour l'évaluation RNCP (20 min par candidat). |
| **Critères d'acceptation** | - Slides collective : contexte, méthodologie, démo, bilan (10 min) |
| | - Chaque membre prépare sa présentation individuelle couvrant C1.1 à C1.7 |
| | - Extraits de livrables prêts à montrer (planning, KPI, backlog, risques) |
| | - Captures d'écran de GitHub Projects, Notion, monitoring |
| | - Répétition en groupe effectuée (chrono respecté) |
| **Dépendances** | SB-02, SB-03, SB-04 |

---

# Résumé des sprints

| Sprint | Semaines | Nb tickets | SP total | Thème principal |
|--------|:---:|:---:|:---:|---|
| **Sprint 0** | 1-2 | 7 | 23 | Cadrage, setup, maquettes, CI/CD |
| **Sprint 1** | 3-4 | 7 | 29 | Auth, BDD, POC IA, Scenario Packs |
| **Sprint 2** | 5-6 | 7 | 37 | Game Engine complet (6 phases) |
| **Sprint 3** | 7-8 | 7 | 37 | WebSocket, lobby, TRIBUNAL jouable |
| **Sprint 4** | 9-10 | 7 | 29 | DEEP jouable, UI finale, streaming |
| **Sprint 5** | 11-12 | 7 | 26 | Admin, accessibilité, déploiement |
| **Buffer** | 13-14 | 5 | 15 | Bugs, docs, vidéo, soutenance |
| **TOTAL** | 14 sem | **47 tickets** | **196 SP** | |

---

# Définition of Done (DoD)

Chaque ticket est considéré "Done" quand :

1. Le code est écrit et fonctionnel
2. Les tests unitaires sont écrits et passent
3. Le code a été review par au moins 1 autre membre
4. La PR est mergée dans `develop`
5. La fonctionnalité est testée manuellement sur l'environnement de dev
6. La documentation est mise à jour si nécessaire
7. Les critères d'acceptation sont tous validés

---

# Définition of Ready (DoR)

Un ticket est "Ready" pour être développé quand :

1. La description est claire et complète
2. Les critères d'acceptation sont définis
3. Les dépendances sont identifiées et résolues
4. Les maquettes sont disponibles (si UI)
5. Le ticket est estimé en story points
6. Le ticket est assigné à un membre
