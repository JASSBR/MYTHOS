# ADR — Architecture Decision Records

**Projet** : MYTHOS — Jeu narratif multijoueur avec Maître du Jeu IA
**Équipe** : Kays ZAHIDI (PO/Architecte), Samy ZEROUALI (SM/Backend/IA), Youri EMMANUEL (Frontend), Yassir SABBAR (Frontend/UX/DevOps)
**Date de création** : 11 février 2026
**Dernière mise à jour** : 11 février 2026

---

Ce document recense les décisions d'architecture prises pour MYTHOS. Chaque ADR suit un format structuré pour qu'on puisse revenir dessus plus tard sans se demander "pourquoi on a choisi ça déjà ?".

---

## ADR-001 : Framework backend — NestJS

|                  |                           |
| ---------------- | ------------------------- |
| **Statut**       | Acceptée                  |
| **Date**         | 11 février 2026           |
| **Participants** | Kays, Samy, Youri, Yassir |

### Contexte

On a besoin d'un framework backend pour exposer une API REST (authentification, gestion des parties, profils) et gérer la communication WebSocket en temps réel (chat, tours de jeu, streaming IA). Le framework doit supporter TypeScript nativement parce qu'on veut un typage cohérent entre le front et le back.

### Options envisagées

| Option         | Avantages                                                                             | Inconvénients                                                                    |
| -------------- | ------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| **Express.js** | Le plus populaire, énormément de ressources, minimaliste                              | Aucune structure imposée, tout est à organiser soi-même, pas de TypeScript natif |
| **Fastify**    | Très performant, schema-based validation, moderne                                     | Écosystème plus petit, moins de modules prêts à l'emploi pour WebSocket          |
| **NestJS**     | Structure modulaire, TypeScript natif, modules intégrés (WebSocket, auth, validation) | Courbe d'apprentissage (decorators, DI), plus verbeux qu'Express                 |

### Décision

**NestJS 10+**

### Justification

Kays avait déjà bossé avec NestJS en stage, donc on ne partait pas de zéro. La structure modulaire aide énormément à se repérer quand on est 4 sur le même backend — chaque module (auth, game, chat, ai) a son dossier avec ses controllers, services et gateways. L'intégration native de Socket.io via `@nestjs/websockets` a été un gros argument : on déclare un gateway avec des décorateurs et c'est parti.

Express aurait marché, clairement, mais on aurait passé du temps à structurer nous-mêmes ce que NestJS donne out-of-the-box. Fastify est intéressant mais l'écosystème WebSocket est moins mature.

### Conséquences

- **Positif** : Structure claire dès le jour 1, intégration WebSocket native, Samy peut onboarder les autres rapidement
- **Positif** : La DI (dependency injection) facilite les tests unitaires
- **Négatif** : Youri et Yassir devront se familiariser avec les décorateurs et le pattern module/controller/service
- **Négatif** : Le boilerplate est plus important qu'avec Express pour les petites features

---

## ADR-002 : Base de données — PostgreSQL

|                  |                           |
| ---------------- | ------------------------- |
| **Statut**       | Acceptée                  |
| **Date**         | 11 février 2026           |
| **Participants** | Kays, Samy, Youri, Yassir |

### Contexte

On doit stocker des données relationnelles (utilisateurs, parties, joueurs) mais aussi des données semi-structurées (états de jeu, configurations de scénarios, historiques narratifs). Il nous faut une base qui gère les deux sans qu'on se prenne la tête.

### Options envisagées

| Option         | Avantages                                                                | Inconvénients                                                                  |
| -------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| **MongoDB**    | Schema flexible, populaire pour les jeux, JSON natif                     | Pas de vraies relations, Prisma le supporte moins bien, transactions complexes |
| **MySQL**      | Fiable, bien connu, beaucoup de tutos                                    | Pas de JSONB natif, moins de features avancées que PostgreSQL                  |
| **PostgreSQL** | JSONB natif, support Prisma excellent, features avancées (arrays, enums) | Un peu plus complexe à configurer que MySQL                                    |

### Décision

**PostgreSQL 16+**

### Justification

