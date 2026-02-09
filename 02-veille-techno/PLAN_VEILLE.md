# Plan de Veille Technologique et Concurrentielle

## Projet MYTHOS -- Plateforme de jeux narratifs multijoueurs pilotés par IA

| Information       | Detail                                      |
| ----------------- | ------------------------------------------- |
| **Projet**        | MYTHOS                                      |
| **Version**       | 1.0                                         |
| **Date**          | 09 fevrier 2026                             |
| **Responsable**   | Chef de projet MYTHOS                       |
| **Equipe**        | 4-5 personnes                               |
| **Duree projet**  | 14 semaines                                 |

---

## Table des matieres

1. [Objectifs strategiques de la veille](#1-objectifs-strategiques-de-la-veille)
2. [Perimetre de veille -- Les 4 axes](#2-perimetre-de-veille--les-4-axes)
3. [Organisation operationnelle](#3-organisation-operationnelle)
4. [Matrice des outils de veille](#4-matrice-des-outils-de-veille)
5. [Calendrier de veille type](#5-calendrier-de-veille-type)
6. [Template de fiche de veille hebdomadaire](#6-template-de-fiche-de-veille-hebdomadaire)
7. [Template de note de veille](#7-template-de-note-de-veille)
8. [Indicateurs d'efficacite de la veille](#8-indicateurs-defficacite-de-la-veille)
9. [Budget veille](#9-budget-veille)

---

## 1. Objectifs strategiques de la veille

### 1.1 Alignement avec les objectifs projet

Le plan de veille MYTHOS est directement lie aux objectifs strategiques du projet. Chaque objectif de veille alimente une decision projet concrete.

| # | Objectif projet                                                  | Objectif de veille associe                                                     | Priorite  |
| - | ---------------------------------------------------------------- | ------------------------------------------------------------------------------ | --------- |
| 1 | Proposer une experience narrative immersive pilotee par IA       | Suivre les avancees des LLM (Claude, GPT, Llama) en generation narrative       | Critique  |
| 2 | Garantir une experience temps reel fluide (2-8 joueurs)          | Evaluer les technologies WebSocket, WebRTC, CRDT pour le multijoueur           | Critique  |
| 3 | Lancer 2 scenarios (TRIBUNAL, DEEP) en 14 semaines              | Identifier les patterns de game design narratif et les formats JSON de config  | Haute     |
| 4 | Cibler les joueurs casual (sessions 15-25 min)                   | Analyser le marche du jeu casual/social et les attentes UX                     | Haute     |
| 5 | Construire un moteur de jeu universel (6 phases)                 | Surveiller les architectures de moteurs de jeu modulaires                      | Moyenne   |
| 6 | Assurer l'eco-conception et l'accessibilite                      | Suivre les normes RGAA/WCAG, les bonnes pratiques GreenIT et le RGESN         | Moyenne   |
| 7 | Preparer la scalabilite post-MVP                                 | Anticiper les evolutions d'infrastructure (serverless, edge computing)         | Basse     |

### 1.2 Resultats attendus de la veille

- **Court terme (semaines 1-4)** : Validation des choix technologiques (stack, APIs IA, protocole temps reel).
- **Moyen terme (semaines 5-10)** : Ajustements fonctionnels bases sur l'analyse concurrentielle et les tendances marche.
- **Long terme (semaines 11-14+)** : Constitution d'une base de connaissances perenne pour les evolutions post-MVP.

---

## 2. Perimetre de veille -- Les 4 axes

### Axe 1 : IA generative pour le gaming

> Comprendre et exploiter les avancees de l'IA generative pour creer un Game Master intelligent, coherent et engageant.

| Element          | Detail                                                                                                                                                    |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mots-cles**    | LLM gaming, AI game master, AI dungeon master, generative AI narrative, prompt engineering RPG, Claude API, GPT-4 gaming, AI storytelling, NPC generation, dynamic narrative AI, text generation games, function calling LLM, structured output AI, AI safety gaming, content moderation AI |
| **Sources**      | Blog Anthropic, Blog OpenAI, ArXiv (cs.AI, cs.CL), Hugging Face blog, Google DeepMind blog, AI Game Dev (newsletter), GDC Vault (talks IA), Papers With Code, Semantic Scholar |
| **Outils**       | Google Scholar Alerts, Semantic Scholar Alerts, RSS Feedly (blogs IA), GitHub Trending (AI repos), Twitter/X listes IA gaming                             |
| **Frequence**    | Quotidienne (flux RSS), Hebdomadaire (analyse approfondie), Mensuelle (synthese tendances)                                                                |
| **Responsable**  | Developpeur Backend / Specialiste IA                                                                                                                      |

**Questions de veille prioritaires :**

1. Quelles sont les meilleures pratiques de prompt engineering pour la generation narrative interactive ?
2. Comment gerer la coherence narrative sur des sessions de 15-25 minutes avec un LLM ?
3. Quels sont les couts reels d'utilisation de l'API Claude pour des sessions de jeu multijoueur ?
4. Comment implementer des garde-fous (safety) pour le contenu genere en contexte de jeu ?
5. Quelles alternatives ou complements a Claude existent pour reduire la latence et les couts ?

---

### Axe 2 : Technologies temps reel et multijoueur

> Maitriser les technologies permettant une experience multijoueur fluide, synchrone et resiliente.

| Element          | Detail                                                                                                                                                    |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mots-cles**    | WebSocket scalability, Socket.io alternatives, real-time multiplayer architecture, Redis Pub/Sub, game state synchronization, CRDT multiplayer, WebRTC data channels, server-sent events gaming, low-latency game server, NestJS WebSocket gateway, Next.js real-time, connection resilience, reconnection strategy |
| **Sources**      | Documentation Socket.io, Blog Redis, Blog Ably, Blog Pusher, Hacker News, Dev.to, Medium (system design), InfoQ, High Scalability blog, GDC Vault (networking talks) |
| **Outils**       | GitHub Watch (repos Socket.io, NestJS, Redis), Stack Overflow tags, Discord communautes (NestJS, Socket.io), RSS Feedly                                  |
| **Frequence**    | Bi-hebdomadaire (scan technologique), Mensuelle (benchmark performances)                                                                                  |
| **Responsable**  | Developpeur Fullstack                                                                                                                                     |

**Questions de veille prioritaires :**

1. Socket.io vs alternatives (ws, uWebSockets.js, Ably) : quel est le meilleur rapport simplicite/performance pour 2-8 joueurs ?
2. Comment gerer la reconnexion transparente en cas de perte de connexion ?
3. Quelles sont les meilleures strategies de synchronisation d'etat de jeu avec Redis ?
4. Comment scaler au-dela de 1000 sessions simultanees post-MVP ?
5. Quels patterns d'architecture adopter pour le game loop cote serveur (6 phases) ?

---

### Axe 3 : Marche du jeu narratif et social

> Comprendre le marche, les concurrents et les attentes des joueurs casual pour positionner MYTHOS de maniere unique.

| Element          | Detail                                                                                                                                                    |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mots-cles**    | social deduction games, narrative multiplayer games, party games online, AI games market, casual gaming trends 2026, interactive fiction multiplayer, werewolf online games, text-based multiplayer, indie game market, free-to-play narrative, Gen Z gaming habits, short-session games, mobile-first casual games |
| **Sources**      | Newzoo (rapports gaming), Sensor Tower, App Annie / data.ai, Steam Charts, Itch.io trending, Product Hunt (gaming), GameDiscoverCo (newsletter), Deconstructor of Fun (blog), GamesIndustry.biz, Gamasutra/Game Developer, Reddit r/gamedesign r/indiegaming |
| **Outils**       | Google Trends, SimilarWeb, Product Hunt, App Store / Play Store reviews, Steam Reviews, Discord communautes gaming, Twitch/YouTube Gaming (tendances)     |
| **Frequence**    | Hebdomadaire (scan marche), Mensuelle (analyse concurrentielle), Trimestrielle (rapport de marche)                                                       |
| **Responsable**  | Chef de projet / Product Owner                                                                                                                            |

**Questions de veille prioritaires :**

1. Quels jeux narratifs multijoueurs ont emerge recemment et quelle est leur traction ?
2. Quelles sont les attentes des joueurs casual en termes de duree de session, d'onboarding et d'accessibilite ?
3. Quels modeles economiques fonctionnent pour les jeux narratifs independants ?
4. Comment les concurrents integrent-ils l'IA dans leur experience de jeu ?
5. Quelles sont les tendances de la social deduction (post-Among Us) ?

---

### Axe 4 : Eco-conception et accessibilite

> Integrer des la conception les principes d'eco-conception numerique et d'accessibilite universelle.

| Element          | Detail                                                                                                                                                    |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mots-cles**    | eco-conception web, RGESN, RGAA 4.1, WCAG 2.2, green IT, sobriete numerique, accessibilite jeux video, game accessibility guidelines, carbon footprint API, sustainable web design, performance web, Core Web Vitals, inclusive game design, screen reader gaming |
| **Sources**      | GreenIT.fr, Collectif Conception Responsable, W3C WAI, Blog Access42, Blog Temesis, IGDA Game Accessibility SIG, AbleGamers, Can I Play That?, ADEME, EcoIndex, Blog Mozilla Accessibility |
| **Outils**       | Lighthouse, EcoIndex, WAVE, Axe DevTools, GreenFrame, Website Carbon Calculator, Pa11y                                                                   |
| **Frequence**    | Bi-mensuelle (scan normatif), Mensuelle (audit interne), A chaque sprint (checklist accessibilite)                                                        |
| **Responsable**  | Developpeur Frontend / Referent Accessibilite                                                                                                             |

**Questions de veille prioritaires :**

1. Comment mesurer et optimiser l'empreinte carbone des appels API vers l'IA (Claude) ?
2. Quelles sont les exigences RGAA 4.1 applicables a une application web de jeu ?
3. Comment rendre une experience textuelle/narrative accessible aux joueurs malvoyants ?
4. Quelles sont les bonnes pratiques de performance pour les applications Next.js en temps reel ?
5. Comment le RGESN s'applique-t-il a notre architecture (Next.js + NestJS + Redis + PostgreSQL) ?

---

## 3. Organisation operationnelle

### 3.1 Processus de collecte

```
+------------------+     +------------------+     +------------------+     +------------------+
|   1. COLLECTE    | --> |   2. ANALYSE     | --> |   3. DIFFUSION   | --> |   4. ARCHIVAGE   |
|                  |     |                  |     |                  |     |                  |
| - Flux RSS       |     | - Pertinence     |     | - Stand-up       |     | - Notion/Wiki    |
| - Alertes auto   |     | - Impact projet  |     | - Canal Slack    |     | - Tags par axe   |
| - Curation       |     | - Fiche de note  |     | - Revue sprint   |     | - Historique     |
| - Scan manuel    |     | - Recommandation |     | - Email recap    |     | - Recherche full |
+------------------+     +------------------+     +------------------+     +------------------+
```

### 3.2 Detail de chaque etape

#### Etape 1 -- Collecte

| Methode                  | Description                                          | Responsable       | Frequence       |
| ------------------------ | ---------------------------------------------------- | ----------------- | --------------- |
| Alertes automatiques     | Google Alerts, Semantic Scholar, GitHub Watch         | Tous              | Continue        |
| Flux RSS agreges         | Feedly avec dossiers par axe de veille               | Referent veille   | Quotidienne     |
| Scan manuel reseaux      | Twitter/X, Reddit, Discord, Hacker News              | Rotation equipe   | Quotidienne     |
| Newsletters              | Inscription aux newsletters cles (voir matrice)      | Referent veille   | Hebdomadaire    |
| Conferences / Meetups    | GDC, NeurIPS, Next.js Conf, Paris Web                | Chef de projet    | Ponctuelle      |

#### Etape 2 -- Analyse

| Action                            | Critere                                                           | Livrable                     |
| --------------------------------- | ----------------------------------------------------------------- | ---------------------------- |
| Evaluation pertinence             | Lien direct avec un objectif projet (cf. tableau section 1)       | Score 1-5                    |
| Evaluation impact                 | Potentiel de changement sur l'architecture, le planning, le scope | Impact : Faible/Moyen/Fort   |
| Redaction fiche de note           | Analyse approfondie si score >= 3 et impact >= Moyen              | Note de veille (cf. template)|
| Recommandation action             | Proposition concrete (POC, adoption, abandon, surveillance)       | Action dans le backlog       |

#### Etape 3 -- Diffusion

| Canal                   | Contenu                                      | Frequence      | Audience            |
| ----------------------- | -------------------------------------------- | -------------- | ------------------- |
| Canal Slack `#veille`   | Liens rapides + commentaire 1-2 lignes       | Continue       | Toute l'equipe      |
| Stand-up (2 min veille) | Point veille flash dans le daily             | Quotidienne    | Toute l'equipe      |
| Fiche hebdomadaire      | Synthese structuree de la semaine            | Hebdomadaire   | Toute l'equipe      |
| Revue de sprint         | Analyse des decouvertes impactantes          | Bi-mensuelle   | Equipe + encadrants |
| Rapport mensuel         | Tendances, recommandations, metriques veille | Mensuelle      | Stakeholders        |

#### Etape 4 -- Archivage

| Support            | Structure                                         | Acces                        |
| ------------------ | ------------------------------------------------- | ---------------------------- |
| Notion (wiki)      | Base de donnees par axe, tags, date, auteur       | Toute l'equipe (lecture)     |
| Dossier partage    | `/docs/veille/YYYY-MM/` dans le repo du projet    | Toute l'equipe               |
| Bookmarks Raindrop | Collections par axe de veille                     | Referent veille              |

### 3.3 Repartition des responsabilites (RACI)

| Activite                      | Chef de projet | Dev Backend/IA | Dev Fullstack | Dev Frontend | Designer UX |
| ----------------------------- | -------------- | -------------- | ------------- | ------------ | ----------- |
| Pilotage global de la veille  | **R/A**        | C              | C             | C            | C           |
| Axe 1 -- IA generative       | I              | **R/A**        | C             | I            | I           |
| Axe 2 -- Temps reel          | I              | C              | **R/A**       | C            | I           |
| Axe 3 -- Marche/Concurrence  | **R/A**        | I              | I             | C            | C           |
| Axe 4 -- Eco/Accessibilite   | C              | I              | C             | **R/A**      | C           |
| Redaction fiches hebdo        | A              | **R**          | **R**         | **R**        | I           |
| Diffusion et archivage        | **R/A**        | I              | I             | I            | I           |

> R = Responsable, A = Approbateur, C = Consulte, I = Informe

---

## 4. Matrice des outils de veille

### 4.1 Outils de collecte et monitoring

| #  | Outil                  | URL                                          | Type d'information                          | Cout              | Frequence d'utilisation | Axe(s) concerne(s) |
| -- | ---------------------- | -------------------------------------------- | ------------------------------------------- | ----------------- | ----------------------- | ------------------- |
| 1  | Google Alerts          | https://www.google.com/alerts                | Articles web, blogs, actualites generales   | Gratuit           | Continue (alertes auto) | 1, 2, 3, 4         |
| 2  | Feedly Pro             | https://feedly.com                           | Agregation RSS, blogs tech, presse          | 6 EUR/mois        | Quotidienne             | 1, 2, 3, 4         |
| 3  | GitHub                 | https://github.com                           | Repos, releases, issues, trending           | Gratuit           | Quotidienne             | 1, 2                |
| 4  | Reddit                 | https://reddit.com                           | Discussions communaute, retours utilisateurs| Gratuit           | Quotidienne             | 1, 2, 3             |
| 5  | Discord                | https://discord.com                          | Communautes dev (NestJS, Next.js, Socket.io)| Gratuit           | Quotidienne             | 1, 2                |
| 6  | Product Hunt           | https://producthunt.com                      | Nouveaux produits, concurrents emergents    | Gratuit           | Hebdomadaire            | 3                   |
| 7  | Twitter / X            | https://x.com                                | Annonces, opinions leaders, tendances       | Gratuit           | Quotidienne             | 1, 2, 3             |
| 8  | Hacker News            | https://news.ycombinator.com                 | Tendances tech, discussions architecture    | Gratuit           | Quotidienne             | 1, 2                |
| 9  | Semantic Scholar       | https://www.semanticscholar.org              | Papers academiques IA, NLP                  | Gratuit           | Hebdomadaire            | 1                   |
| 10 | Google Scholar         | https://scholar.google.com                   | Articles de recherche, citations            | Gratuit           | Hebdomadaire            | 1, 4                |
| 11 | ArXiv                  | https://arxiv.org                            | Pre-prints recherche IA/ML                  | Gratuit           | Hebdomadaire            | 1                   |

### 4.2 Outils d'analyse et de benchmark

| #  | Outil                  | URL                                          | Type d'information                          | Cout              | Frequence d'utilisation | Axe(s) concerne(s) |
| -- | ---------------------- | -------------------------------------------- | ------------------------------------------- | ----------------- | ----------------------- | ------------------- |
| 12 | SimilarWeb             | https://www.similarweb.com                   | Trafic web concurrents, audience            | Gratuit (limité)  | Mensuelle               | 3                   |
| 13 | Google Trends          | https://trends.google.com                    | Tendances de recherche, saisonnalite        | Gratuit           | Bi-mensuelle            | 3                   |
| 14 | Steam Charts           | https://steamcharts.com                      | Joueurs simultanes, tendances Steam         | Gratuit           | Mensuelle               | 3                   |
| 15 | data.ai (App Annie)    | https://www.data.ai                          | Classements apps, telechargements, revenus  | Freemium          | Mensuelle               | 3                   |

### 4.3 Outils d'audit et de conformite

| #  | Outil                  | URL                                          | Type d'information                          | Cout              | Frequence d'utilisation | Axe(s) concerne(s) |
| -- | ---------------------- | -------------------------------------------- | ------------------------------------------- | ----------------- | ----------------------- | ------------------- |
| 16 | Lighthouse             | Chrome DevTools                              | Performance, accessibilite, SEO, PWA        | Gratuit           | A chaque sprint         | 4                   |
| 17 | WAVE                   | https://wave.webaim.org                      | Audit accessibilite WCAG                    | Gratuit           | A chaque sprint         | 4                   |
| 18 | EcoIndex               | https://www.ecoindex.fr                      | Score eco-conception des pages web          | Gratuit           | Mensuelle               | 4                   |
| 19 | Website Carbon         | https://www.websitecarbon.com                | Empreinte carbone estimation par page       | Gratuit           | Mensuelle               | 4                   |

### 4.4 Newsletters et contenus editoriaux

| #  | Outil / Newsletter       | URL / Source                                 | Type d'information                          | Cout              | Frequence d'utilisation | Axe(s) concerne(s) |
| -- | ------------------------ | -------------------------------------------- | ------------------------------------------- | ----------------- | ----------------------- | ------------------- |
| 20 | TLDR Newsletter          | https://tldr.tech                            | Resume quotidien tech                       | Gratuit           | Quotidienne             | 1, 2                |
| 21 | The Batch (Andrew Ng)    | https://www.deeplearning.ai/the-batch/       | Actualite IA hebdomadaire                   | Gratuit           | Hebdomadaire            | 1                   |
| 22 | GameDiscoverCo           | https://gamediscover.co                      | Marche du jeu indie, tendances              | Gratuit/Plus      | Hebdomadaire            | 3                   |
| 23 | Smashing Magazine        | https://www.smashingmagazine.com             | Frontend, UX, accessibilite                 | Gratuit           | Hebdomadaire            | 2, 4                |
| 24 | Bytes.dev                | https://bytes.dev                            | Actualite JavaScript/TypeScript             | Gratuit           | Hebdomadaire            | 2                   |

### 4.5 Conferences et evenements

| #  | Evenement                | Periode                   | Type d'information                          | Cout participation | Axe(s) concerne(s) |
| -- | ------------------------ | ------------------------- | ------------------------------------------- | ------------------ | ------------------- |
| 25 | GDC (Game Developers Conf)| Mars (videos en ligne)   | Game design, IA gaming, architecture jeu    | Gratuit (Vault)    | 1, 3                |
| 26 | NeurIPS / ICML           | Decembre / Juillet        | Recherche IA de pointe                      | Gratuit (papers)   | 1                   |
| 27 | Next.js Conf             | Octobre                   | Nouveautes Next.js, Vercel                  | Gratuit (stream)   | 2                   |
| 28 | Paris Web                | Octobre                   | Accessibilite, qualite web                  | ~300 EUR           | 4                   |
| 29 | DevFest / MiXiT          | Variable                  | Communaute dev francaise, bonnes pratiques  | 30-80 EUR          | 2, 4                |

### 4.6 Podcasts

| #  | Podcast                  | Plateforme                | Type d'information                          | Cout              | Frequence d'utilisation | Axe(s) concerne(s) |
| -- | ------------------------ | ------------------------- | ------------------------------------------- | ----------------- | ----------------------- | ------------------- |
| 30 | Latent Space             | Spotify, Apple Podcasts   | IA appliquee, LLM, engineering IA           | Gratuit           | Hebdomadaire            | 1                   |
| 31 | Syntax.fm                | Spotify, Web              | Developpement web, JavaScript               | Gratuit           | Hebdomadaire            | 2                   |
| 32 | Game Maker's Notebook    | IGDA                      | Game design, industrie du jeu               | Gratuit           | Bi-mensuelle            | 3                   |
| 33 | Techologie               | techologie.net            | Numerique responsable (francophone)         | Gratuit           | Mensuelle               | 4                   |

---

## 5. Calendrier de veille type

### 5.1 Semaine type

| Jour      | Matin (30 min)                                      | Apres-midi (15 min)                           | Responsable rotation |
| --------- | --------------------------------------------------- | --------------------------------------------- | -------------------- |
| **Lundi** | Scan RSS Feedly (tous axes) + tri Google Alerts      | Partage rapide Slack `#veille`                | Dev Backend/IA       |
| **Mardi** | Scan GitHub Trending + Hacker News                   | Discussion stand-up : point veille            | Dev Fullstack        |
| **Mercredi** | Lecture newsletters (The Batch, TLDR, Bytes.dev)  | Identification 1-2 sujets a approfondir       | Dev Frontend         |
| **Jeudi** | Analyse approfondie : redaction note(s) de veille    | Revue Reddit + Discord communautes            | Dev Backend/IA       |
| **Vendredi** | **Synthese hebdomadaire** : redaction fiche hebdo | Archivage Notion + mise a jour bookmarks      | Chef de projet       |

### 5.2 Planning mensuel

| Semaine   | Focus principal                                                              | Livrable                                     |
| --------- | ---------------------------------------------------------------------------- | -------------------------------------------- |
| Semaine 1 | Scan large : nouveautes techno et concurrents                                | Fiche hebdomadaire                           |
| Semaine 2 | Deep dive sur un sujet cle (ex: nouvelle version Claude API)                 | Note de veille approfondie                   |
| Semaine 3 | Benchmark concurrentiel : mise a jour fiches concurrents                     | Mise a jour matrice concurrentielle          |
| Semaine 4 | **Revue mensuelle de veille** : synthese, tendances, recommandations         | Rapport mensuel de veille                    |

### 5.3 Planning sur la duree du projet (14 semaines)

| Periode          | Focus veille                                                                          | Impact sur le projet                            |
| ---------------- | ------------------------------------------------------------------------------------- | ----------------------------------------------- |
| Semaines 1-2     | Validation stack technique, benchmark initial concurrents, etat de l'art IA narrative | Decisions d'architecture, choix API IA          |
| Semaines 3-4     | Patterns temps reel multijoueur, analyse UX concurrents, cout API Claude              | Design du game loop, estimation budgets API     |
| Semaines 5-7     | Bonnes pratiques game design narratif, tendances accessibilite                        | Conception scenarios TRIBUNAL/DEEP              |
| Semaines 8-10    | Retours beta concurrents, nouvelles releases techno, optimisation performances        | Ajustements mid-project, optimisations          |
| Semaines 11-12   | Tests accessibilite, audit eco-conception, veille securite                            | Conformite, amelioration qualite                |
| Semaines 13-14   | Positionnement marche, strategie de lancement, roadmap post-MVP                       | Preparation pitch, decisions roadmap            |

---

## 6. Template de fiche de veille hebdomadaire

```markdown
# Fiche de Veille Hebdomadaire -- MYTHOS

**Semaine** : [Numero] -- du [JJ/MM/AAAA] au [JJ/MM/AAAA]
**Redacteur** : [Nom]
**Statut** : Brouillon / Valide

---

## Resume executif (3-5 lignes)

[Resume des decouvertes cles de la semaine et leur impact potentiel sur MYTHOS]

---

## Axe 1 -- IA Generative pour le Gaming

| # | Sujet                   | Source        | Pertinence (1-5) | Impact     | Action suggeree         |
|---|-------------------------|---------------|-------------------|------------|-------------------------|
| 1 | [Titre/description]     | [URL/Source]  | [X/5]             | [F/M/Fort] | [Action ou "A suivre"]  |
| 2 | ...                     | ...           | ...               | ...        | ...                     |

**Synthese axe 1** : [2-3 lignes]

---

## Axe 2 -- Technologies Temps Reel

| # | Sujet                   | Source        | Pertinence (1-5) | Impact     | Action suggeree         |
|---|-------------------------|---------------|-------------------|------------|-------------------------|
| 1 | [Titre/description]     | [URL/Source]  | [X/5]             | [F/M/Fort] | [Action ou "A suivre"]  |

**Synthese axe 2** : [2-3 lignes]

---

## Axe 3 -- Marche du Jeu Narratif / Social

| # | Sujet                   | Source        | Pertinence (1-5) | Impact     | Action suggeree         |
|---|-------------------------|---------------|-------------------|------------|-------------------------|
| 1 | [Titre/description]     | [URL/Source]  | [X/5]             | [F/M/Fort] | [Action ou "A suivre"]  |

**Synthese axe 3** : [2-3 lignes]

---

## Axe 4 -- Eco-conception et Accessibilite

| # | Sujet                   | Source        | Pertinence (1-5) | Impact     | Action suggeree         |
|---|-------------------------|---------------|-------------------|------------|-------------------------|
| 1 | [Titre/description]     | [URL/Source]  | [X/5]             | [F/M/Fort] | [Action ou "A suivre"]  |

**Synthese axe 4** : [2-3 lignes]

---

## Top 3 de la semaine

1. **[Decouverte #1]** -- [Pourquoi c'est important pour MYTHOS] -- Action : [...]
2. **[Decouverte #2]** -- [Pourquoi c'est important pour MYTHOS] -- Action : [...]
3. **[Decouverte #3]** -- [Pourquoi c'est important pour MYTHOS] -- Action : [...]

---

## Actions a mener

| Action                          | Responsable   | Echeance        | Priorite |
| ------------------------------- | ------------- | --------------- | -------- |
| [Action 1]                      | [Nom]         | [Date]          | Haute    |
| [Action 2]                      | [Nom]         | [Date]          | Moyenne  |

---

## Sujets a approfondir (semaine prochaine)

- [ ] [Sujet 1]
- [ ] [Sujet 2]
```

---

## 7. Template de note de veille

```markdown
# Note de Veille -- MYTHOS

**Titre** : [Nom de la technologie / du concurrent / de la tendance]
**Date** : [JJ/MM/AAAA]
**Redacteur** : [Nom]
**Axe de veille** : [1-IA / 2-Temps Reel / 3-Marche / 4-Eco-Access]
**Pertinence** : [1-5] / 5
**Impact potentiel** : Faible / Moyen / Fort

---

## 1. Description

[Description factuelle et objective du sujet. Qu'est-ce que c'est ? Quand est-ce
apparu ? Qui est derriere ? Quelles sont les caracteristiques principales ?]

### Donnees cles

| Critere               | Valeur                                    |
| --------------------- | ----------------------------------------- |
| Editeur / Auteur      | [Nom]                                     |
| Date de publication   | [Date]                                    |
| Version / Maturite    | [v1.0 / Beta / Alpha / Recherche]         |
| Licence / Cout        | [Open source / Freemium / Payant]         |
| Communaute / Traction | [Nombre utilisateurs, GitHub stars, etc.] |

---

## 2. Analyse de pertinence pour MYTHOS

### Points d'interet

- [Point 1 : en quoi c'est pertinent pour MYTHOS]
- [Point 2]
- [Point 3]

### Risques / Limites

- [Limite 1]
- [Limite 2]

### Comparaison avec notre approche actuelle

| Critere                | Notre approche actuelle | Alternative analysee | Verdict     |
| ---------------------- | ----------------------- | -------------------- | ----------- |
| [Critere 1]            | [Description]           | [Description]        | [+/-/=]     |
| [Critere 2]            | [Description]           | [Description]        | [+/-/=]     |

---

## 3. Recommandation

**Action recommandee** : [ ] Adopter | [ ] POC/Tester | [ ] Surveiller | [ ] Ignorer

**Justification** :
[Explication en 3-5 lignes de la recommandation]

**Effort estime** :
- Temps d'evaluation : [X heures]
- Temps d'integration : [X jours]
- Impact sur le planning : [Aucun / Faible / Moyen / Fort]

---

## 4. Ressources

- [Lien 1 : documentation officielle]
- [Lien 2 : article d'analyse]
- [Lien 3 : repo GitHub]
- [Lien 4 : video/tutoriel]

---

## 5. Suivi

| Date       | Action                    | Resultat                    |
| ---------- | ------------------------- | --------------------------- |
| [Date]     | [Action prise]            | [Resultat observe]          |
```

---

## 8. Indicateurs d'efficacite de la veille

### 8.1 KPIs quantitatifs

| Indicateur                                        | Cible                      | Frequence mesure | Methode de mesure                          |
| ------------------------------------------------- | -------------------------- | ---------------- | ------------------------------------------ |
| Nombre de fiches hebdomadaires produites           | 1 par semaine (14 total)  | Hebdomadaire     | Comptage dans Notion                       |
| Nombre de notes de veille approfondies             | 2-3 par semaine            | Hebdomadaire     | Comptage dans Notion                       |
| Nombre d'alertes traitees / semaine                | 20-30                      | Hebdomadaire     | Comptage Google Alerts + Feedly            |
| Nombre de decisions projet influencees par la veille| 1-2 par sprint            | Par sprint       | Retrospective de sprint                    |
| Taux de participation de l'equipe                  | 100% (rotation)            | Mensuelle        | Suivi des contributions                    |
| Delai de detection d'une tendance majeure          | < 1 semaine                | Continue         | Date de premiere mention vs date de parution|
| Nombre de sources actives suivies                  | 30+ sources                | Mensuelle        | Audit des sources Feedly/Alerts            |

### 8.2 KPIs qualitatifs

| Indicateur                                        | Cible                      | Frequence mesure | Methode de mesure                          |
| ------------------------------------------------- | -------------------------- | ---------------- | ------------------------------------------ |
| Satisfaction equipe sur l'utilite de la veille     | >= 4/5                     | Mensuelle        | Mini-sondage equipe (1 question)           |
| Qualite des recommandations (pertinence)          | >= 80% jugees utiles       | Par sprint       | Revue par le chef de projet                |
| Impact reel sur les choix techniques               | >= 3 choix influences      | Fin de projet    | Retrospective projet                       |
| Couverture des 4 axes de veille                   | Equilibree (20-30% chacun) | Mensuelle        | Analyse des fiches par axe                 |

### 8.3 Tableau de bord veille (a maintenir dans Notion)

```
+------------------------------------------------------------------+
|                    DASHBOARD VEILLE MYTHOS                        |
+------------------------------------------------------------------+
| Semaine : [X]/14        | Fiches produites : [X]/14              |
| Notes de veille : [X]   | Actions generees : [X]                 |
+------------------------------------------------------------------+
| Axe 1 - IA       : [##########----] 65%  (cible: 70%)           |
| Axe 2 - Temps reel: [########------] 55%  (cible: 60%)          |
| Axe 3 - Marche    : [######--------] 45%  (cible: 50%)          |
| Axe 4 - Eco/Access: [####----------] 30%  (cible: 40%)          |
+------------------------------------------------------------------+
| Derniere decouverte majeure : [Date] - [Sujet]                   |
| Prochaine revue mensuelle  : [Date]                              |
+------------------------------------------------------------------+
```

---

## 9. Budget veille

### 9.1 Budget temps

| Activite                                  | Temps / semaine | Temps / 14 semaines | Qui                  |
| ----------------------------------------- | --------------- | -------------------- | -------------------- |
| Scan quotidien (RSS, alertes, reseaux)    | 2h30            | 35h                  | Rotation equipe      |
| Analyse approfondie (notes de veille)     | 2h              | 28h                  | Referent axe         |
| Redaction fiche hebdomadaire              | 1h              | 14h                  | Chef de projet       |
| Revue mensuelle + rapport                 | 2h              | 6h (3 revues)        | Chef de projet       |
| Discussion/partage equipe (stand-up)      | 0h30            | 7h                   | Toute l'equipe       |
| **Total par personne**                    | **~1h30/sem**   | **~21h total**       |                      |
| **Total equipe (5 personnes)**            | **~6h/sem**     | **~90h total**       |                      |

> **Soit environ 6h/semaine pour toute l'equipe, representant ~3.75% du temps total disponible** (5 personnes x 35h x 14 semaines = 2 450h).

### 9.2 Budget financier

| Poste de depense                       | Cout unitaire       | Cout total (14 sem.) | Justification                              |
| -------------------------------------- | ------------------- | --------------------- | ------------------------------------------ |
| Feedly Pro (1 licence equipe)          | 6 EUR/mois           | ~24 EUR               | Agregation RSS, suivi de sources           |
| Notion (plan gratuit equipe)           | 0 EUR                | 0 EUR                 | Wiki, base de connaissances veille         |
| Raindrop.io Pro (bookmarks)            | 3 EUR/mois           | ~12 EUR               | Organisation et partage de bookmarks       |
| SimilarWeb (plan gratuit)              | 0 EUR                | 0 EUR                 | Analyse trafic concurrents (limites OK)    |
| Conference Paris Web (1 place)         | ~300 EUR             | 300 EUR               | Si calendrier compatible                   |
| Conference DevFest (2 places)          | ~60 EUR/place        | 120 EUR               | Veille communaute dev francaise            |
| **Total outils et abonnements**        |                     | **~36 EUR**           |                                            |
| **Total evenements (optionnel)**       |                     | **~420 EUR**          |                                            |
| **Total general**                      |                     | **~456 EUR**          |                                            |

> **Note** : La majorite des outils de veille utilises sont gratuits ou proposent des plans gratuits suffisants pour nos besoins. Le poste principal est le temps humain (~90h equipe).

### 9.3 Retour sur investissement attendu

| Benefice attendu                                                    | Valeur estimee                              |
| ------------------------------------------------------------------- | ------------------------------------------- |
| Eviter un mauvais choix technologique (cout de refactoring)         | 40-80h de dev economisees                   |
| Identifier une opportunite de marche (pivot rapide)                 | Avantage concurrentiel mesurable            |
| Optimiser les couts API Claude (prompts, cache, modeles)            | 20-40% d'economie sur les couts API         |
| Garantir la conformite accessibilite des le depart                  | Eviter un audit correctif post-lancement    |
| Anticiper les evolutions technologiques (Next.js, NestJS, Redis)    | Reduction de la dette technique             |

---

## Annexes

### Annexe A -- Liste des alertes Google a configurer

1. `"AI game master" OR "IA maitre du jeu"`
2. `"generative AI" AND "multiplayer game"`
3. `"Claude API" AND ("gaming" OR "narrative" OR "storytelling")`
4. `"social deduction game" AND "2025" OR "2026"`
5. `"Socket.io" AND ("scalability" OR "performance" OR "alternative")`
6. `"NestJS" AND "WebSocket"`
7. `"interactive fiction" AND "multiplayer"`
8. `"eco-conception" AND "jeu video"`
9. `"RGAA" OR "WCAG 2.2" AND "application web"`
10. `"LLM" AND ("function calling" OR "structured output") AND "game"`

### Annexe B -- Subreddits a surveiller

| Subreddit                    | Pertinence pour MYTHOS                           |
| ---------------------------- | ------------------------------------------------ |
| r/gamedesign                 | Patterns de game design narratif                 |
| r/indiegaming                | Tendances jeux independants                      |
| r/artificial                 | Actualite IA grand public                        |
| r/LocalLLaMA                 | Alternatives open source aux LLM                 |
| r/ClaudeAI                   | Retours d'experience API Claude                  |
| r/webdev                     | Tendances developpement web                      |
| r/nextjs                     | Communaute Next.js                               |
| r/SocialDeductionGames       | Jeux de deduction sociale                        |
| r/InteractiveFiction         | Fiction interactive, jeux narratifs              |

### Annexe C -- Comptes Twitter/X a suivre

| Compte                       | Raison                                           |
| ---------------------------- | ------------------------------------------------ |
| @AnthropicAI                 | Annonces Claude, recherche Anthropic             |
| @OpenAI                      | Veille concurrentielle LLM                       |
| @GoogleDeepMind              | Recherche IA gaming                              |
| @vercel / @nextjs            | Nouveautes Next.js                               |
| @nestaborka (NestJS)         | Mises a jour NestJS                              |
| @socketio                    | Releases Socket.io                               |
| @RedisInc                    | Nouveautes Redis                                 |
| @gaaborba (IA gaming)        | Communaute IA appliquee au jeu                   |
| @GreenIT_fr                  | Eco-conception numerique                         |
| @access42net                 | Accessibilite web (francophone)                  |

---

*Document de reference -- A reviser mensuellement ou lors de changements majeurs dans le perimetre du projet.*
