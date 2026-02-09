# MYTHOS -- Gestion des Ressources et Budget

> **Projet** : MYTHOS -- Plateforme de jeux narratifs multijoueur avec IA Maitre du Jeu
> **Version** : 1.0
> **Date** : 19 Fevrier 2026
> **Budget total previsionnel** : 308 EUR
> **Valorisation projet (TJM fictif)** : ~134 400 EUR
> **Contexte** : Workshop 5A TL -- S1 -- Bloc 1 RNCP38822

Le budget a ete le document le plus galere a ecrire, on a du reprendre les calculs 3 fois parce qu'on avait sous-estime les couts API IA au debut. On a essaye d'etre realistes vu qu'on est etudiants et qu'on profite des offres gratuites des services cloud. La valorisation en equivalent marche, c'est pour que le jury se rende compte du boulot reel.

---

## Table des matieres

1. [Inventaire des ressources humaines](#1-inventaire-des-ressources-humaines)
2. [Plan de charge](#2-plan-de-charge)
3. [Tableau de disponibilite](#3-tableau-de-disponibilite)
4. [Matrice RACI](#4-matrice-raci)
5. [Budget detaille par phase et par poste](#5-budget-detaille-par-phase-et-par-poste)
6. [Suivi budgetaire](#6-suivi-budgetaire)
7. [Analyse de la valeur acquise (EVM)](#7-analyse-de-la-valeur-acquise-evm)
8. [Scenarios budgetaires](#8-scenarios-budgetaires)
9. [Plan de contingence budgetaire](#9-plan-de-contingence-budgetaire)

---

## 1. Inventaire des ressources humaines

### 1.1 Equipe projet

| # | Membre | Role principal | Role secondaire | Disponibilite |
|---|--------|---------------|-----------------|:---:|
| M1 | Kays | Product Owner / Chef de projet / Architecte | Game Designer, Backend support | 25h/sem |
| M2 | Samy | Scrum Master / Dev Backend + IA + Temps reel | BDD, API, Game Engine, Prompt Engineering, WebSocket | 28h/sem |
| M3 | Youri | Developpeur Frontend | Responsive, Accessibilite | 22h/sem |
| M4 | Yassir | Dev Frontend / UX-UI + DevOps | CI/CD, Deploiement, Design, Accessibilite | 22h/sem |

### 1.2 Matrice de competences detaillee

Chaque membre est evalue sur une echelle de 1 a 5 :
- **1** : Debutant (notions theoriques, necessite accompagnement)
- **2** : Junior (a deja pratique, peut realiser des taches simples)
- **3** : Intermediaire (autonome sur des taches standard)
- **4** : Avance (maitrise le sujet, peut former les autres)
- **5** : Expert (reference sur le sujet, architecture, decisions critiques)

| Competence | Kays (PO/Archi) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) | Couverture equipe |
|---|:---:|:---:|:---:|:---:|:---:|
| **Gestion de projet Agile/Scrum** | 4 | 4 | 2 | 2 | Bonne |
| **Architecture logicielle** | 4 | 3 | 2 | 2 | Correcte |
| **React / Next.js** | 3 | 2 | 4 | 3 | Bonne |
| **TailwindCSS** | 2 | 2 | 4 | 3 | Bonne |
| **TypeScript** | 3 | 4 | 3 | 3 | Bonne |
| **NestJS** | 2 | 4 | 1 | 2 | Faible (1 avance) |
| **PostgreSQL / Prisma** | 2 | 4 | 1 | 2 | Faible (1 avance) |
| **Redis** | 2 | 3 | 1 | 2 | Correcte |
| **Socket.io / WebSocket** | 2 | 3 | 2 | 3 | Correcte |
| **API REST** | 3 | 4 | 2 | 3 | Bonne |
| **Prompt Engineering (LLM)** | 3 | 3 | 1 | 2 | Correcte |
| **Integration API IA (Anthropic)** | 2 | 3 | 1 | 2 | Correcte |
| **CI/CD / GitHub Actions** | 3 | 2 | 1 | 4 | Correcte |
| **Docker / Deploiement** | 2 | 2 | 1 | 4 | Correcte |
| **UX/UI Design (Figma)** | 2 | 1 | 3 | 4 | Bonne |
| **Accessibilite (WCAG)** | 2 | 1 | 3 | 3 | Correcte |
| **Tests (Jest/Vitest)** | 3 | 3 | 2 | 2 | Correcte |
| **Git / Git Flow** | 4 | 4 | 3 | 3 | Excellente |
| **Game Design** | 4 | 2 | 2 | 2 | Faible (1 avance) |
| **Securite web** | 3 | 3 | 2 | 2 | Correcte |
| **Score moyen** | **2,8** | **2,8** | **2,0** | **2,6** | |

### 1.3 Analyse des risques de competences

| Risque | Competence concernee | Membres couvrants | Plan de mitigation |
|---|---|---|---|
| **Bus factor = 1** : PostgreSQL/Prisma | BDD relationnelle | Samy (niveau 4), Kays backup (niveau 2) | Session de transfert de connaissances en S0, documentation schema BDD |
| **Bus factor = 1** : NestJS | Backend framework | Samy (niveau 4), Kays backup (niveau 2) | Pair programming regulier, documentation architecture backend |
| **Bus factor = 1** : CI/CD / Docker | Deploiement | Yassir (niveau 4), Kays backup (niveau 3/2) | Documentation pipeline CI/CD, session de transfert en S1 |
| **Couverture correcte** : UX/UI Design | Design | Yassir (niveau 4), Youri backup (niveau 3) | Bonne couverture, Figma partage et design system documente |
| **Competence basse** : Redis | Cache / State | Samy (3), Kays (2), Yassir (2) | Formation interne 2h en S1, documentation Docker Redis |
| **Competence basse** : Accessibilite | WCAG AA | Youri (3), Yassir (3) | Formation Lighthouse + WAVE en S4, checklist WCAG partagee |

### 1.4 Plan de montee en competences

| Formation | Animateur | Participants | Sprint | Duree | Format |
|---|---|---|---|---|---|
| Architecture Scenario Pack | Kays (PO) | Toute l'equipe | S0 | 1h | Session live |
| Prisma / PostgreSQL | Samy (SM/Back/IA) | Kays, Yassir | S0 | 1h30 | Pair coding |
| Prompt Engineering pour jeu narratif | Kays + Samy | Youri, Yassir | S1 | 2h | Workshop |
| Socket.io / WebSocket basics | Samy + Yassir | Kays, Youri | S2 | 1h30 | Session live |
| Accessibilite WCAG + Lighthouse | Youri + Yassir | Kays, Samy | S4 | 1h | Session live |
| CI/CD + Deploiement Vercel + Railway | Yassir (DevOps) | Kays, Samy, Youri | S4 | 1h | Demo live |

**Cout total formation** : ~8h d'effort equipe, integre dans la capacite des sprints concernes.

---

## 2. Plan de charge

### 2.1 Heures par semaine par membre par sprint

| Sprint | Semaines | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) | Total/sem | Total sprint |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|
| **Sprint 0** | S1-S2 | 18h | 34h | 18h | 16h | 86h | **172h** |
| **Sprint 1** | S3-S4 | 18h | 34h | 18h | 16h | 86h | **172h** |
| **Sprint 2** | S5-S6 | 18h | 36h | 18h | 18h | 90h | **180h** |
| **Sprint 3** | S7-S8 | 18h | 36h | 20h | 18h | 92h | **184h** |
| **Sprint 4** | S9-S10 | 16h | 32h | 20h | 18h | 86h | **172h** |
| **Sprint 5** | S11-S12 | 16h | 36h | 18h | 16h | 86h | **172h** |
| **Buffer** | S13-S14 | 18h | 36h | 18h | 18h | 90h | **180h** |
| **Total** | 14 sem | **244h** | **488h** | **260h** | **240h** | | **1 232h** |

### 2.2 Repartition de la charge par role et par sprint

#### Kays -- PO / Chef de projet / Architecte (244h totales)

| Sprint | Heures | Repartition des activites |
|---|:---:|---|
| S0 | 36h | CDC redaction (16h), architecture (8h), review maquettes (4h), ceremonies (4h), game design (4h) |
| S1 | 36h | Scenario Packs (14h), review code (8h), validation POC IA (6h), ceremonies (4h), support (4h) |
| S2 | 36h | Review architecture Game Engine (10h), tests Scenario Packs (10h), documentation (8h), ceremonies (4h), support (4h) |
| S3 | 36h | Validation UX (10h), tests manuels TRIBUNAL (10h), review code (8h), ceremonies (4h), support (4h) |
| S4 | 32h | Tests DEEP (10h), validation ecran fin (6h), review (6h), ceremonies (4h), preparation S5 (6h) |
| S5 | 32h | Validation admin (8h), review finale (8h), prep livrables (8h), ceremonies (4h), support (4h) |
| Buffer | 36h | Video demo (10h), slides soutenance (8h), bugs (8h), retour experience (6h), repetition (4h) |

#### Samy -- Scrum Master / Dev Backend + IA + Temps reel (488h totales)

| Sprint | Heures | Repartition des activites |
|---|:---:|---|
| S0 | 68h | Config NestJS (6h), repo GitHub (6h), CI/CD (8h), CDC section backend (6h), schema BDD draft (6h), Figma maquettes (14h), GitHub Projects (4h), ceremonies + facilitation (6h), CI/CD support (4h), CDC (4h), ceremonies (4h) |
| S1 | 68h | Schema Prisma (12h), Auth module (12h), API CRUD scenarios (8h), ceremonies (6h), support frontend (10h), monitoring avancement (6h), burndown (4h), documentation (6h), ceremonies (4h) |
| S2 | 68h | Pack Loader (6h), Game State Manager (10h), Choice Engine (10h), Resource Manager (6h), Game Loop (lead) (4h), tests (4h), ceremonies (6h), preparation composants UI (12h), monitoring (6h), documentation (4h), support (4h) |
| S3 | 72h | Session Manager (12h), Game Loop + WS (lead) (18h), tests E2E (6h), ceremonies (6h), support frontend lobby (10h), monitoring (6h), tests manuels (6h), support (4h), ceremonies (4h) |
| S4 | 64h | Integration DEEP backend (10h), bug fixing (10h), preparation S5 (8h), ceremonies (6h), polish UI support (10h), preparations S5 (8h), monitoring (4h), support (4h), ceremonies (4h) |
| S5 | 72h | API Admin (14h), tests backend (12h), deploiement support (6h), deploiement prod (10h), monitoring setup (6h), ceremonies (6h), tests (8h), documentation (6h), ceremonies (4h) |
| Buffer | 72h | Bugs backend (12h), documentation API (8h), retour experience (6h), soutenance (6h), support (4h), slides soutenance (8h), bugs front (8h), retour experience (6h), coordination finale (6h), repetition (8h) |

#### Youri -- Developpeur Frontend (260h totales)

| Sprint | Heures | Repartition des activites |
|---|:---:|---|
| S0 | 36h | Config Next.js (6h), CDC section frontend (6h), composants de base (10h), Figma support (8h), formation (6h) |
| S1 | 36h | Pages Auth (14h), page test IA (10h), composants partages (8h), ceremonies (4h) |
| S2 | 36h | Preparation composants Game UI (14h), refacto auth (6h), design system (10h), ceremonies (4h), formation WS (2h) |
| S3 | 40h | Catalogue scenarios (10h), lobby (12h), Game UI (14h), ceremonies (4h) |
| S4 | 40h | Jauges ressources (8h), ecran fin (12h), historique (6h), polish responsive (10h), ceremonies (4h) |
| S5 | 36h | Admin panel front (14h), accessibilite corrections (14h), tests front (4h), ceremonies (4h) |
| Buffer | 36h | Bugs front (12h), documentation (6h), retour experience (6h), soutenance (8h), formation (4h) |

#### Yassir -- Dev Frontend / UX-UI + DevOps (240h totales)

| Sprint | Heures | Repartition des activites |
|---|:---:|---|
| S0 | 32h | CDC section IA (6h), etude API Anthropic (8h), POC prompts (10h), formation equipe (4h), ceremonies (4h) |
| S1 | 32h | POC AI Service (14h), Scenario Packs (8h), page test IA (6h), ceremonies (4h) |
| S2 | 36h | Role Manager (8h), Game Loop Manager (support IA) (14h), optimisation prompts (10h), ceremonies (4h) |
| S3 | 36h | WebSocket Gateway (12h), WS + Game Loop (support) (14h), tests E2E (6h), ceremonies (4h) |
| S4 | 36h | Streaming IA (14h), reconnexion joueur (12h), optimisation prompts DEEP (6h), ceremonies (4h) |
| S5 | 32h | Tests (10h), optimisation couts IA (8h), eco-index (4h), documentation IA (6h), ceremonies (4h) |
| Buffer | 36h | Bugs IA (10h), documentation prompts (8h), retour experience (6h), soutenance (6h), support (6h) |

### 2.3 Charge prevue vs capacite par sprint

| Sprint | SP | Capacite brute (h) | Facteur focus | Capacite effective (h) | Charge estimee (h) | Marge |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Sprint 0 | 23 | 172h | 0,70 | 120h | ~104h | **+15%** |
| Sprint 1 | 29 | 172h | 0,75 | 129h | ~116h | **+11%** |
| Sprint 2 | 37 | 180h | 0,80 | 144h | ~133h | **+8%** |
| Sprint 3 | 37 | 184h | 0,80 | 147h | ~135h | **+9%** |
| Sprint 4 | 29 | 172h | 0,80 | 138h | ~116h | **+19%** |
| Sprint 5 | 26 | 172h | 0,80 | 138h | ~110h | **+25%** |
| Buffer | 15 | 180h | 0,70 | 126h | ~60h | **+110%** |
| **Total** | **196** | **1 232h** | | **942h** | **~774h** | **+22%** |

**Facteurs de focus justifies** :
- **0,70** (Sprint 0, Buffer) : Phase de cadrage ou de finalisation, beaucoup de reunions, documentation, coordination
- **0,75** (Sprint 1) : Montee en charge, formation, prise en main des outils
- **0,80** (Sprints 2-5) : Vitesse de croisiere, equipe operationnelle

---

## 3. Tableau de disponibilite

### 3.1 Calendrier des absences previsibles

| Semaine | Dates | Kays | Samy | Youri | Yassir | Evenements |
|:---:|---|:---:|:---:|:---:|:---:|---|
| S1 | 10/02 - 14/02 | OK | OK | OK | OK | Kickoff projet |
| S2 | 17/02 - 21/02 | OK | OK | OK | OK | Sprint Review S0 |
| S3 | 24/02 - 28/02 | OK | OK | OK | OK | |
| S4 | 03/03 - 07/03 | OK | OK | OK | OK | Sprint Review S1 |
| S5 | 10/03 - 14/03 | OK | OK | OK | OK | |
| S6 | 17/03 - 21/03 | OK | OK | OK | OK | Sprint Review S2 |
| S7 | 24/03 - 28/03 | OK | OK | OK | OK | |
| S8 | 31/03 - 04/04 | OK | -50% | OK | OK | Samy : examens partiels, Sprint Review S3 |
| S9 | 07/04 - 11/04 | -50% | -50% | OK | OK | Kays + Samy : projet parallele (deadline) |
| S10 | 14/04 - 18/04 | OK | OK | OK | OK | Sprint Review S4 |
| S11 | 21/04 - 25/04 | OK | OK | OK | OK | |
| S12 | 28/04 - 02/05 | OK | OK | OK | OK | Deploiement prod, Sprint Review S5 |
| S13 | 05/05 - 09/05 | OK | OK | OK | OK | **8 mai ferie** (-1 jour equipe) |
| S14 | 12/05 - 16/05 | OK | OK | OK | -50% | **14 mai ferie (Ascension)**, Yassir : soutenance autre UE |

**Legende** :
- OK = Disponibilite normale
- -50% = Disponibilite reduite de moitie
- ABS = Absent

### 3.2 Impact des absences sur la capacite

| Semaine | Capacite nominale | Reduction | Capacite reelle | Sprint impacte |
|:---:|:---:|:---:|:---:|---|
| S8 | 92h/sem | -18h (Samy -50%) | **74h** | Sprint 3 (integration WS) |
| S9 | 86h/sem | -25h (Kays -50%, Samy -50%) | **61h** | Sprint 4 (DEEP + UI) |
| S13 | 90h/sem | -18h (8 mai ferie) | **72h** | Buffer |
| S14 | 90h/sem | -18h (Ascension) -11h (Yassir -50%) | **61h** | Buffer |

**Strategie d'attenuation** :
- S8 : Samy (SM/Back/IA) en capacite reduite -> Kays (PO) assure la facilitation des ceremonies
- S9 : Kays (PO) et Samy (SM/Back/IA) reduits -> Youri (Frontend) et Yassir (DevOps) prennent le lead, sprint allege
- S13-S14 : Buffer largement dimensionne pour absorber les pertes

### 3.3 Contraintes academiques recurrentes

| Jour | Kays | Samy | Youri | Yassir | Impact |
|---|---|---|---|---|---|
| **Lundi** | Cours matin | Cours matin | Cours matin | Cours toute journee | Sprint Planning le lundi apres-midi (14h) |
| **Mardi** | Cours matin | OK | OK | Cours matin | Matinees reduites pour Kays et Yassir |
| **Mercredi** | OK | Cours apres-midi | OK | OK | Refinement le mercredi matin si necessaire |
| **Jeudi** | OK | OK | Cours matin | OK | Journee la plus productive pour l'equipe |
| **Vendredi** | OK | Cours matin | OK | OK | Sprint Review le vendredi apres-midi (14h) |

**Creneaux de travail synchrone optimaux** : Mardi 14h-18h, Jeudi 14h-18h (toute l'equipe disponible)

---

## 4. Matrice RACI

### 4.1 Legende RACI

| Lettre | Signification | Description |
|:---:|---|---|
| **R** | Responsible | Realise la tache, fait le travail |
| **A** | Accountable | Responsable final, valide le livrable (1 seul par activite) |
| **C** | Consulted | Consulte avant/pendant la tache (communication bidirectionnelle) |
| **I** | Informed | Informe du resultat (communication unidirectionnelle) |

### 4.2 Matrice RACI complete

#### Phase Cadrage (Sprint 0)

| Activite | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) |
|---|:---:|:---:|:---:|:---:|
| Redaction CDC | A | R | R | R |
| Definition architecture | A/R | R | I | C |
| Maquettes Figma | C | A/R | R | I |
| Initialisation repo Git | I | A/R | I | I |
| Config Next.js (frontend) | I | C | A/R | I |
| Config NestJS (backend) | C | A/R | I | I |
| Config CI/CD | I | A/R | I | I |
| Config GitHub Projects | I | A/R | I | I |
| Definition backlog | A/R | R | C | C |
| Design system | C | A/R | R | I |

#### Phase Fondations (Sprint 1)

| Activite | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) |
|---|:---:|:---:|:---:|:---:|
| Schema Prisma (BDD) | C | A/R | I | I |
| Module Auth backend | I | A/R | I | I |
| Pages Auth frontend | I | I | A/R | I |
| API CRUD Scenarios | A | R | I | I |
| POC AI Service | C | C | I | A/R |
| Page test IA frontend | I | I | R | A/C |
| Scenario Pack TRIBUNAL | A/R | I | I | R |
| Scenario Pack DEEP | A/R | I | I | R |
| Tests unitaires Auth | I | A/R | I | I |

#### Phase Game Engine (Sprint 2)

| Activite | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) |
|---|:---:|:---:|:---:|:---:|
| Scenario Pack Loader | C | A/R | I | I |
| Game State Manager | C | A/R | I | C |
| Role Manager | C | C | I | A/R |
| Choice Engine | A | R | I | C |
| Resource Manager | C | A/R | I | I |
| Game Loop Manager | A | R | I | R |
| Tests integration | I | A/R | I | C |
| Preparation composants UI | I | C | A/R | I |

#### Phase Multijoueur (Sprint 3)

| Activite | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) |
|---|:---:|:---:|:---:|:---:|
| WebSocket Gateway | I | C | I | A/R |
| Session Manager | C | A/R | I | C |
| Integration WS + Game Loop | A | R | I | R |
| Page catalogue scenarios | C | C | A/R | I |
| Page lobby | C | C | A/R | I |
| Game UI (narration/choix/chat) | A | C | R | C |
| Test E2E TRIBUNAL | A | R | R | R |

#### Phase DEEP + UI (Sprint 4)

| Activite | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) |
|---|:---:|:---:|:---:|:---:|
| Composant jauges ressources | C | C | A/R | I |
| Ecran de fin de partie | A | C | R | I |
| Streaming IA | I | I | C | A/R |
| Test E2E DEEP | A | R | R | R |
| Historique narratif | C | I | A/R | I |
| Polish UI responsive | C | C | A/R | I |
| Reconnexion joueur | I | C | I | A/R |

#### Phase Deploiement (Sprint 5)

| Activite | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) |
|---|:---:|:---:|:---:|:---:|
| API Admin | C | A/R | I | I |
| Panel admin frontend | C | C | A/R | I |
| Audit accessibilite | C | R | A/R | I |
| Deploiement production | I | A/R | I | I |
| Monitoring + health check | I | A/R | I | I |
| Tests finaux | A | R | R | R |
| Mesure eco-index | I | I | I | A/R |

#### Phase Finalisation (Buffer)

| Activite | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) |
|---|:---:|:---:|:---:|:---:|
| Correction bugs | A | R | R | R |
| Documentation technique | A | R | R | R |
| Retour d'experience | I | R | R | R |
| Video de demonstration | A/R | R | C | I |
| Preparation soutenance | R | R | R | R |

#### Activites transversales (tout au long du projet)

| Activite | Kays (PO) | Samy (SM/Back/IA) | Youri (Front) | Yassir (UX/DevOps) |
|---|:---:|:---:|:---:|:---:|
| Sprint Planning | A | R | C | C |
| Daily Standup | R | A | R | R |
| Sprint Review | A | R | R | R |
| Retrospective | C | A/R | R | R |
| Backlog grooming | A/R | R | C | C |
| Code review | C | R | R | R |
| Gestion des risques | A | R | I | C |
| Suivi budget API IA | A | R | I | C |
| Communication stakeholders | A/R | R | I | I |
| Veille technologique | C | R | R | R |

---

## 5. Budget detaille par phase et par poste

### 5.1 Budget reel du projet (depenses effectives)

#### 5.1.1 Ressources humaines

Le projet est fait dans un contexte scolaire : personne n'est paye. Mais pour calculer la **valeur du projet**, on applique un TJM (Taux Journalier Moyen) fictif.

| Parametre | Valeur |
|---|---|
| TJM fictif | 350 EUR / jour |
| Heures / jour | 7h |
| Taux horaire fictif | 50 EUR / heure |
| Total heures projet | 1 232h |
| **Valorisation RH totale** | **61 600 EUR** |

**Repartition valorisation par membre** :

| Membre | Heures totales | Valorisation fictive |
|---|:---:|---:|
| Kays (PO / Chef de projet / Architecte) | 244h | 12 200 EUR |
| Samy (SM / Dev Backend + IA + Temps reel) | 488h | 24 400 EUR |
| Youri (Dev Frontend) | 260h | 13 000 EUR |
| Yassir (Dev Frontend / UX-UI + DevOps) | 240h | 12 000 EUR |
| **Total** | **1 232h** | **61 600 EUR** |

#### 5.1.2 Infrastructure -- Detail par fournisseur et tier

| Service | Fournisseur | Tier | Cout/mois | Duree | Total | Limites du tier |
|---|---|---|---:|---|---:|---|
| Frontend hosting | Vercel | Hobby (gratuit) | 0 EUR | 4 mois | **0 EUR** | 100 Go bande passante, 1 deploiement concurrent |
| Backend hosting | Railway | Starter | 0-5 EUR | 4 mois | **0-20 EUR** | 5$ credits/mois, 512 Mo RAM, 1 Go disque |
| PostgreSQL | Railway | Inclus Starter | 0 EUR | 4 mois | **0 EUR** | Partage les credits Railway |
| Redis | Upstash | Free | 0 EUR | 4 mois | **0 EUR** | 10K commandes/jour, 256 Mo, 1 BDD |
| DNS / CDN | Cloudflare | Free | 0 EUR | 4 mois | **0 EUR** | DNS, CDN basique, SSL |
| **Total Infrastructure** | | | | | **0-20 EUR** | |

**Note** : Railway offre 5$ de credits gratuits par mois. Pour un backend NestJS avec PostgreSQL et Redis, la consommation estimee est de 3-5$/mois en production. Si les credits gratuits sont insuffisants, le passage au plan Starter a 5$/mois sera necessaire a partir du Sprint 5.

#### 5.1.3 Services externes -- API IA (detail calcule)

##### Modeles utilises et tarification

| Modele | Usage | Cout input (par 1K tokens) | Cout output (par 1K tokens) |
|---|---|---:|---:|
| Claude 3.5 Sonnet | Narration, resolution, finale | 0,003 $ | 0,015 $ |
| Claude 3.5 Haiku | Setup, validation actions, chat modere | 0,00025 $ | 0,00125 $ |

##### Estimation des tokens par phase de jeu

| Phase de jeu | Modele | Tokens input (avg) | Tokens output (avg) | Cout par appel |
|---|---|---:|---:|---:|
| SETUP (contexte initial) | Haiku | 1 500 | 800 | ~0,001 $ |
| NARRATION (scene + options) | Sonnet | 3 000 | 1 200 | ~0,027 $ |
| RESOLUTION (consequences) | Sonnet | 3 500 | 1 000 | ~0,026 $ |
| MESSAGES PRIVES | Haiku | 1 000 | 400 | ~0,0008 $ |
| FINALE (climax + revelations) | Sonnet | 4 000 | 2 000 | ~0,042 $ |

##### Estimation du cout par partie

| Type de partie | Rounds | Appels IA | Cout estime par partie |
|---|:---:|:---:|---:|
| TRIBUNAL (5 rounds) | 5 | 1 setup + 5 narrations + 5 resolutions + 10 messages prives + 1 finale | ~0,32 $ |
| DEEP (8 rounds) | 8 | 1 setup + 8 narrations + 8 resolutions + 12 messages prives + 1 finale | ~0,48 $ |
| **Moyenne** | | | **~0,40 $** |

##### Estimation du nombre de sessions par phase

| Phase | Sprint | Nb sessions estimees | Type | Justification |
|---|---|:---:|---|---|
| Developpement POC | S1 | 30 | TRIBUNAL (court) | Tests du prompt engineering, iterations |
| Test Game Engine | S2 | 20 | Mix | Tests d'integration (certains mockes) |
| Integration WS | S3 | 25 | TRIBUNAL | Tests multijoueur en temps reel |
| Integration DEEP | S4 | 20 | DEEP | Tests jauges, conditions de fin |
| Tests finaux + prod | S5 | 15 | Mix | Validation E2E, deploiement |
| Buffer + demo | Buffer | 10 | Mix | Demo video, tests derniere minute |
| **Total** | | **120 sessions** | | |

**Note importante** : Environ 40% des tests utiliseront des mocks de l'API IA (tests d'integration en CI). Seules ~70 sessions genereront des appels reels.