On hésitait avec MongoDB vu que les game states sont assez "document-like". Mais Prisma (notre ORM, voir ADR-006) marche nettement mieux avec PostgreSQL — les migrations sont plus fiables et le typage est complet. Le support JSONB nous permet quand même de stocker des données flexibles (configs de scénarios, game states, historiques de prompt) sans sacrifier les relations fortes entre users, games et players.

En plus, Railway propose un PostgreSQL managé avec un free tier pour les étudiants. Ça nous évite de gérer un serveur de BDD nous-mêmes.

### Conséquences

- **Positif** : Typage fort avec Prisma, migrations automatiques, JSONB pour la flexibilité
- **Positif** : Hébergement managé gratuit via Railway
- **Négatif** : Moins intuitif que MongoDB pour stocker des documents complexes imbriqués
- **Négatif** : Il faudra bien designer les colonnes JSONB pour éviter que ça devienne un fourre-tout

---

## ADR-003 : LLM Provider — Anthropic Claude API

|                  |                           |
| ---------------- | ------------------------- |
| **Statut**       | Acceptée                  |
| **Date**         | 11 février 2026           |
| **Participants** | Kays, Samy, Youri, Yassir |

### Contexte

MYTHOS repose sur un Maître du Jeu IA qui doit : narrer l'histoire, arbitrer les actions des joueurs, maintenir la cohérence narrative sur toute une partie (potentiellement plusieurs heures), et streamer ses réponses en temps réel. Le choix du LLM est critique — c'est le coeur du produit.

### Options envisagées

| Option                              | Avantages                                                                    | Inconvénients                                                              |
| ----------------------------------- | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| **OpenAI GPT-4**                    | Le plus populaire, bonne qualité, large écosystème                           | Cher (~$30/1M tokens input), rate limiting agressif, context window 128k   |
| **Anthropic Claude**                | Context window 200k tokens, excellent en roleplay/narration, streaming natif | Moins populaire, SDK moins documenté qu'OpenAI                             |
| **Open-source (Llama 3 / Mistral)** | Gratuit, pas de dépendance externe, personnalisable                          | Nécessite du self-hosting (GPUs), qualité inférieure pour le roleplay long |

### Décision

**Anthropic Claude API (claude-3.5-sonnet ou supérieur)**

### Justification

Kays a passé un weekend à tester les 3 options avec des prompts de narration type MJ. Les résultats :

- **GPT-4** : bonne qualité narrative mais le rate limiting à 10k RPM complique le multi-joueurs, et le coût monte vite.
- **Claude** : context window de 200k tokens, ce qui est crucial pour garder l'historique narratif d'une partie entière sans résumer/tronquer. La qualité du roleplay est au moins aussi bonne que GPT-4, voire meilleure pour maintenir un personnage cohérent.
- **Llama 3 / Mistral** : intéressants niveau coût (gratuit) mais on n'a ni le temps ni les GPUs pour du self-hosting. La qualité en français est aussi en dessous des modèles propriétaires.

Le crédit API Anthropic pour étudiants a fini de nous convaincre. On prévoit un système de fallback vers un modèle plus petit (claude-3-haiku) pour les requêtes moins critiques (résumés, suggestions) afin de maîtriser les coûts.

### Conséquences

- **Positif** : Context window massif, parfait pour la narration longue
- **Positif** : Streaming natif via l'API, intégrable avec notre architecture SSE/WebSocket
- **Négatif** : Dépendance à un service externe (pas de fallback offline)
- **Négatif** : Coût à surveiller — on mettra un rate limiter côté backend

---

## ADR-004 : Hébergement — Vercel + Railway

|                  |                           |
| ---------------- | ------------------------- |
| **Statut**       | Acceptée                  |
| **Date**         | 11 février 2026           |
| **Participants** | Kays, Samy, Youri, Yassir |

### Contexte

On doit héberger : un frontend Next.js (SSR + static), un backend NestJS (API REST + WebSocket), une base PostgreSQL, et potentiellement un service Redis pour le cache. Le budget total du projet est de 308€, hébergement inclus.

### Options envisagées

