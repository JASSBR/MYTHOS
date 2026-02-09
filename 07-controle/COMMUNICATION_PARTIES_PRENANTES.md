# Plan de Communication avec les Parties Prenantes -- Projet MYTHOS

> **Projet** : MYTHOS -- Plateforme de jeux narratifs multijoueur avec IA Maitre du Jeu
> **Entreprise** : Mythos Interactive (SAS)
> **Version** : 1.0
> **Date** : 06 Mars 2026
> **Competence RNCP** : C1.7 -- Supervision et controle du projet
> **Methodologie** : Scrum (Agile) -- 7 sprints de 2 semaines (14 semaines)

La communication est un facteur cle pour notre projet. Ce plan a ete elabore par Kays (chef de projet) avec les retours de Samy (Scrum Master) qui facilite les ceremonies et fait le lien entre l'equipe et les parties prenantes. On a choisi chaque canal et chaque frequence de communication pour rester transparents sans surcharger l'equipe. Au debut on communiquait un peu dans tous les sens sur Discord, donc on a rapidement structure les canaux -- ca a fait une vraie difference.

---

## Table des matieres

1. [Identification des parties prenantes](#1-identification-des-parties-prenantes)
2. [Plan de communication detaille](#2-plan-de-communication-detaille)
3. [Journal de bord d'equipe](#3-journal-de-bord-dequipe)
4. [Gestion des conflits](#4-gestion-des-conflits)
5. [Preparation de la soutenance](#5-preparation-de-la-soutenance)

---

## 1. Identification des parties prenantes

### 1.1 Matrice pouvoir / interet (Power/Interest Grid)

```
                        INTERET
            Faible                    Eleve
         ┌────────────────┬────────────────────────┐
         │                │                        │
  Eleve  │   SATISFAIRE   │    GERER DE PRES       │
         │                │                        │
         │                │  ★ Encadrant           │
 POUVOIR │                │    academique          │
         │                │                        │
         │                │  ★ Jury de             │
         │                │    soutenance          │
         │                │                        │
         ├────────────────┼────────────────────────┤
         │                │                        │
  Faible │   SURVEILLER   │    TENIR INFORME       │
         │   (effort min) │                        │
         │                │  ★ Client fictif       │
         │                │    (Mythos Interactive) │
         │                │                        │
         │                │  ★ Equipe de           │
         │                │    developpement       │
         │                │                        │
         └────────────────┴────────────────────────┘
```

**Explication du positionnement :**

| Partie prenante | Pouvoir | Interet | Quadrant | Justification |
|-----------------|---------|---------|----------|---------------|
| **Encadrant academique** | Eleve | Eleve | Gerer de pres | Evalue le travail (note RNCP), guide le projet, a le pouvoir de reorienter les decisions |
| **Jury de soutenance** | Eleve | Eleve | Gerer de pres | Decide de la validation du bloc RNCP ; interet concentre au moment de la soutenance mais influence majeure sur la reussite |
| **Client fictif (Mythos Interactive)** | Faible | Eleve | Tenir informe | Commanditaire fictif du projet ; definit les besoins mais n'a pas de pouvoir reel sur l'evaluation academique |
| **Equipe de developpement** | Faible | Eleve | Tenir informe | Executent le projet, fortement investis ; pouvoir limite aux decisions techniques quotidiennes |

---

### 1.2 Fiches des parties prenantes

#### Partie prenante 1 : Client fictif -- Mythos Interactive

| Attribut | Detail |
|----------|--------|
| **Nom / Role** | Mythos Interactive (SAS fictive) -- Commanditaire du projet |
| **Representant** | Directeur produit (role joue par le PO ou un encadrant) |
| **Attentes** | - Livraison d'un MVP fonctionnel avec 2 scenarios jouables (TRIBUNAL + DEEP) |
| | - Plateforme stable, performante et accessible |
| | - Sessions multijoueur fluides (latence < 200ms, IA < 5s) |
| | - Respect du budget (environ 300 EUR pour le MVP, budget total 308 EUR) |
| | - Respect du calendrier (14 semaines) |
| | - Rapports d'avancement reguliers |
| **Niveau d'influence** | Moyen (definit les besoins, mais pas d'evaluation academique) |
| **Niveau d'interet** | Eleve (fortement interesse par le produit final) |
| **Strategie de communication** | Tenir informe -- Communications regulieres, impliquer dans les Sprint Reviews |
| **Canal privilegie** | Sprint Review (demo bi-hebdomadaire) + compte-rendu ecrit (Notion) |
| **Frequence** | Bi-hebdomadaire (Sprint Review) + ponctuel (COPIL mensuel) |
| **Ton** | Professionnel, oriente resultats et valeur business |
| **Points de vigilance** | - Ne pas surcharger d'informations techniques |
| | - Presenter les livrables en termes de valeur utilisateur |
| | - Anticiper les changements de perimetre et les communiquer clairement |

#### Partie prenante 2 : Encadrant academique

| Attribut | Detail |
|----------|--------|
| **Nom / Role** | Encadrant pedagogique -- Superviseur du projet academique |
| **Attentes** | - Respect de la methodologie Scrum |
| | - Couverture des 7 competences RNCP C1.1 a C1.7 |
| | - Production de livrables de qualite (CDC, plan projet, KPI, supervision) |
| | - Progression reguliere et mesurable de l'equipe |
| | - Capacite de l'equipe a gerer les problemes et a s'adapter |
| | - Maturite professionnelle dans la gestion de projet |
| **Niveau d'influence** | Eleve (evalue le travail, peut reorienter les decisions) |
| **Niveau d'interet** | Eleve (suivi continu du projet) |
| **Strategie de communication** | Gerer de pres -- Communications proactives, transparence totale |
| **Canal privilegie** | Rapport d'avancement hebdomadaire (Notion) + Sprint Review + COPIL |
| **Frequence** | Hebdomadaire (rapport) + bi-hebdomadaire (Sprint Review) + mensuel (COPIL) |
| **Ton** | Pedagogique, transparent, montrant la maitrise du cadre de gestion de projet |
| **Points de vigilance** | - Etre transparent sur les difficultes (ne pas cacher les problemes) |
| | - Montrer la capacite d'adaptation et de resolution |
| | - Mettre en evidence les competences RNCP dans chaque communication |
| | - Documenter les ecarts prevu/realise et les justifier |

#### Partie prenante 3 : Jury de soutenance

| Attribut | Detail |
|----------|--------|
| **Nom / Role** | Jury de soutenance -- Evaluateurs RNCP Bloc 1 |
| **Attentes** | - Demonstration de la maitrise des competences C1.1 a C1.7 |
| | - Livrables complets et professionnels |
| | - Capacite a defendre les choix techniques et methodologiques |
| | - Preuve de la mise en oeuvre reelle du plan de projet |
| | - Analyse critique et retour d'experience |
| | - Presentation claire, structuree et dans le temps imparti |
| **Niveau d'influence** | Tres eleve (decide de la validation RNCP) |
| **Niveau d'interet** | Eleve (concentre au moment de la soutenance) |
| **Strategie de communication** | Gerer de pres -- Preparer minutieusement chaque interaction |
| **Canal privilegie** | Presentation orale (collective 10 min + individuelle 20 min) + dossier ecrit |
| **Frequence** | Ponctuel (soutenance en fin de projet) |
| **Ton** | Formel, professionnel, structure, confiant |
| **Points de vigilance** | - Chaque slide doit mapper a une competence RNCP |
| | - Preparer des preuves concretes (captures d'ecran, metriques, extraits de livrables) |
| | - Anticiper les questions du jury |
| | - Montrer les ecarts prevu/realise et ce qu'on en a appris |

#### Partie prenante 4 : Equipe de developpement

| Attribut | Detail |
|----------|--------|
| **Nom / Role** | Equipe de developpement MYTHOS (4 membres) |
| **Attentes** | - Objectifs de sprint clairs et atteignables |
| | - Specifications et maquettes disponibles avant le developpement |
| | - Communication fluide et transparente |
| | - Feedback regulier sur le travail livre |
| | - Environnement de travail bienveillant et collaboratif |
| | - Decisions partagees sur les choix techniques |
| **Niveau d'influence** | Faible (decisions techniques quotidiennes, pas d'evaluation) |
| **Niveau d'interet** | Tres eleve (impliques a 100% dans le projet) |
| **Strategie de communication** | Tenir informe -- Communications constantes, canal ouvert |
| **Canal privilegie** | Discord (quotidien) + GitHub (code) + Notion (documentation) |
| **Frequence** | Continue (daily standup + chat Discord) |
| **Ton** | Direct, collaboratif, bienveillant |
| **Points de vigilance** | - Eviter la surcharge d'information (canal dedie par sujet) |
| | - S'assurer que les blocages sont traites rapidement |
| | - Celebrer les succes (feature livree, sprint reussi) |
| | - Encourager l'expression des difficultes |

---

## 2. Plan de communication detaille

### 2.1 Matrice de communication

| Quoi | De qui | A qui | Quand | Comment | Pourquoi | Livrable |
|------|--------|-------|-------|---------|----------|----------|
| Daily standup async | Chaque dev | Equipe | Quotidien (avant 10h) | Discord `#daily-standup` | Synchronisation, detection des blocages | Message template |
| Rapport d'avancement hebdomadaire | Scrum Master | Encadrant academique | Chaque vendredi | Notion (page partagee) | Visibilite sur l'avancement, risques, KPI | Rapport template |
| Sprint Planning | Scrum Master anime, PO priorise | Equipe | Debut de sprint (lundi) | Discord vocal | Definir le contenu du sprint | Sprint Backlog |
| Sprint Review (demo) | PO anime, devs presentent | Equipe + encadrant + client | Fin de sprint (vendredi) | Discord vocal + partage ecran | Demo, feedback, validation des stories | Compte-rendu Review |
| Retrospective | Scrum Master anime | Equipe uniquement | Fin de sprint (vendredi, apres Review) | Discord vocal | Amelioration continue du processus | CR Retro + actions |
| Rapport de cloture de sprint | Scrum Master | Equipe + encadrant | Fin de sprint | Notion | Bilan complet du sprint | Rapport template |
| Comite de pilotage (COPIL) | PO anime | PO + SM + encadrant + client | Mensuel | Visioconference | Revue strategique, decisions majeures | CR COPIL |
| Tech Review | Architecte anime | Equipe technique | Hebdomadaire (mercredi) | Discord vocal | Revue technique, PRs, dette technique | Notes techniques |
| Notification de risque | PO ou SM | PO + encadrant | Sur evenement | Discord `#alertes-prod` + Notion | Alerte rapide sur un risque critique | Fiche de risque |
| Annonce de changement de perimetre | PO | Toutes les parties prenantes | Sur evenement | Notion + Discord | Transparence sur les modifications du MVP | Note de changement |
| Alerte de production | Automatise ou DevOps | Equipe | Sur evenement | Discord `#alertes-prod` | Reaction rapide aux incidents | Message d'alerte |
| Rapport final de projet | PO + SM | Jury + encadrant | Fin de projet | Document PDF + Notion | Support pour la soutenance | Dossier final |

---

### 2.2 Calendrier de communication (14 semaines)

```
Sem 1  │ Sprint 0 │ Planning 0 │ Daily │ Tech Rev │ Daily │ Rapport hebdo
Sem 2  │ Sprint 0 │ Daily      │ Tech Rev │ Daily  │ Review 0 + Retro 0 + Rapport hebdo
       │          │            │          │        │
Sem 3  │ Sprint 1 │ Planning 1 │ Daily │ Tech Rev │ Daily │ Rapport hebdo
Sem 4  │ Sprint 1 │ Daily      │ Tech Rev │ ★COPIL1│ Review 1 + Retro 1 + Rapport hebdo
       │          │            │          │        │
Sem 5  │ Sprint 2 │ Planning 2 │ Daily │ Tech Rev │ Daily │ Rapport hebdo
Sem 6  │ Sprint 2 │ Daily      │ Tech Rev │ Daily  │ Review 2 + Retro 2 + Rapport hebdo
       │          │            │          │        │
Sem 7  │ Sprint 3 │ Planning 3 │ Daily │ Tech Rev │ Daily │ Rapport hebdo
Sem 8  │ Sprint 3 │ Daily      │ Tech Rev │ ★COPIL2│ Review 3 + Retro 3 + Rapport hebdo
       │          │            │          │        │
Sem 9  │ Sprint 4 │ Planning 4 │ Daily │ Tech Rev │ Daily │ Rapport hebdo
Sem 10 │ Sprint 4 │ Daily      │ Tech Rev │ Daily  │ Review 4 + Retro 4 + Rapport hebdo
       │          │            │          │        │
Sem 11 │ Sprint 5 │ Planning 5 │ Daily │ Tech Rev │ Daily │ Rapport hebdo
Sem 12 │ Sprint 5 │ Daily      │ Tech Rev │ ★COPIL3│ Review 5 + Retro 5 + Rapport hebdo
       │          │            │          │        │
Sem 13 │ Buffer   │ Planning B │ Daily │ Tech Rev │ Daily │ Rapport hebdo
Sem 14 │ Buffer   │ Daily      │ Tech Rev │★COPIL F│ Review F + Retro F + RAPPORT FINAL
       │          │            │          │        │ ★ Preparation soutenance
```

**Legende :**
- Daily = Daily standup asynchrone (Discord, chaque jour ouvrable)
- Tech Rev = Point technique hebdomadaire (mercredi)
- Planning = Sprint Planning (lundi matin, debut de sprint)
- Review = Sprint Review / Demo (vendredi PM, fin de sprint)
- Retro = Retrospective (vendredi PM, apres la Review)
- COPIL = Comite de pilotage (mensuel, semaines 4, 8, 12, 14)
- Rapport hebdo = Rapport d'avancement hebdomadaire (vendredi, Notion)

**Nombre total de communications planifiees sur 14 semaines :**

| Type | Nombre |
|------|--------|
| Daily standups asynchrones | ~70 (5/semaine x 14 semaines) |
| Rapports hebdomadaires | 14 |
| Sprint Plannings | 7 |
| Sprint Reviews | 7 |
| Retrospectives | 7 |
| COPIL | 4 |
| Tech Reviews | 14 |
| **Total** | **~123 communications planifiees** |

---

### 2.3 Templates de communication

#### 2.3.1 Rapport d'avancement hebdomadaire (destinataire : encadrant academique)

```markdown
# Rapport d'avancement hebdomadaire -- Projet MYTHOS

**Semaine** : [Numero] (du JJ/MM au JJ/MM/AAAA)
**Sprint en cours** : Sprint [X] -- [Nom du sprint]
**Redige par** : [Scrum Master] | **Valide par** : [Product Owner]
**Date** : JJ/MM/AAAA

---

## 1. Synthese

**Etat global du projet** : [Sur la bonne voie / Attention requise / En difficulte]

[Resume en 2-3 phrases de l'etat du projet cette semaine.]

---

## 2. Avancement du sprint

| Indicateur | Valeur |
|------------|--------|
| **Objectif du sprint** | [Objectif formule au Sprint Planning] |
| **Story Points prevus** | [X] SP |
| **Story Points livres** | [X] SP |
| **Taux de completion** | [X]% |
| **Stories Done** | [X] / [X] total |
| **Stories In Progress** | [X] |
| **Stories To Do** | [X] |

**Burndown chart :**
[Capture d'ecran du burndown chart GitHub Projects]

---

## 3. Realisations de la semaine

| Story / Ticket | Responsable | Statut | Commentaire |
|----------------|-------------|--------|-------------|
| [S3-05] Page lobby | [Membre 3] | Done | Lobby fonctionnel avec chat en temps reel |
| [S3-06] Game UI | [Membre 3] | In Progress (60%) | Composants Narration et Choice termines |
| [S3-03] WS + Game Loop | [Membre 4] | In Progress (80%) | Integration quasi-complete, reste les private_messages |

---

## 4. Previsions pour la semaine prochaine

- [ ] [Tache 1 prevue]
- [ ] [Tache 2 prevue]
- [ ] [Tache 3 prevue]

---

## 5. Blocages et risques actifs

| ID | Description | Severite | Impact | Action en cours | Responsable | Statut |
|----|-------------|----------|--------|-----------------|-------------|--------|
| R2 | Incoherence narrative IA | Majeur | Qualite du gameplay | Tests approfondis des prompts | Membre 4 | En cours |
| PB-003 | Timer Safari mobile | Mineur | UX sur 15% des utilisateurs | Investigation en cours | Membre 3 | Ouvert |

---

## 6. Metriques cles

| KPI | Cible | Reel | Tendance |
|-----|-------|------|----------|
| Velocite (sprint en cours) | [X] SP | [X] SP | [Hausse/Stable/Baisse] |
| Couverture tests (backend) | > 60% | [X]% | [Hausse/Stable/Baisse] |
| Couverture tests (frontend) | > 40% | [X]% | [Hausse/Stable/Baisse] |
| Temps reponse IA (P95) | < 5s | [X]s | [Hausse/Stable/Baisse] |
| Taux erreur IA | < 5% | [X]% | [Hausse/Stable/Baisse] |
| Budget API IA (mois en cours) | < 80 EUR | [X] EUR | [Hausse/Stable/Baisse] |

---

## 7. Budget

| Poste | Prevu (mois) | Consomme | Ecart |
|-------|-------------|----------|-------|
| API IA (Anthropic) | [X] EUR | [X] EUR | [+/- X%] |
| Hebergement (Railway) | [X] EUR | [X] EUR | [+/- X%] |
| Autres | [X] EUR | [X] EUR | [+/- X%] |

---

## 8. Decisions a prendre / Questions pour l'encadrant

1. [Question ou point de decision necessitant l'avis de l'encadrant]
2. [Autre point]

---

**Prochain jalon** : [Sprint Review X -- JJ/MM/AAAA]
```

---

#### 2.3.2 Compte-rendu de Sprint Review (destinataire : client fictif + encadrant)

```markdown
# Compte-rendu Sprint Review -- Projet MYTHOS

**Sprint** : Sprint [X] -- [Nom du sprint]
**Date** : JJ/MM/AAAA
**Participants** : [Liste des participants]
**Anime par** : [Product Owner]
**Duree** : [X] minutes

---

## 1. Objectif du sprint

[Rappel de l'objectif defini au Sprint Planning]

**Objectif atteint** : [Oui / Partiellement / Non]

---

## 2. Fonctionnalites demontrees

### Fonctionnalite 1 : [Nom]
- **Story** : [ID et titre]
- **Description** : [Ce qui a ete developpe]
- **Demo** : [Description de la demo effectuee]
- **Statut** : [Accepte / A revoir / Refuse]
- **Capture d'ecran** : [Si applicable]

### Fonctionnalite 2 : [Nom]
- **Story** : [ID et titre]
- **Description** : [Ce qui a ete developpe]
- **Demo** : [Description de la demo effectuee]
- **Statut** : [Accepte / A revoir / Refuse]

[Repeter pour chaque fonctionnalite demontree]

---

## 3. Metriques du sprint

| Indicateur | Valeur |
|------------|--------|
| Story Points prevus | [X] SP |
| Story Points livres | [X] SP |
| Taux de completion | [X]% |
| Velocite | [X] SP (vs [X] SP sprint precedent) |
| Stories acceptees | [X] / [X] |
| Stories reportees | [X] (raison : ___) |
| Bugs decouverts | [X] (dont [X] critiques) |

---

## 4. Feedback recueilli

| Source | Feedback | Action prevue |
|--------|----------|---------------|
| [Client / Encadrant] | [Feedback verbatim] | [Action a entreprendre] |
| [Client / Encadrant] | [Feedback verbatim] | [Action a entreprendre] |

---

## 5. Stories non livrees et raisons

| Story | Raison du report | Replanifie au sprint |
|-------|-----------------|---------------------|
| [ID] | [Raison] | Sprint [X+1] |

---

## 6. Prochaines etapes

- Sprint [X+1] : [Objectif du prochain sprint]
- Prochain Sprint Planning : [Date]
- Prochaine Sprint Review : [Date]

---

## 7. Decisions prises

| Decision | Decideur | Impact |
|----------|----------|--------|
| [Decision 1] | [PO / Equipe / Encadrant] | [Impact sur le projet] |

---

**Redige par** : [Scrum Master]
**Valide par** : [Product Owner]
```

---

#### 2.3.3 Daily standup asynchrone (destinataire : equipe)

```markdown
## Daily Standup - [Prenom] - [JJ/MM/AAAA]

**Hier j'ai :**
- [Tache terminee ou avancee avec ticket reference]
- [Autre tache]

**Aujourd'hui je vais :**
- [Tache prevue avec ticket reference]
- [Autre tache]

**Blocages / Besoins :**
- [Description du blocage] --> @mention
- Aucun blocage

**Ticket(s) en cours :** [ID-XX, ID-YY]
**Progression estimee :** [X]%
```

**Regles :**
- Poste avant **10h00** dans le canal Discord `#daily-standup`
- Format strict (copier-coller le template)
- Pas de discussion dans ce canal (utiliser `#general` ou `#tech`)
- Le Scrum Master relance a 10h15 si un message manque

---

#### 2.3.4 Notification de risque (destinataire : PO + encadrant)

```markdown
# Notification de risque -- Projet MYTHOS

**Date** : JJ/MM/AAAA
**Emetteur** : [Nom et role]
**Severite** : [Critique / Majeur / Modere]
**Urgence** : [Action immediate requise / A traiter sous 48h / Information]

---

## Risque identifie

**Description** : [Description claire et factuelle du risque]

**Probabilite** : [Elevee / Moyenne / Faible]
**Impact** : [Eleve / Moyen / Faible]

---

## Impact potentiel

- **Sur le planning** : [Impact decrit]
- **Sur le budget** : [Impact decrit]
- **Sur la qualite** : [Impact decrit]
- **Sur le perimetre** : [Impact decrit]

---

## Propositions d'action

| Option | Description | Cout / Effort | Recommandation |
|--------|-------------|---------------|----------------|
| A | [Option A] | [Effort] | [Recommande / Alternative] |
| B | [Option B] | [Effort] | [Recommande / Alternative] |

---

## Decision attendue

[Decrire la decision que le PO ou l'encadrant doit prendre, et le delai souhaite]

---

**Prochaine action** : [Ce qui se passe en attendant la decision]
**Suivi** : [Prochain point de suivi prevu]
```

---

#### 2.3.5 Annonce de changement de perimetre (destinataire : toutes les parties prenantes)

```markdown
# Annonce de changement de perimetre -- Projet MYTHOS

**Date** : JJ/MM/AAAA
**Reference** : CHG-[XXX]
**Emetteur** : [Product Owner]
**Statut** : [Propose / Approuve / Rejete]

---

## 1. Description du changement

**Changement propose** : [Description claire du changement]

**Origine** : [Pourquoi ce changement est necessaire]
- [ ] Retard de planning
- [ ] Depassement de budget
- [ ] Complexite technique sous-estimee
- [ ] Feedback client / encadrant
- [ ] Risque materialise
- [ ] Autre : ___

---

## 2. Analyse d'impact

| Dimension | Impact | Detail |
|-----------|--------|--------|
| **Planning** | [Nul / Faible / Moyen / Fort] | [Detail de l'impact sur le calendrier] |
| **Budget** | [Nul / Faible / Moyen / Fort] | [Detail de l'impact financier] |
| **Qualite** | [Nul / Faible / Moyen / Fort] | [Detail de l'impact sur la qualite] |
| **Perimetre** | [Nul / Faible / Moyen / Fort] | [Fonctionnalites ajoutees/retirees] |
| **Equipe** | [Nul / Faible / Moyen / Fort] | [Impact sur la charge de travail] |

---

## 3. Stories impactees

| Story | Action | Justification |
|-------|--------|---------------|
| [ID] | [Ajoutee / Retiree / Modifiee / Reportee] | [Raison] |

---

## 4. Decision

**Decide par** : [Nom et role]
**Date de decision** : JJ/MM/AAAA
**Decision** : [Approuve / Rejete / Reporte]
**Justification** : [Raison de la decision]

---

## 5. Communication

| Partie prenante | Informee le | Canal | Par |
|-----------------|-------------|-------|-----|
| Client fictif | JJ/MM | [Canal] | PO |
| Encadrant | JJ/MM | [Canal] | SM |
| Equipe | JJ/MM | Discord | SM |

---

**Document archive dans** : Notion > Projet MYTHOS > Changements de perimetre
```

---

#### 2.3.6 Rapport de cloture de sprint (destinataire : equipe + encadrant)

```markdown
# Rapport de cloture de sprint -- Projet MYTHOS

**Sprint** : Sprint [X] -- [Nom du sprint]
**Periode** : Du JJ/MM au JJ/MM/AAAA
**Redige par** : [Scrum Master]

---

## 1. Objectif du sprint

**Objectif defini** : [Objectif formule au Sprint Planning]
**Objectif atteint** : [Oui / Partiellement / Non]
**Justification** : [Explication si partiellement ou non atteint]

---

## 2. Bilan quantitatif

| Indicateur | Prevu | Realise | Ecart |
|------------|-------|---------|-------|
| Story Points | [X] | [X] | [+/- X] |
| Stories completees | [X] | [X] | [+/- X] |
| Bugs ouverts en debut de sprint | [X] | - | - |
| Bugs ouverts en fin de sprint | - | [X] | - |
| Bugs resolus | - | [X] | - |
| PRs mergees | - | [X] | - |
| Couverture tests (back) | [X]% | [X]% | [+/- X%] |
| Couverture tests (front) | [X]% | [X]% | [+/- X%] |

---

## 3. Stories livrees

| ID | Titre | SP | Assignee | Statut | Notes |
|----|-------|----|----------|--------|-------|
| [S3-01] | [Titre] | [X] | [Membre] | Done | [Note] |
| [S3-02] | [Titre] | [X] | [Membre] | Done | [Note] |

---

## 4. Stories non livrees

| ID | Titre | SP | Raison | Replanifie |
|----|-------|----|--------|-----------|
| [S3-07] | [Titre] | [X] | [Raison du report] | Sprint [X+1] |

---

## 5. Velocite

```
Sprint 0:  ████████████████████░░░  21 SP
Sprint 1:  ██████████████████████████  26 SP
Sprint 2:  ██████████████████████████████████  34 SP  <-- sprint en cours
Sprint 3:  ██████████████████████████████████  34 SP (prevu)
```

**Tendance** : [Croissante / Stable / Decroissante]
**Commentaire** : [Analyse de la tendance]

---

## 6. Risques actualises

| ID | Risque | Statut | Commentaire |
|----|--------|--------|-------------|
| R1 | Latence IA | Sous controle | P95 a 4.2s apres optimisation |
| R2 | Incoherence narrative | Actif | 2 cas identifies, prompts ameliores |

---

## 7. KPI produit (si applicable)

| KPI | Cible | Valeur actuelle | Commentaire |
|-----|-------|-----------------|-------------|
| Temps reponse IA (P95) | < 5s | [X]s | [Commentaire] |
| Taux erreur IA | < 5% | [X]% | [Commentaire] |
| Uptime | > 95% | [X]% | [Commentaire] |

---

## 8. Budget du sprint

| Poste | Prevu | Consomme | Ecart |
|-------|-------|----------|-------|
| API IA | [X] EUR | [X] EUR | [+/- X%] |
| Hebergement | [X] EUR | [X] EUR | [+/- X%] |

---

## 9. Retrospective -- Resume

**Start** :
- [Action a commencer]

**Stop** :
- [Action a arreter]

**Continue** :
- [Action a maintenir]

**Actions d'amelioration pour le prochain sprint** :

| Action | Responsable | Deadline |
|--------|-------------|----------|
| [Action 1] | [Membre] | [Date] |
| [Action 2] | [Membre] | [Date] |

---

## 10. Prochaines etapes

- Sprint [X+1] debute le [date]
- Objectif prevu : [Objectif]
- Sprint Planning le [date] a [heure]
```

---

#### 2.3.7 Rapport final de projet (destinataire : jury de soutenance)

```markdown
# Rapport final de projet -- MYTHOS

**Plateforme de jeux narratifs multijoueur avec IA Maitre du Jeu**

**Equipe** : Kays ZAHIDI, Samy ZEROUALI, Youri EMMANUEL, Yassir SABBAR
**Entreprise** : Mythos Interactive (SAS)
**Date** : Mai 2026
**Contexte** : Workshop 5A TL -- S1 -- Bloc 1 RNCP38822

---

## 1. Presentation du projet

### 1.1 Contexte et objectifs
[Resume du contexte, de la problematique, et des objectifs du projet]

### 1.2 Perimetre du MVP
[Description du perimetre livre]

### 1.3 Equipe et organisation
[Presentation de l'equipe, des roles, de la methodologie Scrum]

---

## 2. Bilan de realisation

### 2.1 Fonctionnalites livrees

| Fonctionnalite | Statut | Sprint | Commentaire |
|----------------|--------|--------|-------------|
| Moteur de jeu universel (6 phases) | Livre | Sprint 2 | Fonctionnel pour les 2 scenarios |
| Scenario TRIBUNAL | Livre | Sprint 3 | Jouable de bout en bout |
| Scenario DEEP (jauges) | Livre | Sprint 4 | Jouable avec jauges fonctionnelles |
| Multijoueur temps reel | Livre | Sprint 3 | WebSocket + reconnexion |
| IA Maitre du Jeu | Livre | Sprint 1-4 | Strategie duale Haiku/Sonnet |
| [etc.] | | | |

### 2.2 Fonctionnalites non livrees et raisons

| Fonctionnalite | Raison | Impact | Alternative |
|----------------|--------|--------|-------------|
| [Feature X] | [Raison] | [Impact] | [Ce qui a ete fait a la place] |

---

## 3. Bilan methodologique

### 3.1 Suivi Scrum

| Sprint | Velocite prevue | Velocite reelle | Taux completion | Commentaire |
|--------|----------------|----------------|-----------------|-------------|
| Sprint 0 | 21 SP | [X] SP | [X]% | [Commentaire] |
| Sprint 1 | 26 SP | [X] SP | [X]% | [Commentaire] |
| [etc.] | | | | |

### 3.2 Burndown chart global
[Graphique ou capture d'ecran]

### 3.3 Ceremonies Scrum realisees
[Nombre et regularity des Sprint Plannings, Reviews, Retros, Dailies]

---

## 4. Bilan technique

### 4.1 Architecture deployee
[Schema d'architecture en production]

### 4.2 KPI techniques

| KPI | Cible | Reel | Commentaire |
|-----|-------|------|-------------|
| Temps reponse IA (P95) | < 5s | [X]s | |
| Latence WebSocket (P95) | < 200ms | [X]ms | |
| Couverture tests (back) | > 60% | [X]% | |
| Couverture tests (front) | > 40% | [X]% | |
| Score Lighthouse (perf) | > 80 | [X] | |
| Score Lighthouse (a11y) | > 90 | [X] | |
| Eco-index | > 50 | [X] | |
| Uptime | > 95% | [X]% | |

### 4.3 Dette technique identifiee
[Liste de la dette technique residuelle et plan de resolution propose]

---

## 5. Bilan financier

| Poste | Budget prevu | Depense reelle | Ecart |
|-------|-------------|----------------|-------|
| API IA (Anthropic) | [X] EUR | [X] EUR | [+/- X%] |
| Hebergement | [X] EUR | [X] EUR | [+/- X%] |
| Outils | 0 EUR | 0 EUR | 0% |
| **Total** | **[X] EUR** | **[X] EUR** | **[+/- X%]** |

---

## 6. Bilan des risques

| Risque | Statut final | Actions prises | Resultat |
|--------|-------------|----------------|----------|
| R1 - Latence IA | Mitige | Streaming + cache + strategie duale | P95 a [X]s |
| R2 - Incoherence narrative | Mitige | Prompts ameliores + game_state complet | [X]% d'incoherences |
| [etc.] | | | |

---

## 7. Ecarts prevu / realise

### 7.1 Planning
[Comparaison planning prevu vs realise, jalons respectes et depasses]

### 7.2 Perimetre
[Fonctionnalites ajoutees/retirees par rapport au CDC initial]

### 7.3 Qualite
[Niveau de qualite atteint vs objectif]

---

## 8. Lecons apprises

### 8.1 Ce qui a bien fonctionne
- [Point 1]
- [Point 2]

### 8.2 Ce qui aurait pu etre ameliore
- [Point 1]
- [Point 2]

### 8.3 Recommandations pour la V2
- [Recommandation 1]
- [Recommandation 2]

---

## 9. Conformite reglementaire

### 9.1 RGPD
[Bilan de conformite]

### 9.2 Accessibilite (WCAG 2.1 AA)
[Resultats d'audit]

### 9.3 Eco-conception
[Scores eco-index et actions menees]

---

## 10. Mapping competences RNCP

| Competence | Livrable(s) de preuve | Section du rapport |
|------------|----------------------|-------------------|
| C1.1 - Faisabilite | Etude de faisabilite, analyse des risques | Sections 2, 6 |
| C1.2 - Veille | Plan de veille, analyse concurrentielle | CDC Section 3 |
| C1.3 - Architecture | CDC technique, specs, a11y, eco-conception | CDC Sections 4-6, Section 9 |
| C1.4 - Planification | Backlog, planning sprints, budget | CDC Section 8, Section 3, 5 |
| C1.5 - Risques | Matrice des risques, plan de mitigation | CDC Section 7, Section 6 |
| C1.6 - KPI | Tableau de bord KPI, metriques | CDC Section 9, Section 4 |
| C1.7 - Supervision | Plan de supervision, communication, ajustements | Documents 07-controle |

---

## Annexes

- Lien vers le repository GitHub
- Lien vers le deploiement en production
- Lien vers la video de demonstration
- Lien vers les maquettes Figma
- Lien vers le Notion (journal de bord)
- Lien vers GitHub Projects (backlog)
```

---

## 3. Journal de bord d'equipe

### 3.1 Structure du journal de bord (Notion)

Le journal de bord est heberge dans Notion. Kays a mis en place la structure pendant le Sprint 0 et on l'a ajustee apres les deux premieres semaines quand on s'est rendu compte qu'il manquait une section dediee aux risques et aux post-mortems. Voici la structure actuelle :

```
Notion > Projet MYTHOS > Journal de bord
│
├── Vue d'ensemble (page principale)
│   ├── Liens rapides (GitHub, Vercel, Railway, Figma, Discord)
│   ├── Calendrier des sprints
│   └── Indicateurs cles en temps reel
│
├── Sprints
│   ├── Sprint 0 -- Cadrage & Setup
│   │   ├── Sprint Planning (CR)
│   │   ├── Sprint Review (CR)
│   │   ├── Retrospective (CR)
│   │   ├── Rapport de cloture
│   │   └── Semaine 1 / Semaine 2 (entrees journal)
│   ├── Sprint 1 -- Fondations + POC IA
│   │   └── [meme structure]
│   ├── Sprint 2 -- Game Engine Core
│   │   └── [meme structure]
│   ├── [...]
│   └── Sprint Buffer -- Finalisation
│       └── [meme structure]
│
├── Reunions
│   ├── COPIL (comptes-rendus)
│   ├── Tech Reviews (notes)
│   └── Reunions adhoc
│
├── Risques et problemes
│   ├── Registre des risques (tableau)
│   ├── Registre des problemes (tableau)
│   └── Post-mortems
│
├── Changements de perimetre
│   └── [Fiches de changement]
│
├── Veille technologique
│   └── [Notes de veille hebdomadaires]
│
└── Soutenance
    ├── Slides collective
    ├── Notes individuelles
    └── Checklist de preparation
```

---

### 3.2 Template de compte-rendu de reunion

```markdown
# Compte-rendu de reunion -- Projet MYTHOS

**Type** : [Sprint Planning / Sprint Review / Retrospective / COPIL / Tech Review / Adhoc]
**Date** : JJ/MM/AAAA
**Heure** : HH:MM -- HH:MM
**Lieu** : Discord vocal / [Autre]
**Anime par** : [Nom]

---

## Participants

| Nom | Role | Present |
|-----|------|---------|
| Kays ZAHIDI | PO / Architecte | Oui / Non |
| Samy ZEROUALI | SM / Dev Frontend | Oui / Non |
| Youri EMMANUEL | Dev Frontend | Oui / Non |
| Samy ZEROUALI | Dev IA / Temps reel | Oui / Non |
| Yassir SABBAR | UX/UI / DevOps | Oui / Non |
| [Encadrant] | Encadrant academique | Oui / Non |
| [Client fictif] | Client | Oui / Non |

---

## Ordre du jour

1. [Point 1]
2. [Point 2]
3. [Point 3]

---

## Discussions et decisions

### Point 1 : [Titre]

**Discussion** : [Resume des echanges]

**Decision** : [Decision prise, si applicable]

**Vote** : [Resultat du vote, si applicable]

### Point 2 : [Titre]

[Meme structure]

---

## Actions a mener

| ID | Action | Responsable | Deadline | Statut |
|----|--------|-------------|----------|--------|
| A-001 | [Description de l'action] | [Membre X] | JJ/MM/AAAA | A faire |
| A-002 | [Description de l'action] | [Membre Y] | JJ/MM/AAAA | A faire |

---

## Points reportes

- [Point non traite, reporte a la prochaine reunion]

---

## Prochaine reunion

**Type** : [Type]
**Date** : JJ/MM/AAAA a HH:MM
**Ordre du jour prevu** : [Si connu]

---

**Redige par** : [Nom]
**Relu par** : [Nom]
```

---

### 3.3 Template de retrospective (Start/Stop/Continue)

```markdown
# Retrospective Sprint [X] -- Projet MYTHOS

**Date** : JJ/MM/AAAA
**Anime par** : [Scrum Master]
**Participants** : [Liste des presents]
**Duree** : [X] minutes

---

## 1. Revue des actions du sprint precedent

| Action decidee (Sprint [X-1]) | Responsable | Statut |
|-------------------------------|-------------|--------|
| [Action 1] | [Membre] | Fait / Pas fait / En cours |
| [Action 2] | [Membre] | Fait / Pas fait / En cours |

---

## 2. Collecte individuelle

### Kays ZAHIDI (PO)
- **Start** : [Ce qu'on devrait commencer]
- **Stop** : [Ce qu'on devrait arreter]
- **Continue** : [Ce qui fonctionne bien]

### Samy ZEROUALI (SM)
- **Start** : [...]
- **Stop** : [...]
- **Continue** : [...]

### Youri EMMANUEL (Frontend)
- **Start** : [...]
- **Stop** : [...]
- **Continue** : [...]

### Samy ZEROUALI (IA)
- **Start** : [...]
- **Stop** : [...]
- **Continue** : [...]

### Yassir SABBAR (DevOps)
- **Start** : [...]
- **Stop** : [...]
- **Continue** : [...]

---

## 3. Themes regroupes

| Theme | Categorie | Nombre de mentions | Votes |
|-------|-----------|-------------------|-------|
| [Theme 1 : ex. "Communication des specs en retard"] | Start | 3 | ★★★★ |
| [Theme 2 : ex. "PRs trop grosses"] | Stop | 2 | ★★★ |
| [Theme 3 : ex. "Pair programming efficace"] | Continue | 4 | ★★★★★ |
| [Theme 4 : ex. "Daily standup trop long"] | Stop | 1 | ★ |

---

## 4. Plan d'action pour le Sprint [X+1]

| Priorite | Action | Responsable | Critere de succes | Deadline |
|----------|--------|-------------|-------------------|----------|
| 1 | [Action 1] | [Membre] | [Comment savoir si c'est fait] | [Date] |
| 2 | [Action 2] | [Membre] | [Comment savoir si c'est fait] | [Date] |
| 3 | [Action 3] | [Membre] | [Comment savoir si c'est fait] | [Date] |

---

## 5. Metrique d'equipe -- Moral

Chaque membre attribue une note de 1 a 5 a son moral pour ce sprint :

| Membre | Moral (1-5) | Commentaire |
|--------|:-----------:|-------------|
| Kays ZAHIDI | [X] | [Optionnel] |
| Samy ZEROUALI | [X] | [Optionnel] |
| Youri EMMANUEL | [X] | [Optionnel] |
| Samy ZEROUALI | [X] | [Optionnel] |
| Yassir SABBAR | [X] | [Optionnel] |
| **Moyenne** | **[X.X]** | |

---

**Archive dans** : Notion > Projet MYTHOS > Journal de bord > Sprint [X] > Retrospective
```

---

### 3.4 Exemple de journal de bord rempli -- Semaine type (Semaine 7 / Sprint 3)

```markdown
# Journal de bord -- Semaine 7 (Sprint 3, semaine 1)
## Du 16/03/2026 au 20/03/2026

---

### Lundi 16/03/2026

**Evenement** : Sprint Planning 3

**Resume** : L'equipe s'est reunie pour planifier le Sprint 3. L'objectif est de rendre le
scenario TRIBUNAL jouable de bout en bout en multijoueur. 34 SP ont ete selectionnes.

**Decisions prises** :
- Priorite absolue : WebSocket Gateway (S3-01) et Session Manager (S3-02) doivent etre
  termines avant mercredi pour debloquer le reste de l'equipe
- Samy commence par le WebSocket Gateway pendant que Youri avance sur la page lobby
  (mock des donnees en attendant le backend)
- Kays valide les specs de l'API Session avant 17h

**Daily standups** :
- Kays : Preparation des specs Session Manager + validation Scenario Pack TRIBUNAL
- Samy : Configuration du board Sprint 3 + aide Youri sur le layout lobby
- Youri : Debut composant page lobby (mockee) + integration maquettes Figma
- Samy : Debut WebSocket Gateway NestJS + Socket.io setup
- Yassir : Finalisation pipeline CI/CD + ajout du lint WebSocket

**Blocages** : Aucun

---

### Mardi 17/03/2026

**Daily standups** :
- Kays : Specs Session Manager terminees. Revue PR S3-01 (WS Gateway) en cours
- Samy : Aide sur le CSS du lobby. Commence les metriques du burndown Sprint 3
- Youri : Page lobby 70% terminee (liste joueurs, chat mock). Bloque sur le format
  des evenements WS --> besoin de la doc de Samy
- Samy : WebSocket Gateway fonctionnel (connexion + auth JWT). PR S3-01 ouverte.
  Documente les evenements WS dans le README
- Yassir : Tests du pipeline CI avec les tests WebSocket. Alerte : le build timeout
  sur les tests Socket.io (probleme de port)

**Blocages** :
- Youri bloque sur le format des evenements WS : resolu a 14h apres sync avec Samy
- Yassir : timeout CI sur les tests WS --> workaround : augmentation du timeout Jest a 30s

**Decisions** : Le format des evenements WS est fige et documente dans `docs/websocket-events.md`

---

### Mercredi 18/03/2026

**Evenement** : Tech Review hebdomadaire (15h-15h30)

**Discussion tech** :
- PR S3-01 (WS Gateway) revue et mergee. Bonne qualite, 2 commentaires mineurs corriges
- Discussion sur la gestion de la reconnexion : decision d'utiliser le `session_id` en cookie
  pour permettre la reconnexion sans re-authentification
- Alerte sur la taille du game_state envoye a l'IA : atteint 3000 tokens au tour 3.
  Decision : implementer un resume automatique du game_state (max 2000 tokens)

**Daily standups** :
- Kays : Review PR S3-01 Done. Commence la review PR S3-02
- Samy : Burndown a jour. Point rapide avec Youri sur le composant ChoicePanel
- Youri : Page lobby quasi terminee (90%). Commence l'integration WebSocket reelle
  (remplacement des mocks). Premier test avec 2 onglets : les joueurs se voient dans le lobby !
- Samy : Session Manager (S3-02) presque termine. PR ouverte. Debut S3-03 (WS + Game Loop)
- Yassir : CI stabilisee. Debut du composant NarrationPanel (aide Youri)

**Moment cle** : Premier test temps reel reussi ! 2 onglets connectes, les joueurs apparaissent
dans le lobby en temps reel. Euphorie dans l'equipe.

---

### Jeudi 19/03/2026

**Daily standups** :
- Kays : PR S3-02 approuvee et mergee. Travail sur les Scenario Packs : ajustement
  des prompts TRIBUNAL apres 3 parties de test. Probleme : PB-001 (personnage mort reapparait)
- Samy : Suivi des metriques. Aide Youri sur l'animation du timer
- Youri : Integration WS sur le lobby terminee (Done !). Commence la Game UI (S3-06)
  Composant NarrationPanel avec effet de streaming
- Samy : S3-03 en cours (connexion Game Loop + WebSocket). Complexe : la gestion des
  phases en temps reel necessite un refactoring du Game Loop Manager. Estimation revisee : +1 jour
- Yassir : Aide sur le composant DiscussionPanel. Configuration UptimeRobot pour le monitoring

**Blocages** :
- PB-001 detecte : l'IA regenere un personnage elimine au tour 2 comme temoin au tour 4
  --> Assigne a Samy, analyse 5 Pourquoi lancee (voir registre des problemes)
- Samy signale un retard de 1 jour sur S3-03 : la gestion des transitions de phases via WS
  est plus complexe que prevu

**Decision** : Appliquer le scenario d'ajustement "Retard leger" : Kays aide Samy
sur l'integration WS pendant 1 journee (pair programming)

---

### Vendredi 20/03/2026

**Daily standups** :
- Kays : Preparation de la demo Sprint Review (pas de Review cette semaine, c'est la
  semaine 1 du sprint). Correction du Scenario Pack TRIBUNAL suite a PB-001
- Kays : Aide Samy sur l'integration WS (pair programming matin). Redaction du
  rapport hebdomadaire l'apres-midi
- Youri : Game UI en cours (50%). NarrationPanel + ChoicePanel fonctionnels.
  Reste : DiscussionPanel, PrivateInfoPanel, PhaseIndicator
- Samy : S3-03 avance bien grace a l'aide de Kays. Les phases Narration et Action
  emettent correctement les evenements WS. Reste : Resolution, Discussion, Finale
- Yassir : UptimeRobot configure. Monitoring en place. Aide sur les composants UI mineurs

**Rapport hebdomadaire envoye** : Sprint 3 en bonne voie malgre le retard de 1 jour sur S3-03.
PB-001 identifie et en cours de resolution. 60% des SP du sprint couverts a mi-sprint.

**Metriques de la semaine** :
- PRs mergees : 4 (S3-01, S3-02, fix CI, composant lobby)
- Couverture tests backend : 52% (cible : 60%)
- Cout API IA cette semaine : 12 EUR (tests prompts TRIBUNAL)
- Moral equipe : 4.2/5 (motivation haute apres le premier test temps reel reussi)

---

### Bilan de la semaine

**Ce qui va bien** :
- Premier test multijoueur temps reel reussi (moment fort de motivation)
- WebSocket Gateway et Session Manager livres dans les temps
- Collaboration efficace entre Membre 2 et Membre 4 (pair programming productif)

**Points d'attention** :
- PB-001 (incoherence IA) a traiter en priorite la semaine prochaine
- S3-03 en retard de 1 jour (integation WS + Game Loop complexe)
- Couverture de tests a 52%, en dessous de la cible de 60%

**Priorites semaine prochaine** :
1. Terminer S3-03 (Game Loop + WS) -- Membre 4
2. Resoudre PB-001 (incoherence narrative) -- Membre 4
3. Terminer la Game UI (S3-06) -- Membre 3
4. Preparer le test E2E TRIBUNAL (S3-07) -- Equipe
5. Sprint Review et Retrospective vendredi -- Equipe
```

---

## 4. Gestion des conflits

### 4.1 Types de conflits possibles

| Type | Description | Exemples MYTHOS | Frequence estimee |
|------|-------------|-----------------|-------------------|
| **Technique** | Desaccord sur un choix technique, une architecture, une implementation | - "On devrait utiliser Redux au lieu de Zustand" | Frequente |
| | | - "Le Game State devrait etre en PostgreSQL, pas en Redis" | |
| | | - "Les prompts IA sont trop longs, il faut les raccourcir" | |
| | | - Desaccord sur la structure du Scenario Pack JSON | |
| **Organisationnel** | Desaccord sur le planning, les priorites, la repartition des taches | - "Cette story devrait etre dans ce sprint, pas le suivant" | Moderee |
| | | - "J'ai trop de taches assignees par rapport aux autres" | |
| | | - "Le daily a 10h, c'est trop tot / trop tard" | |
| | | - "On passe trop de temps en reunion, pas assez a coder" | |
| **Interpersonnel** | Tension entre membres, probleme de communication, frustration | - "Il ne repond jamais a mes messages Discord" | Rare |
| | | - "Ses PRs sont toujours bacles et je dois tout refaire en review" | |
| | | - "Il impose ses decisions sans consulter l'equipe" | |
| | | - "Il ne fait pas son daily standup et ca bloque ma visibilite" | |
| **De perimetre** | Desaccord entre les attentes du client et les capacites de l'equipe | - "Le client veut un 3eme scenario mais on n'a pas le temps" | Rare |
| | | - "L'encadrant demande plus de documentation, l'equipe veut coder" | |

---

### 4.2 Processus de resolution des conflits

```
┌─────────────────────────┐
│  1. DETECTION            │
│  - Via daily standup     │
│  - Via retrospective     │
│  - Via signalement       │
│    direct au SM          │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐
│  2. ECOUTE               │
│  Le SM ecoute les deux   │
│  parties separement      │
│  (entretien 1:1, 10 min) │
│  Objectif : comprendre   │
│  le point de vue de      │
│  chacun sans juger       │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐     ┌─────────────────────────┐
│  3. MEDIATION            │     │  Conflit technique ?     │
│  Le SM organise un       │     │  --> Decision basee sur  │
│  echange structure       │────>│  des criteres objectifs  │
│  entre les parties       │     │  (benchmark, POC, vote)  │
│  (discussion facilitee)  │     └─────────────────────────┘
│                          │
│  Regles :                │     ┌─────────────────────────┐
│  - Chacun s'exprime      │     │  Conflit organisationnel?│
│    sans interruption     │────>│  --> Ajustement du       │
│  - Focus sur les faits,  │     │  processus en retro      │
│    pas les personnes     │     └─────────────────────────┘
│  - Chercher la solution, │
│    pas le coupable       │     ┌─────────────────────────┐
│                          │     │  Conflit interpersonnel? │
│                          │────>│  --> Mediation + accord  │
│                          │     │  sur les regles de       │
└────────────┬────────────┘     │  communication           │
             │                   └─────────────────────────┘
             │ Si non resolu
             ▼
┌─────────────────────────┐
│  4. ESCALADE             │
│  Le SM escalade vers     │
│  l'encadrant academique  │
│  qui joue le role        │
│  d'arbitre externe       │
│                          │
│  L'encadrant :           │
│  - Ecoute les parties    │
│  - Propose une solution  │
│  - Tranche si necessaire │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐
│  5. SUIVI                │
│  - L'accord est documente│
│  - Un point de suivi est │
│    prevu sous 1 semaine  │
│  - Le sujet est aborde   │
│    en retrospective      │
└─────────────────────────┘
```

---

### 4.3 Principes de communication non-violente (CNV) appliques

La Communication Non-Violente (methode Marshall Rosenberg) est le cadre de reference pour toutes les interactions de l'equipe, particulierement en cas de conflit.

#### Les 4 etapes de la CNV

| Etape | Principe | Exemple MYTHOS (mauvais) | Exemple MYTHOS (CNV) |
|-------|----------|--------------------------|---------------------|
| **1. Observation** | Decrire les faits sans juger ni interpreter | "Tu ne fais jamais tes PRs correctement" | "J'ai remarque que les 3 dernieres PRs contenaient des tests manquants" |
| **2. Sentiment** | Exprimer ce que l'on ressent (pas ce que l'on pense de l'autre) | "Tu me fais perdre mon temps" | "Je me sens frustre quand je dois faire les tests a ta place" |
| **3. Besoin** | Exprimer le besoin non satisfait | "Tu devrais mieux travailler" | "J'ai besoin que les PRs respectent la Definition of Done pour maintenir la qualite" |
| **4. Demande** | Formuler une demande concrete et realisable | "Fais un effort" | "Est-ce que tu pourrais verifier la checklist de PR avant de soumettre ? On pourrait aussi faire un pair programming si tu as besoin d'aide sur les tests" |

#### Regles de communication de l'equipe MYTHOS

1. **Pas de blame** : On critique les processus et les artefacts, jamais les personnes.
2. **Feedback constructif** : Chaque critique est accompagnee d'une proposition d'amelioration.
3. **Transparence** : Les difficultes sont partagees, pas cachees. Demander de l'aide est un signe de maturite, pas de faiblesse.
4. **Ecoute active** : En reunion, chacun s'exprime sans interruption. Le SM s'assure que tout le monde a la parole.
5. **Asynchrone respectueux** : Sur Discord, repondre sous 2h pendant les heures de travail. Utiliser les reactions emoji pour accuser reception.
6. **Celebration des succes** : Chaque feature livree, chaque sprint reussi est celebre (message dans `#general`).

---

## 5. Preparation de la soutenance

### 5.1 Plan de la presentation collective (10 minutes, non notee)

> La presentation collective a pour objectif de presenter le projet dans sa globalite. Elle n'est pas notee individuellement mais contribue a la comprehension du contexte par le jury.

#### Structure slide par slide

| Slide | Titre | Contenu | Duree | Presentateur |
|-------|-------|---------|-------|-------------|
| 1 | Page de titre | Logo MYTHOS, nom du projet, equipe, date, contexte RNCP | 15s | PO |
| 2 | Le probleme | Gap sur le marche : aucune plateforme ne combine IA + multijoueur + narration + sessions courtes. Stats du marche gaming narratif. | 45s | PO |
| 3 | La solution : MYTHOS | Concept : plateforme de jeux narratifs multijoueur avec IA Maitre du Jeu. Moteur universel + Scenario Packs. Schema visuel. | 1 min | PO |
| 4 | Les scenarios | Presentation de TRIBUNAL et DEEP avec visuels des maquettes. Pitch de chaque scenario en 1 phrase. | 45s | Dev IA |
| 5 | Architecture technique | Schema d'architecture (frontend, backend, IA, temps reel, BDD). Stack technique en un coup d'oeil. | 1 min | Architecte |
| 6 | Methodologie | Scrum, 7 sprints de 2 semaines, outils (GitHub Projects, Discord, Notion). Photo du board Kanban. | 45s | SM |
| 7 | Demo en direct | Demonstration du MVP : creation d'une session, lobby, 2-3 tours de TRIBUNAL ou DEEP. | 3 min | Dev Frontend + Dev IA |
| 8 | Bilan et chiffres cles | KPI : velocite, couverture tests, uptime, score accessibilite, eco-index. Planning prevu vs realise. | 1 min | SM |
| 9 | Lecons apprises | 3 lecons cles du projet (1 technique, 1 organisationnelle, 1 humaine). Ce qu'on referait differemment. | 45s | PO |
| 10 | Merci + questions | Remerciements, liens (repo, demo, video). Ouverture pour les questions. | 15s | PO |

**Total** : ~10 minutes

---

### 5.2 Plan de la presentation individuelle (20 minutes, notee RNCP)

> Chaque candidat presente individuellement pendant 20 minutes. La presentation doit demontrer la maitrise des competences C1.1 a C1.7 du bloc RNCP38822. Le jury evalue chaque competence.

#### Structure de la presentation individuelle (mapping C1.1 a C1.7)

| Partie | Competence RNCP | Contenu | Duree | Preuves a montrer |
|--------|----------------|---------|-------|-------------------|
| 1. Introduction | - | Presentation du projet (rappel bref), mon role dans l'equipe, plan de la presentation | 1 min | Slide de titre + role |
| 2. Etude de faisabilite | **C1.1** | Comment j'ai analyse la faisabilite technique (stack, competences, PoC IA), organisationnelle (capacite equipe, contraintes), et financiere (budget). Analyse des risques. | 3 min | CDC Section 2 + matrice des risques |
| 3. Veille technologique | **C1.2** | Le plan de veille mis en place (outils, frequence, organisation). Resultats concrets : choix Claude vs GPT-4, choix Socket.io vs alternatives, strategie duale LLM. | 2 min | CDC Section 3 + notes de veille (Notion) |
| 4. Conception technique | **C1.3** | Architecture logicielle choisie et justifiee. Specifications fonctionnelles (user stories, features). Accessibilite (WCAG 2.1 AA). Eco-conception (strategie duale IA, eco-index). | 3 min | CDC Sections 4-6 + schema architecture + rapport Lighthouse + rapport eco-index |
| 5. Planification | **C1.4** | Methode de planification (Scrum, sprints, MoSCoW). Le backlog detaille et comment il a ete construit. Budget previsionnel. Planning prevu vs realise. | 3 min | Backlog GitHub Projects + planning Gantt/timeline + budget |
| 6. Gestion des risques | **C1.5** | Matrice des risques initiale. Comment les risques ont ete suivis et mitige. Exemples concrets : risque R1 (latence IA), risque R2 (incoherence narrative). Risques materialises et actions prises. | 2 min | Matrice des risques + registre des risques + actions |
| 7. Indicateurs de suivi (KPI) | **C1.6** | Les KPI definis (projet, produit, conformite). Le tableau de bord. Evolution des KPI au fil des sprints. Ecarts et actions correctives. | 2 min | Tableau de bord KPI + burndown charts + metriques IA |
| 8. Supervision et controle | **C1.7** | Le cadre de supervision mis en place. Les instances de pilotage. Le processus de resolution de problemes (5 Pourquoi, Ishikawa). Les ajustements effectues. La communication avec les parties prenantes. | 3 min | Plan de supervision + registre des problemes + registre des ajustements + rapports hebdomadaires |
| 9. Conclusion | - | Bilan personnel. Ce que j'ai appris. Ce que je referais differemment. Remerciements. | 1 min | - |

**Total** : ~20 minutes

---

### 5.3 Checklist de preparation soutenance

#### 2 semaines avant la soutenance

- [ ] Tous les livrables sont rediges et finalises
- [ ] Le CDC est dans sa version finale (relecture complete)
- [ ] Le journal de bord est complet (toutes les semaines renseignees)
- [ ] Les rapports hebdomadaires sont tous archives dans Notion
- [ ] Les comptes-rendus de Sprint Review et Retro sont tous rediges
- [ ] Le registre des risques est a jour
- [ ] Le registre des problemes est a jour
- [ ] Le registre des ajustements est a jour
- [ ] Le rapport final de projet est redige
- [ ] Le retour d'experience individuel est redige (2-3 pages)

#### 1 semaine avant la soutenance

- [ ] Les slides de la presentation collective sont terminees
- [ ] Les slides de la presentation individuelle sont terminees
- [ ] La demo est preparee et testee (scenario de demo predefined, pas d'improvisation)
- [ ] Un plan B est prevu si la demo echoue (video de backup, captures d'ecran)
- [ ] Chaque membre a identifie ses preuves/livrables pour chaque competence RNCP
- [ ] Les captures d'ecran cles sont preparees (GitHub Projects, Notion, monitoring, etc.)
- [ ] Le mapping competence <-> preuve <-> slide est complet (voir matrice ci-dessous)

#### 3 jours avant la soutenance

- [ ] Repetition collective effectuee (chrono respecte : 10 minutes)
- [ ] Repetition individuelle effectuee par chaque membre (chrono respecte : 20 minutes)
- [ ] Les transitions entre les slides sont fluides
- [ ] Le materiel est teste (ordinateur, projecteur, connexion internet pour la demo)
- [ ] Les questions potentielles du jury sont anticipees (voir section 5.5)

#### Le jour de la soutenance

- [ ] Arriver 15 minutes en avance
- [ ] Tester le materiel (connexion, projecteur, son)
- [ ] Avoir le lien de la demo pret (URL de production)
- [ ] Avoir la video de backup accessible (YouTube ou local)
- [ ] Avoir les livrables imprimes ou accessibles rapidement (CDC, rapports)
- [ ] Respirer, se concentrer, presenter avec confiance

---

### 5.4 Conseils pour chaque competence RNCP

#### C1.1 -- Analyser la faisabilite d'un projet

| Aspect | Ce que le jury attend | Pieges a eviter |
|--------|----------------------|-----------------|
| **Faisabilite technique** | Analyse structuree de la stack, des competences de l'equipe, des contraintes techniques. PoC comme preuve. | - Ne pas se contenter de lister les technologies |
| | | - Ne pas oublier l'analyse des competences de l'equipe |
| | | - Ne pas ignorer les contraintes (latence IA, cout API) |
| **Faisabilite organisationnelle** | Capacite de l'equipe, planning realiste, contraintes (cours, examens). | - Ne pas surestimer la capacite de l'equipe |
| | | - Ne pas oublier les contraintes academiques |
| **Faisabilite financiere** | Budget realiste, ROI hypothetique, couts maitrises. | - Ne pas presenter un budget irealiste |
| | | - Ne pas oublier les couts caches (API IA, hebergement) |
| **Risques** | Matrice des risques avec probabilite, impact, criticite, et plan de mitigation. | - Ne pas lister des risques generiques sans lien avec le projet |
| | | - Ne pas oublier les actions de mitigation concretes |

#### C1.2 -- Realiser une veille technologique

| Aspect | Ce que le jury attend | Pieges a eviter |
|--------|----------------------|-----------------|
| **Plan de veille** | Outils, sources, frequence, organisation (rotation, synthese). | - Ne pas se limiter a "j'ai cherche sur Google" |
| | | - Montrer un plan structure et continu |
| **Analyse concurrentielle** | Benchmark des concurrents avec forces/faiblesses et positionnement. | - Ne pas faire un simple tableau sans analyse |
| | | - Montrer comment la veille a influence les choix |
| **Apports concrets** | Innovations integrees au projet grace a la veille (streaming IA, structured output, etc.). | - Ne pas dire "la veille n'a rien apporte" |
| | | - Avoir des exemples precis avec dates et sources |

#### C1.3 -- Concevoir l'architecture logicielle

| Aspect | Ce que le jury attend | Pieges a eviter |
|--------|----------------------|-----------------|
| **Architecture** | Schema clair, composants identifies, flux de donnees, choix justifies. | - Ne pas presenter un schema trop complexe ou illisible |
| | | - Justifier chaque choix technique (pourquoi NestJS et pas Express ?) |
| **Specifications** | User stories, features, criteres d'acceptation. | - Ne pas se contenter de lister des features sans priorisation |
| **Accessibilite** | Conformite WCAG 2.1 AA, adaptations specifiques au projet. | - Ne pas oublier l'accessibilite ou la traiter superficiellement |
| | | - Avoir des preuves (rapport Lighthouse, captures WAVE) |
| **Eco-conception** | Mesures concretes de reduction d'impact environnemental. | - Ne pas se contenter de "on a fait du lazy loading" |
| | | - Avoir des metriques (eco-index, poids des pages) |

#### C1.4 -- Planifier le projet

| Aspect | Ce que le jury attend | Pieges a eviter |
|--------|----------------------|-----------------|
| **Methodologie** | Justification du choix de Scrum, adaptation au contexte. | - Ne pas reciter la theorie Scrum sans montrer la pratique |
| **Backlog** | Backlog detaille, priorise (MoSCoW), estime (story points). | - Ne pas presenter un backlog trop generique |
| | | - Montrer le backlog reel (capture GitHub Projects) |
| **Planning** | Timeline realiste, sprints bien decoupes, jalons. | - Ne pas presenter un planning ideal sans les ajustements reels |
| | | - Montrer le planning prevu ET realise |
| **Budget** | Budget previsionnel detaille et suivi reel. | - Ne pas oublier le suivi budgetaire reel |

#### C1.5 -- Gerer les risques

| Aspect | Ce que le jury attend | Pieges a eviter |
|--------|----------------------|-----------------|
| **Identification** | Risques specifiques au projet, pas generiques. | - Ne pas lister "risque de retard" sans contexte |
| **Evaluation** | Probabilite x Impact = Criticite. Matrice visuelle. | - Ne pas mettre tous les risques au meme niveau |
| **Mitigation** | Plan d'action concret pour chaque risque critique. | - Ne pas lister des actions vagues |
| **Suivi** | Evolution des risques au fil du projet. Risques materialises et gestion. | - Ne pas presenter la matrice initiale sans montrer son evolution |
| | | - Montrer un risque qui s'est materialise et comment il a ete gere |

#### C1.6 -- Definir des indicateurs de suivi

| Aspect | Ce que le jury attend | Pieges a eviter |
|--------|----------------------|-----------------|
| **Definition** | KPI pertinents, mesurables, avec cibles et seuils. | - Ne pas definir des KPI qu'on ne mesure pas |
| **Mesure** | Outils de mesure concrets, automatises si possible. | - Ne pas presenter des KPI sans donnees reelles |
| **Analyse** | Evolution des KPI au fil des sprints, interpretation, actions. | - Ne pas se contenter de montrer des chiffres sans analyse |
| | | - Montrer un KPI qui a decline et l'action corrective prise |
| **Tableau de bord** | Dashboard synthetique et visuel. | - Ne pas presenter un tableau illisible |

#### C1.7 -- Superviser et controler le projet

| Aspect | Ce que le jury attend | Pieges a eviter |
|--------|----------------------|-----------------|
| **Processus de suivi** | Dailies, rapports hebdomadaires, Sprint Reviews documentes. | - Ne pas dire "on faisait des reunions" sans preuves |
| | | - Montrer les CR de reunion, les rapports, les dailies |
| **Resolution de problemes** | Methode formalisee (5 Pourquoi, Ishikawa), registre des problemes. | - Ne pas se contenter de dire "on a resolu les bugs" |
| | | - Montrer un exemple concret d'analyse 5 Pourquoi |
| **Ajustements** | Scenarios predefinis, ajustements reels documentes. | - Ne pas presenter un plan d'ajustement jamais utilise |
| | | - Montrer les ajustements concrets effectues avec justification |
| **Communication** | Plan de communication, templates, journal de bord. | - Ne pas oublier la communication avec les parties prenantes |

---

### 5.5 Matrice competence RNCP <-> preuves / livrables <-> slide correspondante

| Competence RNCP | Criteres d'evaluation | Preuves / Livrables a montrer | Slide individuelle | Ou trouver la preuve |
|-----------------|----------------------|------------------------------|-------------------|---------------------|
| **C1.1** Faisabilite | - Analyse des besoins | CDC Section 2 (Etude de faisabilite) | Slide 2 | `CAHIER_DES_CHARGES.md` Section 2 |
| | - Faisabilite technique | PoC IA (Sprint 1, ticket S1-05) | Slide 2 | GitHub : PR du PoC |
| | - Faisabilite organisationnelle | Capacite equipe, contraintes | Slide 2 | CDC Section 2.3 |
| | - Faisabilite financiere | Budget previsionnel | Slide 2 | CDC Section 2.4 |
| | - Analyse des risques | Matrice des risques | Slide 2 | CDC Section 7 |
| **C1.2** Veille | - Plan de veille structure | Plan de veille (sources, frequence, outils) | Slide 3 | CDC Section 3.1 |
| | - Analyse concurrentielle | Benchmark des 6 concurrents | Slide 3 | CDC Section 3.2 |
| | - Apports technologiques | Innovations integrees (streaming, structured output, strategie duale) | Slide 3 | CDC Section 3.4 + notes de veille Notion |
| **C1.3** Architecture | - Architecture logicielle | Schema d'architecture + description des composants | Slide 4 | CDC Sections 4-5 |
| | - Specifications fonctionnelles | User stories, features MVP | Slide 4 | CDC Section 5 + Backlog GitHub Projects |
| | - Accessibilite | Rapport Lighthouse + WAVE + corrections | Slide 4 | Rapport d'audit accessibilite (PDF) |
| | - Eco-conception | Scores eco-index, mesures concretes | Slide 4 | Rapport GreenIT Analysis |
| **C1.4** Planification | - Methodologie | Scrum, adaptation au contexte | Slide 5 | CDC Section 8 |
| | - Backlog detaille | Backlog complet avec estimations | Slide 5 | `BACKLOG_DETAILLE.md` + GitHub Projects |
| | - Planning | Timeline 14 semaines, prevu vs realise | Slide 5 | CDC Section 8.2 + registre ajustements |
| | - Budget | Budget prevu vs realise | Slide 5 | Rapports hebdomadaires (section budget) |
| **C1.5** Risques | - Matrice des risques | 10 risques identifies, evalues, avec mitigations | Slide 6 | CDC Section 7 |
| | - Suivi des risques | Evolution au fil des sprints | Slide 6 | Registre des risques (Notion) |
| | - Risques materialises | Exemples concrets + gestion | Slide 6 | Registre des problemes + post-mortems |
| **C1.6** KPI | - KPI projet | Velocite, burndown, taux completion, couverture tests | Slide 7 | CDC Section 9 + rapports hebdomadaires |
| | - KPI produit | Temps reponse IA, latence WS, uptime, taux erreur | Slide 7 | Logs + monitoring (captures d'ecran) |
| | - KPI conformite | Scores accessibilite, eco-index, RGPD | Slide 7 | Rapports d'audit |
| | - Tableau de bord | Dashboard synthetique | Slide 7 | Rapports de sprint + Notion |
| **C1.7** Supervision | - Processus de suivi | Dailies, rapports hebdomadaires, Sprint Reviews | Slide 8 | `SUPERVISION_PROJET.md` + CRs Notion |
| | - Resolution de problemes | 5 Pourquoi, Ishikawa, registre | Slide 8 | `SUPERVISION_PROJET.md` Section 3 |
| | - Ajustements | Scenarios predefinis + ajustements reels | Slide 8 | `SUPERVISION_PROJET.md` Section 4 |
| | - Communication | Plan de communication, templates, journal de bord | Slide 8 | `COMMUNICATION_PARTIES_PRENANTES.md` |

---

### 5.6 Questions potentielles du jury et elements de reponse

| Question potentielle | Competence | Elements de reponse |
|---------------------|-----------|---------------------|
| "Comment avez-vous valide la faisabilite technique de l'IA ?" | C1.1 | PoC au Sprint 1 (S1-05) : flux complet prompt -> reponse -> affichage. Latence mesuree. 3 parties simulees avec coherence narrative validee. |
| "Pourquoi avoir choisi Claude plutot que GPT-4 ?" | C1.2 | Veille : benchmark comparatif (CDC Section 3.3). Claude superieur en qualite narrative et output JSON structure. Cout equivalent. Strategie duale Haiku/Sonnet pour optimiser. |
| "Comment garantissez-vous l'accessibilite ?" | C1.3 | WCAG 2.1 AA : audit Lighthouse (score > 90), test WAVE (0 erreur), test clavier, test VoiceOver. Adaptations specifiques : timers prolongeables, jauges avec labels textuels. |
| "Que faites-vous si l'IA genere du contenu incoherent ?" | C1.5 | Risque R2 identifie. Mitigation : game_state complet envoye, historique des tours, guardrails dans les prompts. Quand materialise (PB-001) : analyse 5 Pourquoi, fix en 48h. |
| "Comment avez-vous gere un retard de planning ?" | C1.7 | Scenarios predefinis (Section 4.3). Exemple ADJ-001 : story reportee du Sprint 2 au Sprint 3 suite a sous-estimation. Communique a l'encadrant dans le rapport hebdomadaire. |
| "Quel KPI vous a le plus surpris ?" | C1.6 | [A preparer avec les donnees reelles : par exemple, le taux d'erreur IA qui a augmente au Sprint 3 a cause des prompts trop courts, corrige par l'ajout du game_state complet.] |
| "Comment avez-vous communique avec les parties prenantes ?" | C1.7 | Plan de communication formel : 14 rapports hebdomadaires, 7 Sprint Reviews, 4 COPIL, 70+ dailies. Tous documentes dans Notion. Templates standardises. |
| "Que feriez-vous differemment ?" | Toutes | [A preparer : par exemple, "Nous aurions du specifier le contrat d'interface entre les services des le Sprint 0 pour eviter le probleme PB-001."] |
| "Comment avez-vous gere la charge de travail entre les membres ?" | C1.4 | Matrice RACI definie au Sprint 0. Estimation en Planning Poker. Suivi via les dailies. Redistribution en cas de desequilibre (voir ADJ-003). |
| "Quel est l'impact environnemental de votre solution ?" | C1.3 | Strategie duale LLM (Haiku pour les phases simples = -60% de tokens). Cache des reponses recurrentes. Eco-index > 50. Pages < 1 Mo. Vercel = energies renouvelables. |

---

## Annexes

### Annexe A : Recapitulatif de tous les templates

| Template | Section | Usage |
|----------|---------|-------|
| Daily standup async (Discord) | 2.3.3 | Quotidien, equipe |
| Rapport d'avancement hebdomadaire | 2.3.1 | Hebdomadaire, encadrant |
| Compte-rendu Sprint Review | 2.3.2 | Bi-hebdomadaire, client + encadrant |
| Rapport de cloture de sprint | 2.3.6 | Bi-hebdomadaire, equipe + encadrant |
| Notification de risque | 2.3.4 | Sur evenement, PO + encadrant |
| Annonce changement de perimetre | 2.3.5 | Sur evenement, toutes les parties |
| Rapport final de projet | 2.3.7 | Fin de projet, jury |
| Compte-rendu de reunion | 3.2 | Apres chaque reunion, equipe |
| Template retrospective | 3.3 | Bi-hebdomadaire, equipe |

### Annexe B : Mapping RNCP C1.7

Ce document couvre la competence **C1.7 -- Superviser et controler l'avancement du projet** :

| Critere d'evaluation | Section de ce document | Preuves |
|---------------------|----------------------|---------|
| Le plan de communication est defini | Sections 1, 2 | Matrice pouvoir/interet, fiches parties prenantes, matrice de communication, calendrier |
| Les templates de communication sont formalises | Section 2.3 | 9 templates prets a l'emploi |
| Le journal de bord est tenu | Section 3 | Structure Notion, templates CR, exemple rempli |
| La gestion des conflits est anticipee | Section 4 | Typologie, processus, CNV |
| La soutenance est preparee | Section 5 | Plans de presentation, checklist, matrice RNCP <-> preuves, questions anticipees |

### Annexe C : Contacts et canaux

| Partie prenante | Contact | Canal principal | Canal secondaire |
|-----------------|---------|----------------|-----------------|
| Encadrant academique | [A renseigner] | Email + Notion | Discord (Sprint Review) |
| Client fictif (Mythos Interactive) | [Role joue par PO] | Sprint Review (Discord) | Notion (CRs) |
| Jury de soutenance | [A renseigner] | Presentation orale | Dossier PDF |
| Equipe de developpement | Discord | Discord `#general` | GitHub + Notion |
| Membre 1 (PO) | [Prenom] | Discord | GitHub |
| Membre 2 (SM) | [Prenom] | Discord | GitHub |
| Membre 3 (Frontend) | [Prenom] | Discord | GitHub |
| Membre 4 (IA) | [Prenom] | Discord | GitHub |
| Membre 5 (DevOps) | [Prenom] | Discord | GitHub |

---

> **Document redige dans le cadre du Workshop 5A TL -- S1 -- Bloc 1 RNCP38822**
> **Projet MYTHOS -- Mythos Interactive**
> **Fevrier 2026**