##### Cout total API IA

| Element | Calcul | Total |
|---|---|---:|
| Sessions reelles | 70 x 0,40 $ | 28,00 $ |
| Sessions mock (CI) | 50 x 0,00 $ | 0,00 $ |
| Appels de debug/iteration prompts | ~200 appels x 0,01 $ (Haiku) | 2,00 $ |
| Marge de securite (+30%) | | 9,00 $ |
| **Total API IA** | | **39,00 $** (~36 EUR) |

#### 5.1.4 Outils gratuits utilises

| Outil | Usage | Cout | Plan |
|---|---|---:|---|
| GitHub | Versioning, PR, Issues, Projects, Actions | 0 EUR | Free (repo public) ou Education |
| GitHub Actions | CI/CD | 0 EUR | 2000 min/mois gratuit |
| Figma | Maquettes UI/UX | 0 EUR | Plan Education gratuit |
| Notion | Documentation, journal de bord, veille | 0 EUR | Plan Education gratuit |
| Discord | Communication equipe, daily standup | 0 EUR | Gratuit |
| VS Code | IDE | 0 EUR | Open source |
| Lighthouse | Audit performance + accessibilite | 0 EUR | Outil Chrome gratuit |
| WAVE | Audit accessibilite | 0 EUR | Extension gratuite |
| GreenIT Analysis | Mesure eco-index | 0 EUR | Extension gratuite |
| UptimeRobot | Monitoring uptime | 0 EUR | Plan gratuit (50 moniteurs) |
| Postman | Tests API | 0 EUR | Plan gratuit |
| **Total outils** | | **0 EUR** | |