| Option                | Avantages                                                 | Inconvénients                                                  |
| --------------------- | --------------------------------------------------------- | -------------------------------------------------------------- |
| **AWS (EC2/ECS/RDS)** | Puissant, scalable, complet                               | Complexe à configurer, coût imprévisible, overkill pour un MVP |
| **Heroku**            | Simple, bien documenté                                    | Plus de free tier, cher pour ce qu'on a besoin                 |
| **VPS (Hetzner/OVH)** | Pas cher (~5€/mois), contrôle total                       | Configuration manuelle, maintenance, pas de CI/CD intégré      |
| **Vercel + Railway**  | Free tiers généreux, déploiement automatique, zéro config | Cold starts sur Railway, limites de bande passante             |

### Décision

**Vercel** (frontend Next.js) + **Railway** (backend NestJS + PostgreSQL)

### Justification

Budget de 308€ pour tout le projet, il faut être malin. AWS c'est trop complexe à setup pour 4 étudiants en 14 semaines — on passerait plus de temps sur l'infra qu'à coder. Heroku a tué son free tier, c'est mort. Un VPS Hetzner à 5€/mois aurait marché mais Yassir (notre DevOps) aurait passé trop de temps à configurer Nginx, les certificats SSL, Docker, les backups...

Vercel a un free tier parfait pour Next.js avec le SSR, le CDN mondial, et les preview deployments sur chaque PR. Railway offre 5$/mois de crédit gratuit qui couvre largement notre usage backend + PostgreSQL.

Le seul vrai risque c'est le cold start de Railway (le container s'éteint après 30 min d'inactivité sur le free tier). C'est acceptable pour un MVP — en prod on passerait sur un plan payant.

### Conséquences

- **Positif** : Coût quasi nul pendant le développement
- **Positif** : Déploiement automatique via GitHub, preview environments sur Vercel
- **Positif** : Yassir peut se concentrer sur le CI/CD et les tests plutôt que l'infra serveur
- **Négatif** : Cold starts sur Railway (5-10s après inactivité)
- **Négatif** : Dépendance à deux providers différents (complexité de monitoring)

---

## ADR-005 : Communication temps réel — Socket.io

|                  |                                              |
| ---------------- | -------------------------------------------- |
| **Statut**       | Acceptée                                     |
| **Date**         | 11 février 2026                              |
| **Participants** | Kays, Samy (avec retours de Youri et Yassir) |

### Contexte

Le jeu nécessite de la communication bidirectionnelle en temps réel pour : les tours de jeu (actions des joueurs, réponses du MJ IA), le chat entre joueurs, le streaming des réponses IA token par token, et les notifications (joueur rejoint/quitte, changement de phase).

### Options envisagées

| Option                       | Avantages                                                       | Inconvénients                                                 |
| ---------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------- |
| **WebSocket natif**          | Standard W3C, léger, pas de dépendance                          | Pas de rooms, pas de reconnexion auto, pas d'acknowledgements |
| **Socket.io**                | Rooms, namespaces, fallback auto, reconnexion, acknowledgements | Plus lourd (~50kb client), abstraction sur WebSocket          |
| **SSE (Server-Sent Events)** | Simple, natif HTTP, bon pour le streaming                       | Unidirectionnel (serveur vers client seulement)               |
| **Long polling**             | Fonctionne partout, simple                                      | Latence élevée, consommation de ressources                    |

### Décision

**Socket.io 4+**

### Justification

On avait besoin de rooms (une par partie), de namespaces (séparer chat et game events), et de fallback automatique si le WebSocket échoue. Socket.io gère tout ça nativement. Samy a testé avec le module `@nestjs/websockets` et ça s'intègre en 10 lignes — on déclare un `@WebSocketGateway()` et c'est parti.

WebSocket natif nous aurait forcés à recoder la gestion des rooms, la reconnexion automatique, les acknowledgements (savoir si un message a bien été reçu)... On n'a pas le temps pour ça en 14 semaines.

SSE était envisagé pour le streaming IA uniquement, mais avoir deux systèmes de communication (SSE + WebSocket) ajoutait de la complexité inutile. Socket.io gère le streaming aussi bien.

### Conséquences

