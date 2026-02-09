# MYTHOS - Tableaux de Bord et Reporting

**Projet** : MYTHOS - Plateforme web de jeux narratifs multijoueurs avec MJ IA
**Version** : 1.0
**Date de creation** : 09/02/2026
**Methodologie** : Scrum (7 sprints de 2 semaines)
**Perimetre** : 47 tickets | 196 story points

Les tableaux de bord constituent notre outil de pilotage operationnel. Yasmine met a jour le dashboard sprint a chaque Daily Standup, et Zahid presente le dashboard mensuel lors des Sprint Reviews. Les templates ci-dessous sont utilises tels quels dans notre espace GitHub Projects.

---

## Table des matieres

1. [Dashboard Sprint (template)](#1-dashboard-sprint)
2. [Dashboard Mensuel (template)](#2-dashboard-mensuel)
3. [Template de Sprint Review](#3-template-de-compte-rendu-de-sprint-review)
4. [Template de Retrospective](#4-template-de-compte-rendu-de-retrospective)
5. [Template de rapport hebdomadaire](#5-template-de-rapport-davancement-hebdomadaire)
6. [Exemple : Sprint 1 rempli](#6-exemple--sprint-1-rempli-donnees-fictives-realistes)

---

## 1. Dashboard Sprint

> **Usage** : A completer a la fin de chaque sprint (toutes les 2 semaines), avant la Sprint Review.
> **Responsable** : Yasmine (SM)
> **Destinataires** : Equipe, Zahid (PO), parties prenantes

---

### DASHBOARD SPRINT N[X] - MYTHOS

**Sprint** : Sprint [X]
**Dates** : [JJ/MM/AAAA] - [JJ/MM/AAAA]
**Objectif du sprint** : [Description de l'objectif du sprint en 1-2 phrases]
**Statut global** : [VERT / JAUNE / ROUGE]

---

#### 1.1 Resume du sprint

| Metrique | Valeur |
|----------|--------|
| Objectif du sprint | [Description] |
| Date de debut | [JJ/MM/AAAA] |
| Date de fin | [JJ/MM/AAAA] |
| Nombre de jours ouvrables | [10] |
| Velocite realisee | [XX] SP |
| Velocite prevue | [XX] SP |
| Ecart de velocite | [+/- XX] SP ([+/- XX]%) |
| Tickets planifies | [XX] |
| Tickets livres (Done) | [XX] |
| Tickets en cours (report sprint suivant) | [XX] |
| Taux de completion | [XX]% |

---

#### 1.2 Burndown Chart

```
Story Points restants
     |
[XX] |o
     | \
     |  o
     |   \   <-- courbe ideale (ligne droite)
     |    \
     |  *  o
     |  *   \
     | *     o
     |  *     \        * = courbe reelle
     |   *     o       o = courbe ideale
     |    *     \
     |     *     o
     |       *    \
     |        *    o
     |          *
  0  +--+--+--+--+--+--+--+--+--+--+
     J1 J2 J3 J4 J5 J6 J7 J8 J9 J10
```

**Observations** : [Commenter la forme du burndown : regulier, plateau en debut, sprint final, etc.]

---

#### 1.3 Tickets realises vs planifies

| # | Ticket | Type | SP | Statut | Assignee | Remarque |
|---|--------|------|----|--------|----------|----------|
| 1 | [MYTH-XXX] [Titre du ticket] | Feature / Bug / Tech | [X] | Done / In Progress / Blocked | [Nom] | [Commentaire optionnel] |
| 2 | | | | | | |
| 3 | | | | | | |
| 4 | | | | | | |
| 5 | | | | | | |
| 6 | | | | | | |
| 7 | | | | | | |

**Total SP planifies** : [XX] | **Total SP livres** : [XX] | **Taux** : [XX]%

**Tickets reportes au sprint suivant** :

| # | Ticket | Raison du report | Avancement estime |
|---|--------|-----------------|-------------------|
| 1 | [MYTH-XXX] [Titre] | [Raison] | [XX]% |

---

#### 1.4 KPI du sprint

##### KPI Projet

| KPI | Valeur | Cible | Statut | Tendance |
|-----|--------|-------|--------|----------|
| Velocite | [XX] SP | 28 SP | [VERT/JAUNE/ROUGE] | [hausse/stable/baisse] |
| Taux completion | [XX]% | >= 85% | [VERT/JAUNE/ROUGE] | [hausse/stable/baisse] |
| Taux de bugs | [XX]% | <= 15% | [VERT/JAUNE/ROUGE] | [hausse/stable/baisse] |
| Lead Time (mediane) | [XX]j | <= 10j | [VERT/JAUNE/ROUGE] | [hausse/stable/baisse] |
| Cycle Time (mediane) | [XX]j | <= 3j | [VERT/JAUNE/ROUGE] | [hausse/stable/baisse] |
| Review Turnaround (med.) | [XX]h | <= 4h | [VERT/JAUNE/ROUGE] | [hausse/stable/baisse] |
| SPI | [X.XX] | >= 0.90 | [VERT/JAUNE/ROUGE] | [hausse/stable/baisse] |
| CPI | [X.XX] | >= 0.90 | [VERT/JAUNE/ROUGE] | [hausse/stable/baisse] |

##### KPI Produit

| KPI | Valeur | Cible | Statut | Remarque |
|-----|--------|-------|--------|----------|
| Temps reponse IA (P50) | [XXXX]ms | <= 2000ms | [VERT/JAUNE/ROUGE] | |
| Temps reponse IA (P95) | [XXXX]ms | <= 5000ms | [VERT/JAUNE/ROUGE] | |
| Latence WebSocket (P50) | [XX]ms | <= 100ms | [VERT/JAUNE/ROUGE] | |
| LCP | [X.X]s | <= 2.5s | [VERT/JAUNE/ROUGE] | |
| INP | [XXX]ms | <= 200ms | [VERT/JAUNE/ROUGE] | |
| CLS | [X.XX] | <= 0.1 | [VERT/JAUNE/ROUGE] | |
| Uptime | [XX.X]% | >= 99.0% | [VERT/JAUNE/ROUGE] | |
| Completion sessions | [XX]% | >= 80% | [VERT/JAUNE/ROUGE] | |
| Erreurs API IA | [XX]% | <= 5% | [VERT/JAUNE/ROUGE] | |
| Couverture tests (BE) | [XX]% | >= 70% | [VERT/JAUNE/ROUGE] | |
| Couverture tests (FE) | [XX]% | >= 60% | [VERT/JAUNE/ROUGE] | |
| Dette technique | [XX] issues | <= 5 | [VERT/JAUNE/ROUGE] | |

##### KPI Conformite

| KPI | Valeur | Cible | Statut | Remarque |
|-----|--------|-------|--------|----------|
| Lighthouse Accessibility | [XX]/100 | >= 90 | [VERT/JAUNE/ROUGE] | |
| WAVE (erreurs) | [XX] | 0 | [VERT/JAUNE/ROUGE] | |
| Eco-index (grade) | [X] | A-B | [VERT/JAUNE/ROUGE] | |
| Poids moyen pages | [XXX] Ko | <= 500 Ko | [VERT/JAUNE/ROUGE] | |
| Conformite RGPD | [XX]% | 100% | [VERT/JAUNE/ROUGE] | |

---

#### 1.5 Bugs decouverts / resolus

| # | Bug | Severite | Decouvert le | Resolu le | Statut | Temps de resolution |
|---|-----|----------|-------------|-----------|--------|-------------------|
| 1 | [MYTH-BUG-XXX] [Description courte] | Critique/Majeur/Mineur | [JJ/MM] | [JJ/MM] | Resolu/Ouvert | [X]j |
| 2 | | | | | | |
| 3 | | | | | | |

**Resume bugs** :

| Metrique | Sprint [X] | Sprint [X-1] | Tendance |
|----------|-----------|-------------|----------|
| Bugs ouverts dans le sprint | [XX] | [XX] | [hausse/stable/baisse] |
| Bugs resolus dans le sprint | [XX] | [XX] | [hausse/stable/baisse] |
| Bugs critiques ouverts (fin sprint) | [XX] | [XX] | |
| Bugs totaux ouverts (fin sprint) | [XX] | [XX] | |

---

#### 1.6 Risques actifs et actions

| # | Risque | Probabilite | Impact | Criticite | Action de mitigation | Responsable | Echeance | Statut |
|---|--------|------------|--------|-----------|---------------------|-------------|----------|--------|
| R1 | [Description] | Faible/Moyen/Fort | Faible/Moyen/Fort | [P x I] | [Action] | [Nom] | [Date] | Ouvert/En cours/Ferme |
| R2 | | | | | | | | |
| R3 | | | | | | | | |

**Nouveaux risques identifies ce sprint** : [Oui/Non - si oui, lesquels]
**Risques fermes ce sprint** : [Oui/Non - si oui, lesquels]

---

#### 1.7 Budget consomme vs prevu

| Poste | Budget previsionnel cumule | Depenses reelles cumulees | Ecart | Statut |
|-------|---------------------------|--------------------------|-------|--------|
| API IA | [XX] EUR | [XX] EUR | [+/- XX] EUR | [VERT/JAUNE/ROUGE] |
| Hebergement | [XX] EUR | [XX] EUR | [+/- XX] EUR | [VERT/JAUNE/ROUGE] |
| Domaine | [XX] EUR | [XX] EUR | [+/- XX] EUR | [VERT/JAUNE/ROUGE] |
| Divers | [XX] EUR | [XX] EUR | [+/- XX] EUR | [VERT/JAUNE/ROUGE] |
| **TOTAL** | **[XX] EUR** | **[XX] EUR** | **[+/- XX] EUR** | **[VERT/JAUNE/ROUGE]** |

**CPI calcule** : [X.XX] | **Budget restant** : [XX] EUR | **Projection fin de projet** : [XX] EUR

---

#### 1.8 Points positifs / Points a ameliorer

**Points positifs (ce qui a bien fonctionne)** :
- [Point 1]
- [Point 2]
- [Point 3]

**Points a ameliorer** :
- [Point 1]
- [Point 2]
- [Point 3]

---

#### 1.9 Decisions prises durant le sprint

| # | Decision | Contexte | Impact | Prise par | Date |
|---|----------|----------|--------|-----------|------|
| 1 | [Decision] | [Pourquoi] | [Consequence] | [Nom/Role] | [JJ/MM] |
| 2 | | | | | |

---

#### 1.10 Actions pour le prochain sprint

| # | Action | Responsable | Priorite | Echeance |
|---|--------|-------------|----------|----------|
| 1 | [Action] | [Nom] | Haute/Moyenne/Basse | Sprint [X+1] |
| 2 | | | | |
| 3 | | | | |

---

## 2. Dashboard Mensuel

> **Usage** : A completer a la fin de chaque mois (couvre environ 2 sprints).
> **Responsable** : Zahid (PO) / Yasmine (SM)
> **Destinataires** : Equipe, encadrant, parties prenantes

---

### DASHBOARD MENSUEL - MYTHOS - [MOIS AAAA]

**Periode** : [JJ/MM/AAAA] - [JJ/MM/AAAA]
**Sprints couverts** : Sprint [X] et Sprint [X+1]
**Statut global du projet** : [VERT / JAUNE / ROUGE]

---

#### 2.1 Avancement global du projet

**Progression generale** :

```
Avancement global : [XX]% (XX/196 SP livres)

[========================================>                    ] XX%
 SP livres: XXX / 196
```

**Avancement par Epic** :

| Epic | Tickets total | Tickets Done | SP total | SP Done | % Completion | Statut |
|------|--------------|-------------|----------|---------|-------------|--------|
| E1 - Authentification & Utilisateurs | [X] | [X] | [XX] | [XX] | [XX]% | [VERT/JAUNE/ROUGE] |
| E2 - Interface de jeu (Frontend) | [X] | [X] | [XX] | [XX] | [XX]% | [VERT/JAUNE/ROUGE] |
| E3 - Moteur IA (MJ) | [X] | [X] | [XX] | [XX] | [XX]% | [VERT/JAUNE/ROUGE] |
| E4 - Multijoueur (WebSocket) | [X] | [X] | [XX] | [XX] | [XX]% | [VERT/JAUNE/ROUGE] |
| E5 - Gestion des sessions/parties | [X] | [X] | [XX] | [XX] | [XX]% | [VERT/JAUNE/ROUGE] |
| E6 - Accessibilite & Eco-conception | [X] | [X] | [XX] | [XX] | [XX]% | [VERT/JAUNE/ROUGE] |
| E7 - DevOps & Infrastructure | [X] | [X] | [XX] | [XX] | [XX]% | [VERT/JAUNE/ROUGE] |
| **TOTAL** | **47** | **[XX]** | **196** | **[XX]** | **[XX]%** | |

---

#### 2.2 Courbe de velocite (sprints compares)

```
Velocite (SP)
    |
 35 |
    |
 30 |          +--------+
    |          |        |
 25 |  +-------+        +--------+
    |  |                         |
 20 |  |                         |   Cible: 28 SP
    |  |   - - - - - - - - - - - - - - - - - - - (cible)
 15 |  |
    |  |
 10 |  |
    |  |
  5 |  |
    |  |
  0 +--+--------+--------+--------+--------+--------+--------+
      S1       S2       S3       S4       S5       S6       S7
```

| Sprint | Velocite planifiee | Velocite realisee | Ecart | Cumul planifie | Cumul realise |
|--------|-------------------|-------------------|-------|---------------|--------------|
| Sprint 1 | 22 SP | [XX] SP | [+/- XX] | 22 SP | [XX] SP |
| Sprint 2 | 26 SP | [XX] SP | [+/- XX] | 48 SP | [XX] SP |
| Sprint 3 | 28 SP | [XX] SP | [+/- XX] | 76 SP | [XX] SP |
| Sprint 4 | 30 SP | [XX] SP | [+/- XX] | 106 SP | [XX] SP |
| Sprint 5 | 30 SP | [XX] SP | [+/- XX] | 136 SP | [XX] SP |
| Sprint 6 | 32 SP | [XX] SP | [+/- XX] | 168 SP | [XX] SP |
| Sprint 7 | 28 SP | [XX] SP | [+/- XX] | 196 SP | [XX] SP |

**Velocite moyenne** : [XX] SP/sprint
**Ecart-type** : [XX] SP (stabilite de la velocite)
**Projection a la fin du projet** : [XXX] SP sur 196 prevus

---

#### 2.3 Budget cumule (previsionnel vs realise)

```
Budget (EUR)
     |
 200 |                                              o-------- previsionnel
     |                                         o
 175 |                                    o
     |                               *
 150 |                          *              * = realise
     |                     o
 125 |                o              o = previsionnel
     |           *
 100 |      *
     | o
  75 |
     |
  50 |
     |
  25 |
     |
   0 +----+----+----+----+----+----+----+
     S0  S1   S2   S3   S4   S5   S6   S7
```

| Sprint | Budget previsionnel cumule | Depenses reelles cumulees | Ecart cumule | CPI |
|--------|---------------------------|--------------------------|-------------|-----|
| Sprint 1 | [XX] EUR | [XX] EUR | [+/- XX] EUR | [X.XX] |
| Sprint 2 | [XX] EUR | [XX] EUR | [+/- XX] EUR | [X.XX] |
| Sprint 3 | [XX] EUR | [XX] EUR | [+/- XX] EUR | [X.XX] |
| Sprint 4 | [XX] EUR | [XX] EUR | [+/- XX] EUR | [X.XX] |
| Sprint 5 | [XX] EUR | [XX] EUR | [+/- XX] EUR | [X.XX] |
| Sprint 6 | [XX] EUR | [XX] EUR | [+/- XX] EUR | [X.XX] |
| Sprint 7 | [XX] EUR | [XX] EUR | [+/- XX] EUR | [X.XX] |

**Depenses du mois** : [XX] EUR
**Budget restant** : [XX] EUR
**Estimation a terminaison (EAC)** : [XX] EUR

---

#### 2.4 KPI Produit (synthese mensuelle)

| KPI | Sprint [X] | Sprint [X+1] | Tendance | Statut |
|-----|-----------|-------------|----------|--------|
| Temps reponse IA (P50) | [XXXX]ms | [XXXX]ms | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |
| Temps reponse IA (P95) | [XXXX]ms | [XXXX]ms | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |
| Latence WebSocket (P50) | [XX]ms | [XX]ms | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |
| Uptime | [XX.X]% | [XX.X]% | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |
| Completion sessions | [XX]% | [XX]% | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |
| Erreurs API IA | [XX]% | [XX]% | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |
| Couverture tests (BE) | [XX]% | [XX]% | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |
| Couverture tests (FE) | [XX]% | [XX]% | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |
| Dette technique (issues) | [XX] | [XX] | [hausse/stable/baisse] | [VERT/JAUNE/ROUGE] |

---

#### 2.5 Risques mis a jour

| # | Risque | Prob. | Impact | Crit. | Evolution | Action | Resp. | Statut |
|---|--------|-------|--------|-------|-----------|--------|-------|--------|
| R1 | [Description] | [F/M/E] | [F/M/E] | [Score] | [Nouveau/Stable/Aggrave/Ameliore] | [Action] | [Nom] | [Ouvert/Ferme] |
| R2 | | | | | | | | |
| R3 | | | | | | | | |

**Matrice de risques** :

```
Impact
  Eleve  |  R?  |  R?  |  R?  |
  Moyen  |  R?  |  R?  |  R?  |
  Faible |  R?  |  R?  |  R?  |
         +------+------+------+
          Faible Moyen  Eleve
                Probabilite
```

---

#### 2.6 Conformite (RGPD, accessibilite, eco-index)

| Critere | Sprint [X] | Sprint [X+1] | Cible finale | Statut | Action requise |
|---------|-----------|-------------|-------------|--------|---------------|
| Lighthouse Accessibility | [XX]/100 | [XX]/100 | >= 90 | [VERT/JAUNE/ROUGE] | [Action ou "RAS"] |
| WAVE (erreurs) | [XX] | [XX] | 0 | [VERT/JAUNE/ROUGE] | [Action ou "RAS"] |
| Eco-index | [Grade] | [Grade] | A-B | [VERT/JAUNE/ROUGE] | [Action ou "RAS"] |
| Poids moyen pages | [XXX] Ko | [XXX] Ko | <= 500 Ko | [VERT/JAUNE/ROUGE] | [Action ou "RAS"] |
| RGPD (% documentes) | [XX]% | [XX]% | 100% | [VERT/JAUNE/ROUGE] | [Action ou "RAS"] |
| ANSSI (% conforme) | [XX]% | [XX]% | >= 90% | [VERT/JAUNE/ROUGE] | [Action ou "RAS"] |

---

#### 2.7 Communication aux parties prenantes

**Messages cles ce mois** :
1. [Message cle 1 - avancement, risque ou decision importante]
2. [Message cle 2]
3. [Message cle 3]

**Points d'attention pour le mois suivant** :
1. [Point 1]
2. [Point 2]

**Besoins / demandes aux parties prenantes** :
1. [Besoin ou decision a prendre]

---

## 3. Template de compte-rendu de Sprint Review

> **Usage** : Redige apres chaque Sprint Review (ceremonie Scrum de fin de sprint).
> **Responsable** : Zahid (PO) (avec support de Yasmine (SM))
> **Duree de la ceremonie** : 1h maximum

---

### COMPTE-RENDU DE SPRINT REVIEW - SPRINT [X]

**Date** : [JJ/MM/AAAA]
**Heure** : [HH:MM] - [HH:MM]
**Lieu** : [Salle / Lien visio]

**Participants** :

| Nom | Role | Present |
|-----|------|---------|
| Zahid | PO / Architecte | Oui/Non |
| Yasmine | SM / Frontend | Oui/Non |
| Lucas | Frontend | Oui/Non |
| Karim | IA / Temps reel | Oui/Non |
| Sofia | UX / DevOps | Oui/Non |
| [Encadrant] | Partie prenante / Tuteur | Oui/Non |

---

#### 3.1 Objectif du sprint et rappel du contexte

**Objectif du sprint** : [Description de l'objectif defini au Sprint Planning]

**Contexte** : [Elements de contexte utiles : ou en est le projet, decisions precedentes, contraintes]

---

#### 3.2 Demonstration des fonctionnalites livrees

| # | Fonctionnalite / Ticket | Demo realisee | Acceptation PO | Commentaires / Feedback |
|---|------------------------|--------------|----------------|------------------------|
| 1 | [MYTH-XXX] [Titre] | Oui/Non | Accepte / Refuse / Avec reserves | [Feedback des parties prenantes] |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |
| 6 | | | | |

**Nombre de fonctionnalites acceptees** : [X] / [X] presentees
**Nombre de fonctionnalites refusees** : [X] (raison : [detail])
**Nombre de fonctionnalites avec reserves** : [X]

---

#### 3.3 Etat du Product Backlog

**Story points livres ce sprint** : [XX] SP
**Story points totaux livres (cumul)** : [XX] / 196 SP ([XX]%)
**Tickets restants dans le backlog** : [XX] tickets

**Changements dans le backlog** :

| Type | Ticket | Description | Raison |
|------|--------|-------------|--------|
| Ajout | [MYTH-XXX] | [Titre] | [Pourquoi ce ticket a ete ajoute] |
| Retrait | [MYTH-XXX] | [Titre] | [Pourquoi ce ticket a ete retire] |
| Re-priorisation | [MYTH-XXX] | [Titre] | [Changement de priorite et pourquoi] |

---

#### 3.4 Feedback des parties prenantes

| Partie prenante | Feedback | Type | Action associee |
|----------------|----------|------|----------------|
| [Nom/Role] | [Feedback verbatim ou resume] | Positif / Negatif / Suggestion | [Action ou "Aucune"] |
| | | | |

---

#### 3.5 Adaptation du plan

**Sprint [X+1] - Objectif propose** : [Description de l'objectif du prochain sprint]

**Tickets pressentis pour le Sprint [X+1]** :

| # | Ticket | SP estimes | Priorite | Dependances |
|---|--------|-----------|----------|-------------|
| 1 | [MYTH-XXX] [Titre] | [X] | Must | [Aucune / MYTH-YYY] |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |

**Capacite estimee pour Sprint [X+1]** : [XX] SP (base sur la velocite moyenne)

---

#### 3.6 Decisions prises en Sprint Review

| # | Decision | Justification | Impact sur le backlog | Porteur |
|---|----------|--------------|----------------------|---------|
| 1 | [Decision] | [Pourquoi] | [Ajout/Retrait/Modification de tickets] | [Nom] |
| 2 | | | | |

---

## 4. Template de compte-rendu de Retrospective

> **Usage** : Redige apres chaque Sprint Retrospective (ceremonie Scrum interne a l'equipe).
> **Responsable** : Yasmine (SM)
> **Duree de la ceremonie** : 45 min - 1h
> **Format utilise** : Start / Stop / Continue

---

### COMPTE-RENDU DE RETROSPECTIVE - SPRINT [X]

**Date** : [JJ/MM/AAAA]
**Heure** : [HH:MM] - [HH:MM]
**Facilitateur** : Yasmine (SM)

**Participants** :

| Nom | Role | Present |
|-----|------|---------|
| Yasmine | SM / Frontend | Oui |
| Zahid | PO / Architecte | Oui/Non |
| Lucas | Frontend | Oui/Non |
| Karim | IA / Temps reel | Oui/Non |
| Sofia | UX / DevOps | Oui/Non |

**Note** : La retrospective est un moment de l'equipe. Les parties prenantes externes ne participent pas.

---

#### 4.1 Rappel du contexte du sprint

| Metrique | Valeur |
|----------|--------|
| Velocite realisee | [XX] SP / [XX] SP prevus |
| Taux de completion | [XX]% |
| Bugs decouverts | [XX] (dont [X] critiques) |
| Sentiment general de l'equipe (1-5) | [X]/5 |

---

#### 4.2 Format Start / Stop / Continue

##### START (Ce que nous devrions commencer a faire)

| # | Proposition | Votes | Priorite | Action decidee | Responsable |
|---|-------------|-------|----------|---------------|-------------|
| 1 | [Ce que l'equipe propose de commencer] | [XX] | Haute/Moyenne/Basse | [Action concrete] | [Nom] |
| 2 | | | | | |
| 3 | | | | | |

##### STOP (Ce que nous devrions arreter de faire)

| # | Proposition | Votes | Priorite | Action decidee | Responsable |
|---|-------------|-------|----------|---------------|-------------|
| 1 | [Ce que l'equipe propose d'arreter] | [XX] | Haute/Moyenne/Basse | [Action concrete] | [Nom] |
| 2 | | | | | |
| 3 | | | | | |

##### CONTINUE (Ce que nous devrions continuer a faire)

| # | Proposition | Votes | Remarque |
|---|-------------|-------|----------|
| 1 | [Ce qui fonctionne bien et doit etre maintenu] | [XX] | [Pourquoi c'est efficace] |
| 2 | | | |
| 3 | | | |

---

#### 4.3 Suivi des actions de la retrospective precedente

| # | Action (Sprint [X-1]) | Responsable | Statut | Commentaire |
|---|----------------------|-------------|--------|-------------|
| 1 | [Action qui avait ete decidee] | [Nom] | Fait / En cours / Non fait | [Commentaire] |
| 2 | | | | |
| 3 | | | | |

**Taux de realisation des actions de retro** : [X]/[X] ([XX]%)

---

#### 4.4 Actions decidees pour le prochain sprint

| # | Action | Responsable | Critere de succes | Suivi prevu |
|---|--------|-------------|-------------------|-------------|
| 1 | [Action concrete et verifiable] | [Nom] | [Comment savoir si c'est fait] | Retro Sprint [X+1] |
| 2 | | | | |
| 3 | | | | |

**Maximum 3 actions par retrospective** pour garantir qu'elles soient reellement mises en oeuvre.

---

#### 4.5 Note d'ambiance (optionnel)

**Moral de l'equipe** : [1-5] / 5
**Niveau de confiance pour le prochain sprint** : [Faible / Moyen / Eleve]
**Commentaire libre** : [Ressenti general de l'equipe]

---

## 5. Template de rapport d'avancement hebdomadaire

> **Usage** : Rapport concis envoye chaque vendredi a l'encadrant/tuteur.
> **Responsable** : Zahid (PO)
> **Format** : Email ou document partage
> **Duree de redaction** : 15-20 minutes maximum

---

### RAPPORT D'AVANCEMENT HEBDOMADAIRE - MYTHOS

**Semaine** : S[XX] (du [JJ/MM] au [JJ/MM/AAAA])
**Sprint en cours** : Sprint [X] - Semaine [1/2]
**Redacteur** : [Nom]

---

#### 5.1 Resume executif (3 lignes max)

> [Resume en 2-3 phrases de l'etat du projet cette semaine. Mettre en avant les faits marquants, les risques et les besoins.]

---

#### 5.2 Avancement de la semaine

**Travail realise cette semaine** :
- [Element 1 : fonctionnalite, tache technique, ou activite]
- [Element 2]
- [Element 3]

**Travail prevu la semaine prochaine** :
- [Element 1]
- [Element 2]
- [Element 3]

---

#### 5.3 Indicateurs cles

| Indicateur | Valeur | Statut |
|-----------|--------|--------|
| Avancement global | [XX]% (XX/196 SP) | [VERT/JAUNE/ROUGE] |
| Sprint en cours - completion estimee | [XX]% | [VERT/JAUNE/ROUGE] |
| Budget consomme | [XX] EUR / 308 EUR | [VERT/JAUNE/ROUGE] |
| Bugs critiques ouverts | [XX] | [VERT/JAUNE/ROUGE] |
| Risques actifs | [XX] | [Detail si necessaire] |

---

#### 5.4 Points bloquants / Besoins

| # | Point bloquant ou besoin | Impact | Aide necessaire | Urgence |
|---|-------------------------|--------|----------------|---------|
| 1 | [Description] | [Impact sur le planning/qualite] | [Ce dont vous avez besoin] | Haute/Moyenne/Basse |
| 2 | | | | |

---

#### 5.5 Prochaines echeances

| Echeance | Date | Statut |
|----------|------|--------|
| [Evenement : Sprint Review, livraison, soutenance, etc.] | [JJ/MM] | En bonne voie / A risque |
| | | |

---

## 6. Exemple : Sprint 1 rempli (donnees fictives realistes)

> L'exemple ci-dessous presente un Sprint 1 complet avec des donnees fictives mais realistes, afin d'illustrer concretement l'utilisation des templates.

---

### DASHBOARD SPRINT N1 - MYTHOS

**Sprint** : Sprint 1
**Dates** : 10/03/2026 - 21/03/2026
**Objectif du sprint** : Mettre en place les fondations techniques du projet (architecture, authentification, premiere interface) et livrer un squelette fonctionnel de bout en bout.
**Statut global** : VERT

---

#### Resume du Sprint 1

| Metrique | Valeur |
|----------|--------|
| Objectif du sprint | Fondations techniques + authentification + squelette UI |
| Date de debut | 10/03/2026 |
| Date de fin | 21/03/2026 |
| Nombre de jours ouvrables | 10 |
| Velocite realisee | 24 SP |
| Velocite prevue | 22 SP |
| Ecart de velocite | +2 SP (+9.1%) |
| Tickets planifies | 7 |
| Tickets livres (Done) | 6 |
| Tickets en cours (report sprint suivant) | 1 |
| Taux de completion | 85.7% |

---

#### Burndown Chart - Sprint 1

```
Story Points restants
     |
  22 |o
     | \ o
  18 |  o  \
     |   \  o
  14 |    o  \
     |     \  o
  10 |      *  \
     |       *  o
   6 |        \  *
     |         *  \
   2 |            * o
     |              *
   0 +--+--+--+--+--+--+--+--+--+--+
     J1 J2 J3 J4 J5 J6 J7 J8 J9 J10

Legende: o = courbe ideale, * = courbe reelle
Observation: Leger plateau J3-J5 (ticket d'auth plus complexe que prevu),
puis rattrapage J6-J10. Tendance globale satisfaisante.
```

---

#### Tickets realises vs planifies - Sprint 1

| # | Ticket | Type | SP | Statut | Assignee | Remarque |
|---|--------|------|----|--------|----------|----------|
| 1 | MYTH-001 Setup du projet (monorepo, CI/CD) | Tech | 5 | Done | Sofia | Monorepo Next.js + NestJS 10+ configure |
| 2 | MYTH-002 Modele de donnees (schema BDD) | Tech | 3 | Done | Zahid | PostgreSQL + Prisma ORM |
| 3 | MYTH-003 Inscription / Connexion (auth JWT) | Feature | 5 | Done | Zahid | bcrypt + JWT, tests unitaires OK |
| 4 | MYTH-004 Page d'accueil (landing page) | Feature | 3 | Done | Lucas | Design responsive, Lighthouse 92 |
| 5 | MYTH-005 Page de connexion/inscription (UI) | Feature | 3 | Done | Yasmine | Formulaires accessibles, validation |
| 6 | MYTH-006 Configuration UptimeRobot + monitoring | Tech | 2 | Done | Sofia | 4 moniteurs configures |
| 7 | MYTH-007 Premier appel API IA (prototype) | Feature | 5 | In Progress | Karim | Prompt systeme OK, parsing a finaliser |

**Total SP planifies** : 26 | **Total SP livres** : 21 + 3 SP partiels = **24 SP** | **Taux** : 85.7% (6/7 tickets)

**Note** : Le ticket MYTH-007 a ete estime a 80% de completion. Les 3 SP comptabilises correspondent au travail effectivement livre (prompt systeme fonctionnel, appel API operationnel). Le parsing des reponses IA sera termine au debut du Sprint 2.

**Tickets reportes au sprint suivant** :

| # | Ticket | Raison du report | Avancement estime |
|---|--------|-----------------|-------------------|
| 1 | MYTH-007 Premier appel API IA (prototype) | Parsing des reponses IA plus complexe que prevu (format JSON structure) | 80% |

---

#### KPI du Sprint 1

##### KPI Projet

| KPI | Valeur | Cible | Statut | Tendance |
|-----|--------|-------|--------|----------|
| Velocite | 24 SP | 22 SP (Sprint 1) | VERT | N/A (premier sprint) |
| Taux completion | 85.7% | >= 85% | VERT | N/A |
| Taux de bugs | 14.3% (1/7) | <= 15% | VERT | N/A |
| Lead Time (mediane) | 7j | <= 10j | VERT | N/A |
| Cycle Time (mediane) | 2.5j | <= 3j | VERT | N/A |
| Review Turnaround (med.) | 3h | <= 4h | VERT | N/A |
| SPI | 1.09 (24/22) | >= 0.90 | VERT | N/A |
| CPI | 1.05 | >= 0.90 | VERT | N/A |

##### KPI Produit

| KPI | Valeur | Cible | Statut | Remarque |
|-----|--------|-------|--------|----------|
| Temps reponse IA (P50) | 1850ms | <= 2000ms | VERT | Prototype, a confirmer avec plus de donnees |
| Temps reponse IA (P95) | 4200ms | <= 5000ms | VERT | Quelques pics lies aux cold starts |
| Latence WebSocket (P50) | N/A | <= 100ms | N/A | WebSocket non implemente au Sprint 1 |
| LCP (page accueil) | 2.1s | <= 2.5s | VERT | |
| INP (page accueil) | 120ms | <= 200ms | VERT | |
| CLS (page accueil) | 0.05 | <= 0.1 | VERT | |
| Uptime | 99.8% | >= 99.0% | VERT | 1 incident de 15 min (deploiement) |
| Completion sessions | N/A | >= 80% | N/A | Sessions de jeu non implementees |
| Erreurs API IA | 8.2% | <= 5% | JAUNE | Parsing JSON a ameliorer |
| Couverture tests (BE) | 52% | >= 70% | JAUNE | Focus sur auth, a completer |
| Couverture tests (FE) | 35% | >= 60% | JAUNE | Premiers composants seulement |
| Dette technique | 2 issues | <= 5 | VERT | |

##### KPI Conformite

| KPI | Valeur | Cible | Statut | Remarque |
|-----|--------|-------|--------|----------|
| Lighthouse Accessibility | 92/100 | >= 90 | VERT | Page accueil + page login |
| WAVE (erreurs) | 1 | 0 | JAUNE | 1 erreur de contraste sur le footer |
| Eco-index (accueil) | B (62/100) | A-B | VERT | |
| Poids moyen pages | 380 Ko | <= 500 Ko | VERT | |
| Conformite RGPD | 60% | 100% | JAUNE | 3 traitements sur 5 documentes |

---

#### Bugs decouverts / resolus - Sprint 1

| # | Bug | Severite | Decouvert le | Resolu le | Statut | Temps de resolution |
|---|-----|----------|-------------|-----------|--------|-------------------|
| 1 | MYTH-BUG-001 Token JWT non invalide a la deconnexion | Majeur | 17/03 | 19/03 | Resolu | 2j |
| 2 | MYTH-BUG-002 Erreur 500 si email deja existant a l'inscription | Mineur | 18/03 | 18/03 | Resolu | 0.5j |
| 3 | MYTH-BUG-003 Contraste insuffisant texte footer | Mineur | 20/03 | - | Ouvert | - |

**Resume bugs** :

| Metrique | Sprint 1 |
|----------|---------|
| Bugs ouverts dans le sprint | 3 |
| Bugs resolus dans le sprint | 2 |
| Bugs critiques ouverts (fin sprint) | 0 |
| Bugs totaux ouverts (fin sprint) | 1 |

---

#### Risques actifs et actions - Sprint 1

| # | Risque | Probabilite | Impact | Criticite | Action de mitigation | Responsable | Echeance | Statut |
|---|--------|------------|--------|-----------|---------------------|-------------|----------|--------|
| R1 | Temps de reponse IA trop lent pour une experience de jeu fluide | Moyen | Eleve | Eleve | Implementer le streaming de reponses IA + indicateur de chargement | Karim | Sprint 3 | Ouvert |
| R2 | Budget API IA depasse si utilisation intensive en dev | Moyen | Moyen | Moyen | Utiliser des mocks en dev, limiter les appels reels aux tests d'integration | Zahid | Sprint 2 | Ouvert |
| R3 | Complexite du parsing des reponses IA sous-estimee | Eleve | Moyen | Eleve | Definir un schema JSON strict, ajouter validation + fallback | Karim | Sprint 2 | En cours |

---

#### Budget consomme vs prevu - Sprint 1

| Poste | Budget previsionnel cumule | Depenses reelles cumulees | Ecart | Statut |
|-------|---------------------------|--------------------------|-------|--------|
| API IA (OpenAI) | 15 EUR | 12.50 EUR | -2.50 EUR | VERT |
| Hebergement (Vercel free) | 0 EUR | 0 EUR | 0 EUR | VERT |
| Domaine (mythos.dev) | 12 EUR | 12 EUR | 0 EUR | VERT |
| UptimeRobot (gratuit) | 0 EUR | 0 EUR | 0 EUR | VERT |
| Divers | 5 EUR | 0 EUR | -5 EUR | VERT |
| **TOTAL** | **32 EUR** | **24.50 EUR** | **-7.50 EUR** | **VERT** |

**CPI calcule** : 1.05 | **Budget restant** : 283.50 EUR / 308 EUR | **Projection fin de projet** : ~260 EUR

---

#### Points positifs / Points a ameliorer - Sprint 1

**Points positifs (ce qui a bien fonctionne)** :
- Setup technique rapide et efficace grace a la preparation en amont (choix techno valides)
- Velocite superieure aux attentes pour un premier sprint (24 SP vs 22 prevus)
- Score Lighthouse excellent des les premieres pages (92/100 accessibilite)
- Budget maitrise (en dessous du previsionnel)

**Points a ameliorer** :
- Couverture de tests insuffisante (52% backend, 35% frontend) - a ameliorer des le Sprint 2
- Parsing des reponses IA sous-estime en complexite - besoin de mieux estimer les tickets IA
- Un bug de securite (invalidation JWT) aurait du etre detecte plus tot - ajouter des tests de securite
- Conformite RGPD en retard (60%) - documenter les traitements restants

---

#### Decisions prises durant le Sprint 1

| # | Decision | Contexte | Impact | Prise par | Date |
|---|----------|----------|--------|-----------|------|
| 1 | Utiliser Prisma comme ORM | Plusieurs options evaluees, Prisma offre le meilleur DX avec TypeScript | Standard technique pour tout le projet | Zahid | 11/03 |
| 2 | Format JSON structure pour les reponses IA | Le format texte libre est trop imprevisible pour le parsing | Architecture du service IA | Karim | 14/03 |
| 3 | Deploiement sur Vercel (frontend) + Railway (backend) | Tiers gratuits suffisants pour le MVP, migration possible ulterieurement | Infrastructure et budget | Zahid | 10/03 |

---

#### Actions pour le Sprint 2

| # | Action | Responsable | Priorite | Echeance |
|---|--------|-------------|----------|----------|
| 1 | Finaliser le parsing IA (MYTH-007) et valider le format JSON | Karim | Haute | Debut Sprint 2 |
| 2 | Augmenter la couverture de tests backend a >= 65% | Zahid | Haute | Fin Sprint 2 |
| 3 | Corriger le bug de contraste footer (MYTH-BUG-003) | Yasmine | Moyenne | Sprint 2 |
| 4 | Documenter les 2 traitements RGPD manquants | Zahid | Moyenne | Sprint 2 |
| 5 | Implementer le lobby de creation de partie (Epic E5) | Lucas | Haute | Sprint 2 |

---

### COMPTE-RENDU DE SPRINT REVIEW - SPRINT 1

**Date** : 21/03/2026
**Heure** : 14:00 - 15:00
**Lieu** : Salle de projet / Google Meet

**Participants** :

| Nom | Role | Present |
|-----|------|---------|
| Zahid | PO / Architecte | Oui |
| Yasmine | SM / Frontend | Oui |
| Lucas | Frontend | Oui |
| Karim | IA / Temps reel | Oui |
| Sofia | UX / DevOps | Oui |
| [Encadrant] | Partie prenante / Tuteur | Oui |

---

#### Demonstration des fonctionnalites livrees

| # | Fonctionnalite / Ticket | Demo realisee | Acceptation PO | Commentaires / Feedback |
|---|------------------------|--------------|----------------|------------------------|
| 1 | MYTH-001 Setup du projet (monorepo) | Oui | Accepte | Structure claire, CI GitHub Actions operationnelle |
| 2 | MYTH-002 Modele de donnees | Oui | Accepte | Schema valide, migrations fonctionnelles |
| 3 | MYTH-003 Auth JWT | Oui | Accepte | Inscription + connexion demoontrees, token dans localStorage |
| 4 | MYTH-004 Landing page | Oui | Accepte avec reserves | Design a affiner (couleurs, typographie), contenu a etoffer |
| 5 | MYTH-005 Pages login/signup | Oui | Accepte | Validation des champs fonctionnelle, UX fluide |
| 6 | MYTH-006 UptimeRobot | Oui | Accepte | Dashboard de monitoring accessible |

**Nombre de fonctionnalites acceptees** : 5 / 6 presentees (1 avec reserves)
**Nombre de fonctionnalites refusees** : 0
**Nombre de fonctionnalites avec reserves** : 1 (MYTH-004 - design a affiner)

**Feedback de l'encadrant** :
- "Bon demarrage, les fondations sont solides."
- "La page d'accueil merite plus de travail visuel pour donner envie de jouer."
- "Attention a la couverture de tests, il faut prendre l'habitude de tester des maintenant."

---

### COMPTE-RENDU DE RETROSPECTIVE - SPRINT 1

**Date** : 21/03/2026
**Heure** : 15:15 - 16:00
**Facilitateur** : Yasmine (SM)

**Participants** :

| Nom | Role | Present |
|-----|------|---------|
| Zahid | PO / Architecte | Oui |
| Yasmine | SM / Frontend | Oui |
| Lucas | Frontend | Oui |
| Karim | IA / Temps reel | Oui |
| Sofia | UX / DevOps | Oui |

**Note** : La retrospective est un moment d'equipe. Les parties prenantes externes ne participent pas.

---

#### Rappel du contexte du Sprint 1

| Metrique | Valeur |
|----------|--------|
| Velocite realisee | 24 SP / 22 SP prevus |
| Taux de completion | 85.7% |
| Bugs decouverts | 3 (dont 0 critiques) |
| Sentiment general (1-5) | 4/5 |

---

#### Format Start / Stop / Continue

##### START

| # | Proposition | Priorite | Action decidee | Responsable |
|---|-------------|----------|---------------|-------------|
| 1 | Ecrire les tests en meme temps que le code (TDD light) | Haute | Pour chaque nouveau ticket, ecrire au minimum les tests des cas nominaux avant le code | Zahid |
| 2 | Faire un audit Lighthouse systematique avant chaque merge | Moyenne | Ajouter un check Lighthouse dans la CI ou avant chaque PR | Zahid |
| 3 | Documenter les traitements RGPD en meme temps que le dev des features | Moyenne | Ajouter un item "RGPD" dans la Definition of Done | Zahid |

##### STOP

| # | Proposition | Priorite | Action decidee | Responsable |
|---|-------------|----------|---------------|-------------|
| 1 | Sous-estimer la complexite des tickets IA | Haute | Ajouter systematiquement un buffer de +2 SP sur les tickets lies a l'IA | Zahid |
| 2 | Reporter les corrections de bugs mineurs | Moyenne | Corriger les bugs mineurs dans la journee quand c'est possible | Zahid |

##### CONTINUE

| # | Proposition | Remarque |
|---|-------------|----------|
| 1 | Commits atomiques et PR bien decrites | Facilite la relecture et le suivi |
| 2 | Utilisation active de GitHub Projects pour le suivi | Board bien maintenu, transitions de statut a jour |
| 3 | Tests manuels rigoureux avant merge | Aucun bug critique, bonne qualite globale |

---

#### Actions decidees pour le Sprint 2

| # | Action | Responsable | Critere de succes | Suivi prevu |
|---|--------|-------------|-------------------|-------------|
| 1 | Ecrire les tests en meme temps que le code | Zahid | Couverture backend >= 65% en fin de Sprint 2 | Retro Sprint 2 |
| 2 | Ajouter buffer +2 SP sur les tickets IA | Zahid | Pas de report de ticket IA au Sprint 3 | Retro Sprint 2 |
| 3 | Documenter RGPD en continu (ajout a la DoD) | Zahid | Conformite RGPD >= 80% en fin de Sprint 2 | Retro Sprint 2 |

---

#### Note d'ambiance

**Moral** : 4/5
**Confiance pour le Sprint 2** : Eleve
**Commentaire** : Premier sprint tres positif, la velocite est au-dessus des attentes. Les fondations sont solides. Le principal defi pour la suite sera le module IA (parsing, streaming) et le passage au multijoueur (WebSocket). L'enjeu du Sprint 2 est de maintenir cette dynamique tout en ameliorant la couverture de tests et la conformite RGPD.

---

### RAPPORT D'AVANCEMENT HEBDOMADAIRE - SEMAINE 1

**Semaine** : S11 (du 10/03 au 14/03/2026)
**Sprint en cours** : Sprint 1 - Semaine 1/2
**Redacteur** : Zahid

---

#### Resume executif

Le Sprint 1 a demarre conformement au plan. L'architecture technique (monorepo, CI/CD, BDD) est en place. Le systeme d'authentification est fonctionnel. Aucun point bloquant a ce stade.

---

#### Avancement de la semaine

**Travail realise cette semaine** :
- Setup complet du monorepo (Next.js + Express + Prisma) avec CI GitHub Actions (MYTH-001)
- Creation du schema de base de donnees et des migrations Prisma (MYTH-002)
- Implementation de l'authentification JWT (inscription + connexion) avec tests unitaires (MYTH-003 - en cours)

**Travail prevu la semaine prochaine** :
- Finaliser l'authentification (MYTH-003) et les tests associes
- Developper la page d'accueil responsive (MYTH-004)
- Developper les pages de connexion/inscription (MYTH-005)
- Configurer UptimeRobot (MYTH-006)
- Commencer le prototype d'appel API IA (MYTH-007)

---

#### Indicateurs cles

| Indicateur | Valeur | Statut |
|-----------|--------|--------|
| Avancement global | 6% (11/196 SP livres - estimation mi-sprint) | VERT |
| Sprint en cours - completion estimee | 45% (3.5 tickets sur 7 en cours/done) | VERT |
| Budget consomme | 12 EUR / 200 EUR | VERT |
| Bugs critiques ouverts | 0 | VERT |
| Risques actifs | 1 (complexite IA) | Sous surveillance |

---

#### Points bloquants / Besoins

| # | Point bloquant ou besoin | Impact | Aide necessaire | Urgence |
|---|-------------------------|--------|----------------|---------|
| - | Aucun point bloquant cette semaine | - | - | - |

---

#### Prochaines echeances

| Echeance | Date | Statut |
|----------|------|--------|
| Fin du Sprint 1 | 21/03/2026 | En bonne voie |
| Sprint 1 Review | 21/03/2026 14h | Planifiee |
| Sprint 1 Retrospective | 21/03/2026 15h15 | Planifiee |
| Sprint 2 Planning | 24/03/2026 | Planifie |

---

### RAPPORT D'AVANCEMENT HEBDOMADAIRE - SEMAINE 2

**Semaine** : S12 (du 17/03 au 21/03/2026)
**Sprint en cours** : Sprint 1 - Semaine 2/2
**Redacteur** : Zahid

---

#### Resume executif

Le Sprint 1 se termine avec un bilan positif : 24 SP livres sur 22 prevus (109%), 6 tickets sur 7 completes. Un ticket (prototype IA) est reporte a 80% de completion. La Sprint Review et la Retrospective ont eu lieu. Le Sprint 2 est pret a demarrer.

---

#### Avancement de la semaine

**Travail realise cette semaine** :
- Finalisation de l'authentification JWT avec invalidation et tests (MYTH-003 - Done)
- Page d'accueil responsive avec score Lighthouse 92 (MYTH-004 - Done)
- Pages connexion/inscription avec validation (MYTH-005 - Done)
- Configuration UptimeRobot (4 moniteurs) (MYTH-006 - Done)
- Prototype API IA : prompt systeme et appel fonctionnels, parsing en cours (MYTH-007 - 80%)
- Correction de 2 bugs (invalidation JWT, erreur 500 inscription)

**Travail prevu la semaine prochaine (Sprint 2 - Semaine 1)** :
- Finaliser MYTH-007 (parsing IA)
- Commencer le lobby de creation de partie
- Implementer la logique de session de jeu (backend)
- Augmenter la couverture de tests

---

#### Indicateurs cles

| Indicateur | Valeur | Statut |
|-----------|--------|--------|
| Avancement global | 12.2% (24/196 SP) | VERT |
| Sprint 1 - completion | 85.7% (6/7 tickets Done) | VERT |
| Budget consomme | 24.50 EUR / 200 EUR | VERT |
| Bugs critiques ouverts | 0 | VERT |
| Risques actifs | 3 | Sous surveillance |

---

#### Points bloquants / Besoins

| # | Point bloquant ou besoin | Impact | Aide necessaire | Urgence |
|---|-------------------------|--------|----------------|---------|
| 1 | Format des reponses IA imprevisible | Retard sur le ticket IA (reporte) | Aucune aide externe necessaire, a resoudre en interne | Moyenne |

---

#### Prochaines echeances

| Echeance | Date | Statut |
|----------|------|--------|
| Sprint 2 Planning | 24/03/2026 | Planifie |
| Fin du Sprint 2 | 04/04/2026 | - |
| Sprint 2 Review | 04/04/2026 | Planifiee |

---

*Document genere le 09/02/2026 - Projet MYTHOS*
*Prochaine revision prevue : debut du Sprint 1*