#### 5.1.5 Domaine et divers

| Poste | Cout | Obligatoire | Note |
|---|---:|:---:|---|
| Nom de domaine (.game ou .app) | 10-15 EUR/an | Non | Optionnel, URL Vercel/Railway suffisante pour le MVP |
| Certificat SSL | 0 EUR | Oui | Inclus dans Vercel et Railway (Let's Encrypt) |
| Stockage fichiers (images) | 0 EUR | Oui | Cloudflare R2 gratuit (10 Go) ou assets statiques |
| **Total divers** | **0-15 EUR** | | |

### 5.2 Budget total par phase

| Phase | Sprint | Infrastructure | API IA | Domaine | Total phase |
|---|---|---:|---:|---:|---:|
| Cadrage | S0 | 0 EUR | 0 EUR | 0 EUR | **0 EUR** |
| Fondations | S1 | 0 EUR | ~8 EUR | 0 EUR | **~8 EUR** |
| Game Engine | S2 | 0 EUR | ~5 EUR | 0 EUR | **~5 EUR** |
| Multijoueur | S3 | 0 EUR | ~8 EUR | 0 EUR | **~8 EUR** |
| DEEP + UI | S4 | 0 EUR | ~6 EUR | 0 EUR | **~6 EUR** |
| Deploiement | S5 | ~5 EUR | ~5 EUR | 10-15 EUR | **~20-25 EUR** |
| Finalisation | Buffer | ~5 EUR | ~4 EUR | 0 EUR | **~9 EUR** |
| **Total projet** | | **~10 EUR** | **~36 EUR** | **~10-15 EUR** | **~56-61 EUR** |

### 5.3 Budget total consolide

| Poste | Cout reel | Valorisation fictive | % budget reel |
|---|---:|---:|:---:|
| Ressources humaines | 0 EUR | 61 600 EUR | 0% |
| Infrastructure (hosting, BDD, cache) | 0-20 EUR | - | 0-33% |
| API IA (Anthropic Claude) | ~36 EUR | - | 59-64% |
| Outils (GitHub, Figma, Notion, etc.) | 0 EUR | - | 0% |
| Domaine | 0-15 EUR | - | 0-25% |
| **Total depenses reelles** | **56-71 EUR** | | **100%** |
| **Marge de securite (+50%)** | **28-36 EUR** | | |
| **Budget total avec marge** | **84-107 EUR** | | |
| **Budget alloue** | **308 EUR** | | Marge confortable |

### 5.4 Valorisation totale du projet

| Element | Valeur |
|---|---:|
| Valorisation RH (1 232h x 50 EUR/h) | 61 600 EUR |
| Infrastructure (cout reel) | ~10 EUR |
| API IA (cout reel) | ~36 EUR |
| Outils (valeur marche : Figma Pro x4, Notion Team, etc.) | ~1 920 EUR/an |
| **Valorisation totale du projet** | **~63 566 EUR** |

---

## 6. Suivi budgetaire

### 6.1 Template de tableau de suivi mensuel

Ce tableau est rempli a chaque Sprint Review (toutes les 2 semaines) et consolide mensuellement.

#### Suivi mensuel -- Fevrier 2026

| Poste | Budget prevu | Depense reelle | Ecart | Ecart % | Commentaire |
|---|---:|---:|---:|:---:|---|
| Infrastructure | 0 EUR | | | | Tiers gratuits |
| API IA | 8 EUR | | | | POC + iterations prompts |
| Domaine | 0 EUR | | | | Pas encore necessaire |
| Divers | 0 EUR | | | | |
| **Total Fevrier** | **8 EUR** | | | | |

#### Suivi mensuel -- Mars 2026

| Poste | Budget prevu | Depense reelle | Ecart | Ecart % | Commentaire |
|---|---:|---:|---:|:---:|---|
| Infrastructure | 0 EUR | | | | Tiers gratuits |
| API IA | 13 EUR | | | | Game Engine + WS tests |
| Domaine | 0 EUR | | | | |
| Divers | 0 EUR | | | | |
| **Total Mars** | **13 EUR** | | | | |

#### Suivi mensuel -- Avril 2026

| Poste | Budget prevu | Depense reelle | Ecart | Ecart % | Commentaire |
|---|---:|---:|---:|:---:|---|
| Infrastructure | 0-5 EUR | | | | Railway starter si necessaire |
| API IA | 11 EUR | | | | DEEP tests + tests finaux |
| Domaine | 10-15 EUR | | | | Achat domaine si valide |
| Divers | 0 EUR | | | | |
| **Total Avril** | **21-31 EUR** | | | | |

#### Suivi mensuel -- Mai 2026

| Poste | Budget prevu | Depense reelle | Ecart | Ecart % | Commentaire |
|---|---:|---:|---:|:---:|---|
| Infrastructure | 5 EUR | | | | Production Railway |
| API IA | 4 EUR | | | | Demo + derniers tests |
| Domaine | 0 EUR | | | | Deja paye |
| Divers | 0 EUR | | | | |
| **Total Mai** | **9 EUR** | | | | |

#### Synthese cumulative

| Mois | Prevu cumule | Realise cumule | Ecart cumule | Ecart % | Statut |
|---|---:|---:|---:|:---:|:---:|
| Fevrier | 8 EUR | | | | |
| Mars | 21 EUR | | | | |
| Avril | 42-52 EUR | | | | |
| Mai | 51-61 EUR | | | | |

**Seuils d'alerte** :
- Ecart < 10% : Normal (vert)
- Ecart 10-30% : Attention (orange) -> analyse de l'ecart en Sprint Review
- Ecart > 30% : Alerte (rouge) -> reunion exceptionnelle, plan de contingence active

### 6.2 Dashboard de suivi API IA

| Metrique | Sprint 1 | Sprint 2 | Sprint 3 | Sprint 4 | Sprint 5 | Buffer | Total |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Nb appels Sonnet | | | | | | | |
| Nb appels Haiku | | | | | | | |
| Tokens input (total) | | | | | | | |
| Tokens output (total) | | | | | | | |
| Cout Sonnet ($) | | | | | | | |
| Cout Haiku ($) | | | | | | | |
| **Cout total ($)** | | | | | | | |
| Sessions de test | | | | | | | |
| Cout moyen/session | | | | | | | |

**Source des donnees** : Dashboard Anthropic (console.anthropic.com) + logs applicatifs (NestJS AI Service).

---

## 7. Analyse de la valeur acquise (EVM)

### 7.1 Principes de l'Earned Value Management

L'analyse de la valeur acquise (EVM) sert a mesurer la performance du projet en comparant trois indicateurs :

| Indicateur | Sigle | Definition | Formule |
|---|:---:|---|---|
| **Valeur planifiee** | PV (Planned Value) | Valeur du travail prevu a une date donnee | Selon le planning |
| **Valeur acquise** | EV (Earned Value) | Valeur du travail reellement accompli | % SP termines x Budget total |
| **Cout reel** | AC (Actual Cost) | Cout reel depense a une date donnee | Depenses reelles |

### 7.2 Budget a l'achevement (BAC)

Pour l'EVM, on utilise la valorisation fictive du projet comme Budget at Completion (BAC).

| Element | Valeur |
|---|---:|
| **BAC (Budget at Completion)** | **61 600 EUR** (valorisation RH) |
| Total Story Points | 196 SP |
| Valeur par Story Point | 314,29 EUR / SP |

### 7.3 Valeur planifiee (PV) par sprint

| Sprint | SP cumules | % avancement prevu | PV (Planned Value) |
|---|:---:|:---:|---:|
| Sprint 0 | 23 | 11,7% | 7 224 EUR |
| Sprint 1 | 52 | 26,5% | 16 337 EUR |
| Sprint 2 | 89 | 45,4% | 27 971 EUR |
| Sprint 3 | 126 | 64,3% | 39 604 EUR |
| Sprint 4 | 155 | 79,1% | 48 718 EUR |
| Sprint 5 | 181 | 92,3% | 56 888 EUR |
| Buffer | 196 | 100,0% | 61 600 EUR |

### 7.4 Indicateurs de performance

#### CPI -- Cost Performance Index (Indice de Performance des Couts)

```
CPI = EV / AC

CPI > 1,0 : Le projet coute moins que prevu (performance positive)
CPI = 1,0 : Le projet est dans le budget
CPI < 1,0 : Le projet coute plus que prevu (depassement)
```

**Interpretation pour MYTHOS** : Comme les RH ne sont pas facturees, le CPI est principalement impacte par les couts API IA et infrastructure. Un CPI < 1,0 signifie que les couts API depassent les previsions.

**Exemple de calcul** :
- Fin Sprint 2 : EV = 27 971 EUR, AC prevu = 13 EUR (API IA) + valorisation RH proportionnelle
- Si on ne considere que les couts reels : CPI = non applicable (RH gratuites)
- Si on considere la valorisation : CPI = EV / (heures reelles x 50 EUR)

#### SPI -- Schedule Performance Index (Indice de Performance du Calendrier)

```
SPI = EV / PV

SPI > 1,0 : Le projet est en avance sur le planning
SPI = 1,0 : Le projet est dans les temps
SPI < 1,0 : Le projet est en retard
```

**Interpretation pour MYTHOS** : Le SPI est l'indicateur le plus pertinent pour notre projet academique. Il compare les SP reellement termines aux SP planifies.

**Exemple de calcul** :
- Fin Sprint 2 : PV = 27 971 EUR (89 SP planifies), EV depend des SP reellement termines
- Si 82 SP termines : EV = 82 x 314,29 = 25 772 EUR -> SPI = 25 772 / 27 971 = **0,92** (leger retard)
- Si 89 SP termines : EV = 27 971 EUR -> SPI = **1,00** (dans les temps)
- Si 95 SP termines : EV = 29 857 EUR -> SPI = 29 857 / 27 971 = **1,07** (en avance)

### 7.5 Template de reporting EVM

Ce tableau est rempli a la fin de chaque sprint.

| Sprint | Date | PV | EV | AC | SPI | CPI | Statut | Actions |
|---|---|---:|---:|---:|:---:|:---:|:---:|---|
| S0 | 21/02 | 7 224 | | | | | | |
| S1 | 07/03 | 16 337 | | | | | | |
| S2 | 21/03 | 27 971 | | | | | | |
| S3 | 04/04 | 39 604 | | | | | | |
| S4 | 18/04 | 48 718 | | | | | | |
| S5 | 02/05 | 56 888 | | | | | | |
| Buffer | 16/05 | 61 600 | | | | | | |

**Seuils d'alerte SPI** :
- SPI >= 0,95 : En bonne voie (vert)
- SPI 0,85-0,95 : Retard modere (orange) -> reprioriser le backlog
- SPI < 0,85 : Retard critique (rouge) -> activer le plan de contingence

**Seuils d'alerte CPI** (sur couts reels uniquement) :
- Depenses < 80% du budget prevu : Economie (vert)
- Depenses 80-120% du budget prevu : Normal (vert)
- Depenses > 120% du budget prevu : Depassement (orange)
- Depenses > 150% du budget prevu : Alerte (rouge) -> contingence budgetaire

### 7.6 Courbe S previsionnelle

```
Valeur (EUR)
61 600 |                                                          ____*
       |                                                    ___/
56 888 |                                              ____/    S5
       |                                        ____/
48 718 |                                  ____/    S4
       |                            ____/
39 604 |                      ____/    S3
       |                ____/
27 971 |          ____/    S2
       |    ____/
16 337 | __/    S1
       |/
 7 224 *  S0
       |
     0 +----+----+----+----+----+----+-----> Semaines
       S0   S1   S2   S3   S4   S5  Buffer
      (S2)  (S4) (S6) (S8) (S10)(S12)(S14)

* = PV (Planned Value) -- la courbe EV est tracee au fur et a mesure
```

### 7.7 Estimation a terminaison (EAC)

A tout moment du projet, l'Estimate at Completion (EAC) peut etre calculee :

```
EAC = BAC / CPI     (si la tendance de cout se maintient)
EAC = AC + (BAC - EV)  (si les couts futurs sont conformes au budget)
```

**Exemple** : Si a la fin du Sprint 3, le SPI = 0,90 et le CPI = 1,05 :
- Le projet est en retard de 10% en termes de scope
- Le projet coute 5% de moins que prevu (en valorisation)
- EAC = 61 600 / 1,05 = 58 667 EUR (economie de 2 933 EUR en valorisation)
- Mais le retard implique que certaines fonctionnalites seront sacrifiees

---

## 8. Scenarios budgetaires

### 8.1 Scenario optimiste (probabilite : 25%)

**Hypotheses** :
- L'equipe est efficace et les prompts IA fonctionnent du premier coup
- Les tiers gratuits suffisent pour toute la duree du projet
- Pas de deploiement Railway payant necessaire
- Moins de sessions de test que prevu (qualite des prompts des le depart)

| Poste | Cout optimiste |
|---|---:|
| Infrastructure | 0 EUR |
| API IA (50 sessions reelles x 0,30 $/session) | ~15 EUR |
| Domaine | 0 EUR (URL Vercel/Railway suffisante) |
| Divers | 0 EUR |
| **Total optimiste** | **~15 EUR** |

**Conditions** :
- Prompts valides en < 15 iterations
- Aucun depassement de tier gratuit (Railway, Upstash)
- Pas d'achat de domaine
- Tests principalement en mode mock

### 8.2 Scenario realiste (probabilite : 55%)

**Hypotheses** :
- Le developpement se passe normalement avec quelques iterations sur les prompts
- Railway necessite un upgrade au plan Starter pour la production
- Un domaine est achete pour la presentation
- Le nombre de sessions de test est conforme aux estimations

| Poste | Cout realiste |
|---|---:|
| Infrastructure (Railway Starter x 2 mois) | 10 EUR |
| API IA (70 sessions reelles x 0,40 $/session + debug) | ~36 EUR |
| Domaine (.app ou .game) | 12 EUR |
| Divers (certificats, stockage) | 0 EUR |
| **Total realiste** | **~58 EUR** |

**Conditions** :
- 70 sessions de test reelles (les autres en mock)
- Railway Starter necessaire pour Sprint 5 et Buffer
- Domaine achete en Sprint 5

### 8.3 Scenario pessimiste (probabilite : 20%)

**Hypotheses** :
- Les prompts IA necessitent beaucoup d'iterations (mauvaise qualite initiale)
- Le streaming IA consomme plus de tokens que prevu
- Railway necessite un plan plus eleve (usage CPU/RAM)
- Des appels IA supplementaires pour le debugging
- Un incident API Anthropic necessite un basculement temporaire vers OpenAI (couts differents)

| Poste | Cout pessimiste |
|---|---:|
| Infrastructure (Railway Pro x 2 mois) | 40 EUR |
| API IA Anthropic (120 sessions x 0,50 $ + 500 appels debug) | ~70 EUR |
| API IA OpenAI (fallback, 20 sessions x 0,60 $) | ~12 EUR |
| Domaine (.game premium) | 20 EUR |
| Redis Upstash (depassement tier gratuit) | 5 EUR |
| Divers | 5 EUR |
| **Total pessimiste** | **~152 EUR** |

**Conditions** :
- Prompts necessitant > 50 iterations
- 140 sessions de test reelles (peu de mocks)
- Basculement temporaire vers OpenAI (3-5 jours)
- Infrastructure plus couteuse que prevue

### 8.4 Synthese des scenarios budgetaires

| Poste | Optimiste | Realiste | Pessimiste |
|---|---:|---:|---:|
| Infrastructure | 0 EUR | 10 EUR | 40 EUR |
| API IA | 15 EUR | 36 EUR | 82 EUR |
| Domaine | 0 EUR | 12 EUR | 20 EUR |
| Divers | 0 EUR | 0 EUR | 10 EUR |
| **Total** | **15 EUR** | **58 EUR** | **152 EUR** |
| **Budget alloue** | **308 EUR** | **308 EUR** | **308 EUR** |
| **Marge restante** | 293 EUR | 250 EUR | 156 EUR |
| **Statut** | Tres confortable | Confortable | Confortable |

```
Budget (EUR)
308 |================================================================| Budget alloue
    |
152 |============================== Pessimiste
    |
 58 |=========== Realiste
    |
 15 |=== Optimiste
    |
  0 +----
```

### 8.5 Repartition des couts par poste (scenario realiste)

```
Total realiste : 58 EUR

API IA (Anthropic)    62%  ||||||||||||||||||||||||||||||||| 36 EUR
Domaine               21%  ||||||||||||                      12 EUR
Infrastructure        17%  |||||||||                         10 EUR
Outils                 0%                                     0 EUR
```

---

## 9. Plan de contingence budgetaire

### 9.1 Risque principal : depassement du budget API IA

> Samy a fait des tests de prompts pendant un week-end et il a consomme a lui seul presque 8$ en tokens. C'est la qu'on s'est dit qu'il fallait vraiment cadrer les appels IA et mettre des mocks dans les tests CI.

L'API IA (Anthropic Claude) represente **62% du budget reel** dans le scenario realiste. C'est le poste le plus imprevisible et le plus dur a maitriser.

#### Causes possibles de depassement

| Cause | Probabilite | Impact | Detection |
|---|:---:|:---:|---|
| Prompts trop longs (trop de tokens input) | Moyenne | Moyen | Monitoring tokens/appel |
| Reponses IA trop longues (output excessif) | Faible | Moyen | Limite `max_tokens` dans l'API |
| Trop de sessions de test | Elevee | Eleve | Compteur de sessions dans les logs |
| Streaming qui multiplie les appels | Faible | Faible | Streaming = 1 appel, pas de surcout |
| Basculement vers un modele plus cher | Faible | Eleve | Decision consciente de l'equipe |
| Appels en boucle (bug) | Faible | Critique | Rate limiting + monitoring |

#### Seuils d'alerte et actions

| Seuil | Budget IA consomme | Action |
|---|:---:|---|
| **Vert** | < 50% du budget prevu a mi-projet | Aucune action, continuer |
| **Jaune** | 50-80% du budget prevu a mi-projet | Review des prompts (optimisation tokens), reduire les sessions de test |
| **Orange** | > 80% du budget prevu a mi-projet | Basculer entierement sur Haiku (sauf narration critique), mocker 80% des tests |
| **Rouge** | > 100% du budget prevu avant la fin | Activer le plan de contingence complet (voir ci-dessous) |

### 9.2 Plan de contingence complet

#### Niveau 1 : Optimisation des prompts (economie estimee : -30%)

| Action | Detail | Economie |
|---|---|---:|
| Reduire les system prompts | Passer de 1500 a 800 tokens (supprimer les exemples redondants) | -15% |
| Limiter `max_tokens` output | Narration : 800 tokens max, Resolution : 600 tokens max | -10% |
| Cache des reponses repetitives | Cacher les setup de scenario (identiques a chaque partie) | -5% |

**Temps de mise en oeuvre** : 1 jour
**Impact qualite** : Faible (narrations legerement plus courtes)

#### Niveau 2 : Basculement de modele (economie estimee : -50%)

| Action | Detail | Economie |
|---|---|---:|
| Haiku pour tout (sauf narration) | Resolution, messages prives, finale en Haiku au lieu de Sonnet | -30% |
| Narration en Haiku (dernier recours) | Qualite narrative reduite mais fonctionnel | -20% |

**Temps de mise en oeuvre** : 2 heures (changement de configuration)
**Impact qualite** : Moyen (narration moins riche, mais coherente)

#### Niveau 3 : Reduction des tests IA reels (economie estimee : -60%)

| Action | Detail | Economie |
|---|---|---:|
| Mock systematique en CI | Tous les tests automatises utilisent des reponses mockees | -40% |
| Sessions de test manuelles limitees | Max 5 sessions reelles par sprint | -20% |

**Temps de mise en oeuvre** : 1 jour (implementation des mocks)
**Impact qualite** : Faible sur le code, mais risque de bugs non detectes en production

#### Niveau 4 : Changement de fournisseur IA (economie estimee : variable)

| Action | Detail | Impact |
|---|---|---|
| Basculement vers OpenAI GPT-4o-mini | Cout ~60% inferieur a Haiku, qualite acceptable | Adaptation des prompts (1-2 jours) |
| Basculement vers Mistral (API gratuite EU) | Gratuit en tier basique, qualite correcte | Adaptation des prompts (2-3 jours), risque qualite |
| LLM local (Ollama + Llama 3) | Cout = 0 EUR, mais necessite GPU local | Qualite reduite, latence variable, setup complexe |

**Critere de declenchement** : Budget IA > 150 EUR (scenario critique)

#### Niveau 5 : Reduction du perimetre IA (dernier recours)

| Action | Detail | Impact |
|---|---|---|
| Reduire le nombre de rounds | TRIBUNAL : 3 rounds au lieu de 5, DEEP : 5 rounds au lieu de 8 | Parties plus courtes |
| Supprimer les messages prives | L'IA ne genere plus de messages individuels | Perte de profondeur narrative |
| Narration pre-ecrite + variation IA | Narration de base ecrite manuellement, l'IA ne fait que varier | Rejouabilite reduite |

**Critere de declenchement** : Budget IA > 200 EUR et aucun autre levier disponible

### 9.3 Arbre de decision budgetaire

```
Budget IA consomme > 50% a mi-projet ?
|
+-- NON --> Continuer normalement
|
+-- OUI --> Optimiser les prompts (Niveau 1)
            |
            Budget IA toujours en croissance rapide ?
            |
            +-- NON --> Continuer avec prompts optimises
            |
            +-- OUI --> Basculer sur Haiku (Niveau 2)
                        |
                        Budget > 80% avant Sprint 5 ?
                        |
                        +-- NON --> Terminer avec Haiku
                        |
                        +-- OUI --> Mocker les tests (Niveau 3)
                                    |
                                    Budget > 100% ?
                                    |
                                    +-- NON --> Terminer
                                    |
                                    +-- OUI --> Changer de fournisseur (Niveau 4)
                                                ou reduire le perimetre IA (Niveau 5)
```

### 9.4 Contingence infrastructure

| Probleme | Solution | Cout additionnel | Delai |
|---|---|---:|---|
| Railway tier gratuit depasse | Upgrade au plan Starter (5$/mois) | +5 EUR/mois | 30 min |
| Railway Starter insuffisant | Upgrade au plan Pro (20$/mois) | +20 EUR/mois | 30 min |
| Upstash Redis tier gratuit depasse | Upgrade au plan Pay-as-you-go | +2-5 EUR/mois | 15 min |
| Vercel tier gratuit depasse (bande passante) | Optimiser les assets, activer CDN Cloudflare | 0 EUR | 2h |
| Downtime Railway > 1h | Deploiement alternatif sur Render ou Fly.io | 0-5 EUR/mois | 2-4h |

### 9.5 Reserve de contingence

| Element | Montant |
|---|---:|
| Budget prevu (scenario realiste) | 58 EUR |
| Reserve de contingence (+50%) | 29 EUR |
| **Budget total avec contingence** | **87 EUR** |
| Budget alloue | 308 EUR |
| **Marge disponible** | **221 EUR** |

La marge de 221 EUR nous laisse largement de quoi voir venir, meme dans le pire des cas.

---

## Annexe A -- Grille de valorisation detaillee par sprint

| Sprint | Kays (h) | Samy (h) | Youri (h) | Yassir (h) | Total (h) | Valorisation (x50EUR) |
|---|:---:|:---:|:---:|:---:|:---:|---:|
| Sprint 0 | 36 | 68 | 36 | 32 | 172 | 8 600 EUR |
| Sprint 1 | 36 | 68 | 36 | 32 | 172 | 8 600 EUR |
| Sprint 2 | 36 | 72 | 36 | 36 | 180 | 9 000 EUR |
| Sprint 3 | 36 | 72 | 40 | 36 | 184 | 9 200 EUR |
| Sprint 4 | 32 | 64 | 40 | 36 | 172 | 8 600 EUR |
| Sprint 5 | 32 | 72 | 36 | 32 | 172 | 8 600 EUR |
| Buffer | 36 | 72 | 36 | 36 | 180 | 9 000 EUR |
| **Total** | **244** | **488** | **260** | **240** | **1 232** | **61 600 EUR** |

---

## Annexe B -- Comparatif des couts API IA

Ce comparatif montre pourquoi on a choisi Anthropic Claude, et on a les alternatives sous la main si jamais on doit changer en cours de route.

| Fournisseur | Modele | Cout input/1K tokens | Cout output/1K tokens | Cout par partie TRIBUNAL | Cout par partie DEEP |
|---|---|---:|---:|---:|---:|
| **Anthropic** | Claude 3.5 Sonnet | 0,003 $ | 0,015 $ | ~0,32 $ | ~0,48 $ |
| **Anthropic** | Claude 3.5 Haiku | 0,00025 $ | 0,00125 $ | ~0,05 $ | ~0,07 $ |
| **Anthropic** | Mix Sonnet + Haiku | Variable | Variable | **~0,20 $** | **~0,30 $** |
| OpenAI | GPT-4o | 0,005 $ | 0,015 $ | ~0,38 $ | ~0,57 $ |
| OpenAI | GPT-4o-mini | 0,00015 $ | 0,0006 $ | ~0,03 $ | ~0,04 $ |
| Mistral | Mistral Large | 0,002 $ | 0,006 $ | ~0,18 $ | ~0,27 $ |
| Mistral | Mistral Small | 0,0002 $ | 0,0006 $ | ~0,02 $ | ~0,03 $ |
| Google | Gemini 1.5 Pro | 0,00125 $ | 0,005 $ | ~0,14 $ | ~0,21 $ |

**Classement par cout (croissant)** : OpenAI mini < Mistral Small < Haiku < Gemini Pro < Mix Anthropic < Mistral Large < Sonnet < GPT-4o

**Classement par qualite narrative (decroissant)** : Sonnet >= GPT-4o > Mistral Large > Gemini Pro > Haiku > GPT-4o-mini > Mistral Small

**Choix retenu** : Mix Sonnet + Haiku (meilleur ratio qualite/prix pour le jeu narratif)

---

## Annexe C -- Checklist de suivi budgetaire

A remplir a chaque Sprint Review :

- [ ] Consulter le dashboard Anthropic (console.anthropic.com) : couts du mois
- [ ] Verifier la facture Railway (dashboard.railway.app) : usage du mois
- [ ] Verifier Upstash (console.upstash.com) : nombre de commandes Redis
- [ ] Verifier Vercel (vercel.com/dashboard) : bande passante consommee
- [ ] Mettre a jour le tableau de suivi mensuel (section 6.1)
- [ ] Calculer le SPI et le CPI (section 7)
- [ ] Comparer aux seuils d'alerte
- [ ] Si seuil jaune ou orange : documenter les actions prises
- [ ] Partager le resume budgetaire en Sprint Review
- [ ] Archiver le rapport dans Notion

---

## Annexe D -- Registre des decisions budgetaires

| Date | Decision | Justification | Impact budget | Decideur |
|---|---|---|---:|---|
| 10/02/2026 | Choix Anthropic Claude (Sonnet + Haiku) | Meilleure qualite narrative pour le jeu | Budget API IA : ~36 EUR | PO + equipe |
| 10/02/2026 | Infrastructure tiers gratuits (Vercel + Railway + Upstash) | Budget minimal, suffisant pour le MVP | 0-20 EUR | Architecte |
| 10/02/2026 | Pas de domaine en Sprint 0-4 | URL Vercel/Railway suffisante pour le dev | Economie 12 EUR | PO |
| | | | | |
| | | | | |

---

*Document genere le 09/02/2026. Derniere mise a jour : 09/02/2026.*
*Responsable : Product Owner / Scrum Master*
*Prochaine revue : Sprint Review Sprint 0 (21/02/2026)*