- **Positif** : Gestion des rooms et namespaces native, parfait pour notre architecture multi-parties
- **Positif** : Reconnexion automatique côté client — important pour le mobile
- **Positif** : Intégration NestJS quasi instantanée
- **Négatif** : ~50kb ajoutés au bundle client (acceptable)
- **Négatif** : Pas compatible avec les Workers Cloudflare si on migre un jour (mais c'est pas prévu)

---

## ADR-006 : ORM — Prisma

|                  |                                              |
| ---------------- | -------------------------------------------- |
| **Statut**       | Acceptée                                     |
| **Date**         | 11 février 2026                              |
| **Participants** | Kays, Samy (avec retours de Youri et Yassir) |

### Contexte

On a besoin d'une couche d'accès à la base de données pour le backend NestJS. L'ORM doit supporter PostgreSQL, offrir un bon typage TypeScript, et faciliter les migrations de schema pendant le développement.

### Options envisagées

| Option       | Avantages                                                                | Inconvénients                                                        |
| ------------ | ------------------------------------------------------------------------ | -------------------------------------------------------------------- |
| **TypeORM**  | Mature, pattern Active Record/Data Mapper, décorateurs                   | Typage partiel, bugs connus avec les migrations, décorateurs verbeux |
| **Prisma**   | Schema-first, typage 100% auto-généré, migrations simples, Prisma Studio | Query API limitée pour les requêtes complexes, overhead du client    |
| **Drizzle**  | Léger, proche du SQL, bon typage                                         | Jeune, documentation incomplète, moins de retours de la communauté   |
| **SQL brut** | Contrôle total, performances maximales                                   | Pas de typage, pas de migrations auto, error-prone                   |

### Décision

**Prisma 5+**

### Justification

Le schema-first de Prisma force à réfléchir au modèle de données avant de coder — ce qui nous a aidés pour les specs techniques. On définit tout dans `schema.prisma` et le client typé est auto-généré. Plus besoin de se demander si un champ est nullable ou pas, TypeScript nous le dit directement.

Les migrations automatiques (`prisma migrate dev`) sont un gain de temps énorme. On modifie le schema, on lance la commande, et la migration SQL est générée et appliquée. En équipe de 4, c'est critique pour éviter les conflits de schema.

TypeORM était notre second choix mais les décorateurs c'est un peu le bazar quand on débute — et le typage n'est pas aussi fiable que celui de Prisma. Drizzle est prometteur mais trop jeune, la doc manque d'exemples concrets pour des cas comme les relations many-to-many avec des champs JSONB.

Le Prisma Studio gratuit est un bonus non négligeable pour débugger en local — on visualise les données sans écrire de requêtes.

### Conséquences

- **Positif** : Typage auto-généré à 100%, zéro décalage entre le schema et le code
- **Positif** : Migrations automatiques, Prisma Studio pour le debug
- **Positif** : Schema lisible par toute l'équipe, même ceux qui ne font pas de backend
- **Négatif** : Requêtes complexes (sous-requêtes, window functions) nécessitent du `$queryRaw`
- **Négatif** : Le client Prisma ajoute un overhead au cold start (~1-2s la première connexion)

---

## Processus de décision

Les décisions d'architecture sont prises pendant les réunions d'équipe, généralement en début de sprint. Le processus est le suivant :

1. **Identification** : Kays (architecte) ou Samy (lead tech backend) identifie un choix technique à faire
2. **Recherche** : Le ou les membres concernés testent les options (POC, benchmarks, lecture de docs)
3. **Proposition** : Kays propose une recommandation argumentée à l'équipe
4. **Discussion** : L'équipe en discute — chacun peut challenger la proposition
5. **Vote** : On tranche, la décision est documentée ici

Pour les décisions critiques (ADR-001 à ADR-004) qui impactent l'ensemble du projet, les 4 membres ont voté. L'unanimité n'est pas requise mais on cherche le consensus — sur ces 4 ADRs, on était tous d'accord.

Pour les décisions plus techniques (ADR-005, ADR-006) qui concernent principalement le backend, Samy et Kays ont décidé avec les retours de Youri et Yassir. Ça évite de bloquer tout le monde sur des choix qui ne les impactent pas directement au quotidien.

Toute décision peut être revue si le contexte change. Il suffit de créer un nouvel ADR qui remplace l'ancien en expliquant pourquoi.

---

_Document rédigé le 11 février 2026 — Projet MYTHOS, 5AWD Workshop_
