# Benchmark Concurrentiel -- Projet MYTHOS

## Plateforme de jeux narratifs multijoueurs pilotes par IA

| Information       | Detail                                      |
| ----------------- | ------------------------------------------- |
| **Projet**        | MYTHOS                                      |
| **Version**       | 1.0                                         |
| **Date**          | 09 fevrier 2026                             |
| **Responsable**   | Chef de projet MYTHOS                       |
| **Derniere MAJ**  | 09/02/2026                                  |

---

## Table des matieres

1. [Methodologie d'analyse](#1-methodologie-danalyse)
2. [Mapping concurrentiel](#2-mapping-concurrentiel)
3. [Fiches concurrents detaillees](#3-fiches-concurrents-detaillees)
4. [Analyse des tendances du marche](#4-analyse-des-tendances-du-marche)
5. [Matrice de comparaison fonctionnelle](#5-matrice-de-comparaison-fonctionnelle)
6. [Opportunites et menaces](#6-opportunites-et-menaces)
7. [Positionnement strategique de MYTHOS](#7-positionnement-strategique-de-mythos)
8. [Avantages concurrentiels durables](#8-avantages-concurrentiels-durables)
9. [Lecons tirees des concurrents](#9-lecons-tirees-des-concurrents)

---

## 1. Methodologie d'analyse

### 1.1 Approche

L'analyse concurrentielle a ete menee selon une demarche structuree en quatre etapes :

1. **Identification** : Recensement des acteurs directs et indirects positionnees sur le croisement IA generative, jeu narratif et/ou multijoueur.
2. **Collecte** : Analyse des produits (inscription, test utilisateur), etude des sites web, reviews utilisateurs (Steam, App Store, Reddit), articles de presse specialisee.
3. **Evaluation** : Notation selon une grille de criteres preetablis (cf. ci-dessous).
4. **Synthese** : Mapping, matrice fonctionnelle, identification des opportunites.

### 1.2 Criteres de comparaison

Chaque concurrent est evalue sur 12 criteres regroupes en 4 categories :

| Categorie              | Critere                           | Poids | Description                                              |
| ---------------------- | --------------------------------- | ----- | -------------------------------------------------------- |
| **Experience de jeu**  | Qualite narrative                 | 15%   | Profondeur, coherence, immersion du recit                |
|                        | Multijoueur                       | 15%   | Support multijoueur, interaction entre joueurs           |
|                        | Accessibilite / Onboarding        | 10%   | Facilite de prise en main, tutoriel, UX                  |
|                        | Duree de session                  | 5%    | Adaptation aux sessions courtes (15-25 min)              |
| **Technologie**        | Utilisation de l'IA               | 15%   | Sophistication et pertinence de l'IA generative          |
|                        | Performance temps reel            | 10%   | Fluidite, latence, fiabilite de la connexion             |
|                        | Multi-plateforme                  | 5%    | Disponibilite web, mobile, desktop                       |
| **Marche**             | Taille communaute                 | 5%    | Nombre d'utilisateurs actifs, engagement                 |
|                        | Modele economique                 | 5%    | Viabilite et attractivite du pricing                     |
|                        | Croissance                        | 5%    | Dynamique de croissance recente                          |
| **Differenciation**    | Originalite du concept            | 5%    | Unicite de la proposition de valeur                      |
|                        | Potentiel d'evolution             | 5%    | Capacite a evoluer, roadmap, extensibilite               |

### 1.3 Echelle de notation

- **5/5** : Excellence, reference du marche sur ce critere
- **4/5** : Tres bon, au-dessus de la moyenne
- **3/5** : Correct, dans la moyenne du marche
- **2/5** : Insuffisant, en dessous des attentes
- **1/5** : Tres faible ou absent

---

## 2. Mapping concurrentiel

### 2.1 Positionnement sur deux axes

Les concurrents sont positionnes selon deux axes strategiques pour MYTHOS :

- **Axe X -- Complexite narrative** : De "faible" (mecaniques simples, peu de recit) a "forte" (recit profond, embranchements, personnages complexes).
- **Axe Y -- Aspect multijoueur** : De "solo" (experience individuelle) a "social" (interactions multijoueur centrales au gameplay).

```
          Aspect Multijoueur (Social)
                    ^
                    |
         Among Us  |  Werewolf        MYTHOS
           *       |  Online *         (cible)
                   |                     *
                   |  Hidden
                   |  Agenda *
                   |
    ---------------+--------------------------------> Complexite
    Faible         |                         Forte   Narrative
                   |
                   |        Storium *
                   |
   Character.AI *  |                  D&D Beyond *
                   |
     AI Dungeon *  |            Novel AI *
                   |
                   |
          Solo / Single-player
```

### 2.2 Lecture du mapping

**Quadrant superieur droit (cible MYTHOS)** : Ce quadrant -- forte complexite narrative ET fort aspect multijoueur -- est le moins occupe. C'est precisement la ou MYTHOS se positionne, ce qui represente une opportunite de marche significative.

| Quadrant                            | Concurrents                        | Saturation |
| ----------------------------------- | ---------------------------------- | ---------- |
| Narratif fort + Multijoueur fort    | (Quasi-vide)                       | Tres faible|
| Narratif faible + Multijoueur fort  | Among Us, Werewolf Online          | Moyenne    |
| Narratif fort + Solo                | AI Dungeon, Novel AI, D&D Beyond   | Haute      |
| Narratif faible + Solo              | Character.AI (conversationnel)     | Moyenne    |

**Conclusion** : MYTHOS vise un espace de marche sous-exploite ou la combinaison IA narrative + multijoueur synchrone n'est proposee par aucun acteur majeur.

---

## 3. Fiches concurrents detaillees

---

### 3.1 AI Dungeon

| Critere                | Detail                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| **Description**        | Jeu d'aventure textuel genere par IA. Le joueur tape des actions en texte libre et l'IA genere la suite de l'histoire. Pioneer de l'utilisation des LLM pour le gaming (lance en 2019). |
| **URL**                | https://aidungeon.com                                                                    |
| **Editeur**            | Latitude (startup US, Salt Lake City)                                                    |
| **Date de lancement**  | Decembre 2019                                                                            |
| **Business model**     | Freemium. Plan gratuit (modele de base limite). Abonnements : Hero (9.99$/mois), Legend (29.99$/mois), Mythic (49.99$/mois) avec modeles plus puissants et credits supplementaires. |
| **Public cible**       | Joueurs solo amateurs de RPG textuel, ecrivains, creatifs. Audience principalement anglophone, 18-35 ans. |
| **Stack technique (estimee)** | Frontend React, Backend Python (FastAPI), LLM : modeles OpenAI (GPT-4) + modeles custom finetunes, Infrastructure cloud AWS. |
| **Taille communaute**  | ~2M de comptes crees, ~100-200K utilisateurs actifs mensuels (estimation), subreddit r/AIDungeon ~120K membres, Discord ~80K membres. |
| **Pricing**            | Gratuit (limite) / 9.99$ / 29.99$ / 49.99$ par mois                                     |

**Forces :**
- Pioneer du marche, forte notoriete dans le domaine IA + jeu
- Experience de jeu illimitee (monde ouvert, pas de scenarios predetermines)
- Communaute active de createurs de "worlds" (scenarios partages)
- Modeles IA finetunes pour le gaming narratif
- Mode multijoueur (ajoute recemment, basique)

**Faiblesses :**
- Experience multijoueur tres rudimentaire (partage de session, pas de roles distincts)
- Problemes historiques de moderation du contenu genere (controverse 2021)
- UX datee, interface peu moderne
- Coherence narrative limitee sur les sessions longues
- Sessions sans structure, pas de format "partie" avec debut/fin

**Note globale** : 3.2 / 5

---

### 3.2 Storium

| Critere                | Detail                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| **Description**        | Plateforme d'ecriture collaborative en ligne structuree comme un jeu de cartes narratif. Les joueurs jouent des personnages dans des histoires a plusieurs chapitres. Asymetrique : 1 narrateur + joueurs. |
| **URL**                | https://storium.com                                                                      |
| **Editeur**            | Protagonist Labs                                                                         |
| **Date de lancement**  | 2014 (Kickstarter), 2015 (lancement public)                                             |
| **Business model**     | Freemium. Plan gratuit (3 jeux actifs). Plan premium a 5$/mois ou 40$/an (jeux illimites, themes premium). |
| **Public cible**       | Ecrivains, joueurs de JDR sur table, amateurs de fiction collaborative. Niche (25-45 ans, anglophone). |
| **Stack technique (estimee)** | Application web Ruby on Rails, base de donnees PostgreSQL, hebergement Heroku/AWS. Pas d'IA. |
| **Taille communaute**  | ~200K comptes, ~5-10K actifs mensuels (estimation). Kickstarter initial : 5 600 backers, 370K$ leves. Communaute en declin. |
| **Pricing**            | Gratuit (limite) / 5$/mois / 40$/an                                                      |

**Forces :**
- Concept bien pense de jeu narratif collaboratif structure
- Systeme de cartes (forces, faiblesses, sous-intrigues) qui guide la narration
- Communaute de createurs de "worlds" (genres varies)
- Asymetrie narrateur/joueurs qui cree une dynamique interessante

**Faiblesses :**
- Pas d'IA : le narrateur humain est un goulot d'etranglement
- Sessions tres longues (heures a jours entre les tours), mode asynchrone uniquement
- Interface vieillissante, pas de refonte depuis 2018
- Communaute en declin progressif
- Pas de temps reel, pas de jeu synchrone
- Plateforme web uniquement, pas d'app mobile

**Note globale** : 2.4 / 5

---

### 3.3 Character.AI

| Critere                | Detail                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| **Description**        | Plateforme de chatbots IA permettant de creer et discuter avec des personnages virtuels. Conversations immersives avec des personnages fictifs, historiques ou custom. Tres populaire chez les jeunes. |
| **URL**                | https://character.ai                                                                     |
| **Editeur**            | Character Technologies Inc. (fonde par d'anciens chercheurs Google Brain, Noam Shazeer et Daniel De Freitas). Partenariat strategique avec Google (investissement ~2.7 milliards $). |
| **Date de lancement**  | Septembre 2022 (beta), 2023 (lancement public)                                          |
| **Business model**     | Freemium. Plan gratuit (acces standard). c.ai+ a 9.99$/mois (acces prioritaire, reponses plus rapides, modeles avances, pas de file d'attente). |
| **Public cible**       | Adolescents et jeunes adultes (13-25 ans), fans de roleplay, amateurs de personnages fictifs. Tres forte audience Gen Z. |
| **Stack technique (estimee)** | Modeles LLM proprietaires (entraines from scratch, pas GPT), infrastructure Google Cloud, frontend React/Next.js, backend distribue. |
| **Taille communaute**  | Phenomene viral : ~20M+ utilisateurs actifs mensuels, 3.5 milliards de messages/mois (estime), top 10 des sites les plus visites Gen Z, subreddit r/CharacterAI ~500K membres. |
| **Pricing**            | Gratuit / 9.99$/mois (c.ai+)                                                            |

**Forces :**
- Modeles IA proprietaires extremement conversationnels et expressifs
- Enorme base d'utilisateurs, effets de reseau
- Forte retention (temps moyen de session ~25 min, comparable aux reseaux sociaux)
- Creation de personnages par les utilisateurs (UGC)
- Investissement massif de Google, perennite financiere

**Faiblesses :**
- Pas de veritable gameplay structure (c'est du chat, pas un jeu)
- Mode solo uniquement (1 utilisateur parle a 1 personnage)
- Pas de multijoueur
- Coherence a long terme des personnages perfectible
- Controverses sur le contenu genere (moderation)
- Pas de mecaniques de jeu, pas de scenarios, pas d'objectifs

**Note globale** : 2.8 / 5 (pour notre positionnement; en tant que produit conversationnel, c'est un 4.5/5)

---

### 3.4 Among Us

| Critere                | Detail                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| **Description**        | Jeu de deduction sociale multijoueur. Des membres d'equipage doivent trouver les imposteurs parmi eux. Discussions, votes, eliminations. Phenomene culturel 2020. |
| **URL**                | https://www.innersloth.com/games/among-us/                                               |
| **Editeur**            | Innersloth (studio indie US, 5 personnes a l'origine)                                    |
| **Date de lancement**  | Juin 2018 (explosion virale en 2020)                                                     |
| **Business model**     | Jeu premium a bas cout : gratuit sur mobile (avec pubs), 5$ sur PC/consoles. Monetisation par cosmetics (skins, chapeaux, mascottes) et DLCs (roles supplementaires). Stars (monnaie in-game) achetables. |
| **Public cible**       | Tres large : casual gamers, 10-30 ans, familles, groupes d'amis, streamers. Audience mondiale. |
| **Stack technique (estimee)** | Unity (C#), serveurs dedies custom, matchmaking proprietaire, protocole UDP custom, Hazel Networking. |
| **Taille communaute**  | Phenomene mondial : pic a 500M+ telechargements, ~50M joueurs actifs mensuels au pic (2020-2021). Encore ~5-10M actifs (estimation 2025-2026). Subreddit r/AmongUs ~3M membres. |
| **Pricing**            | Gratuit (mobile) / 5$ (PC/console) + microtransactions                                   |

**Forces :**
- Gameplay de deduction sociale parfaitement calibre (simple, addictif, social)
- Sessions courtes (~10-15 min), ideal pour le casual
- Multijoueur au coeur de l'experience (4-15 joueurs)
- Phenomene cultural, marque reconnue mondialement
- Support multi-plateforme (mobile, PC, Switch, PlayStation, Xbox)
- UX tres accessible, onboarding immediat

**Faiblesses :**
- Pas de composante narrative (pas d'histoire, pas de recit)
- Pas d'IA (gameplay entierement base sur les interactions humaines)
- Experience repetitive sur le long terme (gameplay statique)
- Metajeu et triche (Discord, communication externe) nuisent a l'experience
- Mises a jour lentes (equipe reduite)
- Popularite en declin depuis le pic de 2020

**Note globale** : 3.0 / 5 (pour notre positionnement)

---

### 3.5 Werewolf Online

| Critere                | Detail                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| **Description**        | Version numerique du jeu de societe "Loups-garous de Thiercelieux". Jeu de deduction sociale en ligne. Phases jour (debat, vote) et nuit (actions secretes). Multiples roles et variantes. |
| **URL**                | https://werewolfon.com / egalement Wolvesville (https://wolvesville.com)                 |
| **Editeur**            | Werewolf Apps (Wolvesville est le principal acteur du genre)                              |
| **Date de lancement**  | 2017 (Wolvesville), nombreux clones depuis                                               |
| **Business model**     | Free-to-play. Monetisation par cosmetics (avatars, effets), abonnement premium (~4.99$/mois pour avantages cosmetiques et confort), pubs optionnelles. |
| **Public cible**       | Joueurs casual, fans de jeux de societe, 12-30 ans. Forte communaute europeenne et sud-americaine. |
| **Stack technique (estimee)** | Application mobile native (Flutter ou React Native), backend Node.js, WebSocket, Firebase/AWS. |
| **Taille communaute**  | Wolvesville : ~10M telechargements (Play Store), ~500K-1M joueurs actifs mensuels. Communaute Discord active ~200K membres. |
| **Pricing**            | Gratuit + cosmetics / Premium ~4.99$/mois                                                |

**Forces :**
- Gameplay de deduction sociale eprouve (Loups-garous est un classique)
- Grande variete de roles (30+ roles), rejouabilite elevee
- Sessions de 15-20 minutes (parfait pour le casual)
- Chat vocal et textuel integre
- Communaute active et engagee
- Matchmaking rapide

**Faiblesses :**
- Pas d'IA (gameplay purement humain)
- Narration quasi-inexistante (mecaniques pures, pas de recit)
- Toxicite dans le chat (moderation difficile)
- Interface mobile-first, experience web limitee
- Pas d'evolution narrative entre les parties (chaque partie est isolee)
- Difficulte a retenir les joueurs sur le long terme (repetitif)

**Note globale** : 2.7 / 5 (pour notre positionnement)

---

### 3.6 Hidden Agenda (Supermassive Games)

| Critere                | Detail                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| **Description**        | Jeu narratif interactif multijoueur de type "PlayLink". Thriller ou les joueurs votent ensemble sur les decisions du protagoniste, avec un joueur possedant un agenda secret. Cinematic experience avec acteurs reels. |
| **URL**                | https://www.supermassivegames.com/games/hidden-agenda                                    |
| **Editeur**            | Supermassive Games (UK, ~300 employes, connu pour Until Dawn, The Dark Pictures)         |
| **Date de lancement**  | Octobre 2017                                                                             |
| **Business model**     | Jeu premium : 19.99$ a la sortie (PlayStation exclusive, PlayLink). Prix actuel ~5-10$ en soldes. |
| **Public cible**       | Joueurs casual en couch co-op, amateurs de thrillers interactifs, 16-35 ans. Soirees entre amis. |
| **Stack technique (estimee)** | Unreal Engine 4, FMV (Full Motion Video) prerendu, serveur PlayLink (smartphones comme manettes), exclusif PlayStation. |
| **Taille communaute**  | Ventes estimees ~500K-1M copies. Pas de communaute en ligne active (jeu local, pas de matchmaking en ligne). Note Metacritic : 59/100. |
| **Pricing**            | 19.99$ (lancement) / 5-10$ (soldes actuels)                                              |

**Forces :**
- Concept innovant : jeu narratif + deduction sociale multijoueur
- Production cinematique de qualite (acteurs reels, mise en scene)
- Utilisation des smartphones comme manettes (accessible, pas besoin de manettes)
- Asymetrie (agenda secret) qui rappelle les jeux de roles cachees

**Faiblesses :**
- Jeu a duree de vie limitee (2-3h de contenu total, peu rejouable)
- Pas d'IA (scenarios scriptes, choix predetermines)
- Exclusif PlayStation + local uniquement (pas d'online)
- PlayLink abandonne par Sony
- Production tres couteuse (FMV), non scalable
- Notes critiques mediocres, execution decevante

**Note globale** : 2.2 / 5

---

### 3.7 Dungeons & Dragons Beyond (D&D Beyond)

| Critere                | Detail                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| **Description**        | Plateforme officielle de D&D numerique. Feuilles de personnage, regles, creation de personnages, outils de DM, lancer de des virtuel. Companion numerique pour les parties de JDR sur table. Ajout recent de fonctionnalites IA. |
| **URL**                | https://www.dndbeyond.com                                                                |
| **Editeur**            | Wizards of the Coast (filiale de Hasbro). Anciennement Fandom, rachete par Hasbro en 2022 pour ~146M$. |
| **Date de lancement**  | 2017 (lancement public), evolutions continues                                           |
| **Business model**     | Freemium. Plan gratuit (personnage basique). Abonnements : Hero Tier (5.99$/mois), Master Tier (11.99$/mois). Achat de contenus numeriques (livres, aventures : 20-50$ chacun). Marketplace. |
| **Public cible**       | Joueurs de D&D (debutants et veterains), 18-45 ans. Estimations : 50M+ de joueurs D&D dans le monde, D&D Beyond sert la majorite de la base numerique. |
| **Stack technique (estimee)** | Frontend React, backend microservices (probablement Java/Kotlin ou Node.js), PostgreSQL/MongoDB, AWS, API REST. Integration IA recente (ChatGPT-based pour les DM assistants). |
| **Taille communaute**  | ~15M comptes enregistres (Hasbro Q4 2024 reporting), ~5M utilisateurs actifs mensuels estimes. Communaute massive : subreddit r/DnD ~3.5M, r/dndnext ~1M. |
| **Pricing**            | Gratuit (limite) / 5.99$ / 11.99$ / mois + achats de contenu                            |

**Forces :**
- Marque D&D : la reference absolue du JDR, notoriete incomparable
- Base d'utilisateurs massive et fidele
- Outils de creation de personnage et de gestion de campagne tres complets
- Contenus officiels riches (centaines de livres numerises)
- Integration IA recente (DM assistant) qui montre l'interet du marche
- Effets de reseau : jouer a D&D implique souvent D&D Beyond

**Faiblesses :**
- Pas un jeu a proprement parler (c'est un companion tool, pas un game engine)
- Necessite toujours un DM humain (l'IA est un assistant, pas un remplacement)
- Complexite des regles D&D : onboarding difficile pour les non-inities
- Sessions tres longues (2-4h minimum), pas adapte au casual
- Modele economique couteux (abonnement + achats de livres : >100$/an)
- Focalisé sur D&D 5e/2024, pas de flexibilite de systeme de jeu
- Experience web, pas d'experience de jeu temps reel integree

**Note globale** : 2.9 / 5 (pour notre positionnement)

---

### 3.8 Novel AI

| Critere                | Detail                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| **Description**        | Service de generation de texte et d'images par IA oriente fiction et creative writing. Utilise des modeles LLM finetunes sur de la fiction (Llama-based). Offre un mode "text adventure" et un mode ecriture libre. |
| **URL**                | https://novelai.net                                                                      |
| **Editeur**            | Anlatan (startup, basee au Delaware, equipe distribuee)                                  |
| **Date de lancement**  | Juin 2021                                                                                |
| **Business model**     | Abonnement pur. Tablet (10$/mois, modele standard), Scroll (15$/mois, modele avance), Opus (25$/mois, meilleur modele, generation d'images illimitee). Pas de plan gratuit (essai limite). |
| **Public cible**       | Ecrivains, amateurs de fiction, fans de roleplay textuel, communaute anime/manga. 18-35 ans, niche passionnee. |
| **Stack technique (estimee)** | Modeles LLM custom (finetunes Llama 3 et modeles propres), modeles de diffusion custom (NAI Diffusion) pour les images, infrastructure GPU proprietary, frontend React, backend Python. |
| **Taille communaute**  | ~500K-1M utilisateurs estimes, subreddit r/NovelAI ~130K membres, Discord ~200K membres. Communaute tres active et technique. |
| **Pricing**            | 10$ / 15$ / 25$ par mois (pas de plan gratuit)                                           |

**Forces :**
- Modeles IA finetunes specifiquement pour la fiction (qualite narrative superieure)
- Forte personnalisation (lorebook, memory, author's note pour la coherence)
- Respect de la vie privee (pas de lecture des donnees utilisateurs pour l'entrainement)
- Generation d'images integree (illustration des scenes)
- Communaute passionnee et creative
- Pas de censure agressive (liberte creative)

**Faiblesses :**
- Experience strictement solo (aucun multijoueur)
- Pas de gameplay structure (c'est un outil d'ecriture, pas un jeu)
- Interface complexe, onboarding difficile pour les non-inities
- Modele economique excluant (pas de plan gratuit)
- Mode "text adventure" basique (pas de mecaniques de jeu)
- Niche : peu connue du grand public

**Note globale** : 2.5 / 5 (pour notre positionnement)

---

### 3.9 Tableau recapitulatif des concurrents

| Concurrent         | Annee | IA   | Multi | Narration | Session  | Communaute  | Note /5 |
| ------------------ | ----- | ---- | ----- | --------- | -------- | ----------- | ------- |
| AI Dungeon         | 2019  | Oui  | Basique| Forte    | Variable | ~150K MAU   | 3.2     |
| Storium            | 2014  | Non  | Oui   | Forte     | Jours    | ~8K MAU     | 2.4     |
| Character.AI       | 2022  | Oui  | Non   | Faible    | ~25 min  | ~20M MAU    | 2.8     |
| Among Us           | 2018  | Non  | Oui   | Nulle     | ~12 min  | ~8M MAU     | 3.0     |
| Werewolf Online    | 2017  | Non  | Oui   | Faible    | ~18 min  | ~700K MAU   | 2.7     |
| Hidden Agenda      | 2017  | Non  | Local | Moyenne   | ~2-3h    | Inactif     | 2.2     |
| D&D Beyond         | 2017  | Partiel| Oui | Forte     | ~3h      | ~5M MAU     | 2.9     |
| Novel AI           | 2021  | Oui  | Non   | Forte     | Variable | ~700K       | 2.5     |
| **MYTHOS (cible)** | 2026  | Oui  | Oui   | Forte     | 15-25min | -           | -       |

---

## 4. Analyse des tendances du marche

### 4.1 Marche du jeu narratif

| Tendance                                             | Description                                                                                  | Impact sur MYTHOS |
| ---------------------------------------------------- | -------------------------------------------------------------------------------------------- | ----------------- |
| Renaissance de la fiction interactive                  | Regain d'interet pour les jeux narratifs grace a l'IA (AI Dungeon a ouvert la voie en 2019). Marche estime a ~1.5 milliard $ en 2025. | Fort positif      |
| Democratisation des outils de creation narrative      | Des outils comme Ink (Inkle), Twine, Ren'Py permettent a quiconque de creer des recits interactifs. L'IA abaisse encore plus la barriere. | Positif           |
| Convergence jeu video et narration longue             | Les jeux AAA investissent massivement dans la narration (Baldur's Gate 3, Disco Elysium). Les joueurs attendent des recits de qualite. | Positif           |
| Fatigue du contenu procedural sans ame                | Les joueurs se lassent du contenu genere sans coherence. La qualite narrative est un differenciant. | Vigilance         |

### 4.2 IA generative et gaming

| Tendance                                             | Description                                                                                  | Impact sur MYTHOS |
| ---------------------------------------------------- | -------------------------------------------------------------------------------------------- | ----------------- |
| Integration croissante de l'IA dans les jeux          | Nvidia ACE (NPC IA), Inworld AI, Convai : les NPC IA deviennent un standard attendu. Ubisoft, Blizzard experimentent. | Fort positif      |
| Amelioration rapide des LLM                           | Claude 3.5/4, GPT-4o/5 : les modeles sont de plus en plus rapides, moins chers, plus coherents. Le cout par token baisse de ~50% par an. | Fort positif      |
| Structured output et function calling                 | Les LLM modernes supportent nativement les sorties JSON structurees et les appels de fonctions, parfait pour un game engine. | Fort positif      |
| Preoccupations ethiques et moderation                 | La generation de contenu par IA souleve des questions de moderation, biais, contenu inapproprie. Reglementation en cours (AI Act). | Vigilance         |
| Latence comme facteur limitant                        | La generation par LLM ajoute 1-5 secondes de latence. Pour du temps reel, c'est un defi technique a resoudre (streaming, cache, pre-generation). | Defi technique    |

### 4.3 Jeux sociaux et social deduction

| Tendance                                             | Description                                                                                  | Impact sur MYTHOS |
| ---------------------------------------------------- | -------------------------------------------------------------------------------------------- | ----------------- |
| Post-Among Us : recherche de la prochaine vague       | Apres l'explosion d'Among Us (2020), le marche cherche le successeur. Des dizaines de clones, aucun n'a recapture la meme magie. | Opportunite       |
| Montee des jeux sociaux mobiles                       | Les jeux sociaux sur mobile dominent l'engagement (temps passe). Les sessions courtes et les interactions sociales sont cles. | Positif           |
| Streaming et spectacle                                | Les jeux sociaux fonctionnent bien en streaming (Twitch, YouTube). Le potentiel viral est un facteur de croissance majeur. | Fort positif      |
| Party games en ligne post-COVID                       | Le COVID a accelere l'adoption des party games en ligne. La tendance persiste post-pandemie avec des plateformes comme Jackbox, Gartic Phone. | Positif           |
| Crossplay et accessibilite technique                  | Les joueurs attendent de pouvoir jouer sur n'importe quel appareil (web, mobile, desktop) avec leurs amis. | Exigence          |

### 4.4 Donnees de marche cles

| Indicateur                                          | Valeur                    | Source                    |
| --------------------------------------------------- | ------------------------- | ------------------------- |
| Marche mondial du jeu video (2025)                  | ~200 milliards $          | Newzoo                    |
| Part du marche mobile                               | ~50% (~100 milliards $)   | Newzoo                    |
| Joueurs dans le monde                               | ~3.4 milliards            | Newzoo                    |
| Marche du jeu casual (2025)                         | ~25 milliards $           | data.ai                   |
| Croissance annuelle jeux IA-powered                 | +35-45% (estimation)      | Analyse sectorielle       |
| Temps moyen de session jeu casual mobile            | 12-18 minutes             | data.ai                   |
| Investissements IA gaming (2024-2025)               | ~2.5 milliards $          | PitchBook                 |

---

## 5. Matrice de comparaison fonctionnelle

### 5.1 Features principales

| Feature                                    | AI Dungeon | Storium | Character.AI | Among Us | Werewolf Online | Hidden Agenda | D&D Beyond | Novel AI | **MYTHOS** |
| ------------------------------------------ | ---------- | ------- | ------------ | -------- | --------------- | ------------- | ---------- | -------- | ---------- |
| IA comme Game Master                       | ✅          | ❌       | ⚠️ (chat)    | ❌        | ❌               | ❌             | ⚠️ (assist) | ⚠️ (gen) | ✅          |
| Multijoueur synchrone (2-8)               | ⚠️ (basique)| ❌ (async)| ❌           | ✅        | ✅               | ✅ (local)     | ⚠️ (outils)| ❌        | ✅          |
| Scenarios structures (debut/fin)           | ❌          | ✅       | ❌            | ✅        | ✅               | ✅             | ✅          | ❌        | ✅          |
| Roles distincts par joueur                 | ❌          | ✅       | ❌            | ✅        | ✅               | ⚠️            | ✅          | ❌        | ✅          |
| Sessions courtes (15-25 min)               | ⚠️         | ❌       | ✅            | ✅        | ✅               | ❌             | ❌          | ⚠️        | ✅          |
| Game loop structure (phases)               | ❌          | ⚠️      | ❌            | ✅        | ✅               | ⚠️            | ❌          | ❌        | ✅          |
| Generation narrative dynamique             | ✅          | ❌       | ✅            | ❌        | ❌               | ❌             | ❌          | ✅        | ✅          |
| Coherence narrative sur session            | ⚠️         | ✅       | ⚠️           | N/A      | N/A             | ✅             | ✅          | ⚠️        | ✅          |
| Multi-scenarios / themes                   | ✅ (ouvert) | ✅       | ✅ (custom)   | ⚠️       | ⚠️              | ❌             | ✅          | ✅        | ✅          |
| Scenarios en JSON configurable             | ❌          | ❌       | ❌            | ❌        | ❌               | ❌             | ❌          | ❌        | ✅          |
| Accessibilite web (navigateur)             | ✅          | ✅       | ✅            | ❌ (app)  | ❌ (app)         | ❌ (PS4)       | ✅          | ✅        | ✅          |
| Chat temps reel entre joueurs              | ⚠️         | ❌       | ❌            | ✅        | ✅               | ⚠️            | ❌          | ❌        | ✅          |
| Systeme de vote / decisions collectives    | ❌          | ⚠️      | ❌            | ✅        | ✅               | ✅             | ❌          | ❌        | ✅          |
| Onboarding < 2 minutes                    | ⚠️         | ❌       | ✅            | ✅        | ⚠️              | ⚠️            | ❌          | ❌        | ✅          |
| Gratuit / Free-to-play                     | ⚠️ (limite)| ⚠️      | ✅            | ✅ (mobile)| ✅              | ❌ (payant)    | ⚠️         | ❌        | ✅          |

> Legende : ✅ = Present et bien implemente | ⚠️ = Partiellement present ou basique | ❌ = Absent

### 5.2 Synthese de la matrice

| Concurrent         | Features presentes (✅) | Features partielles (⚠️) | Features absentes (❌) | Score features |
| ------------------ | ----------------------- | ------------------------- | ---------------------- | -------------- |
| AI Dungeon         | 3                       | 6                         | 6                      | 12/45          |
| Storium            | 4                       | 3                         | 8                      | 11/45          |
| Character.AI       | 3                       | 3                         | 9                      | 9/45           |
| Among Us           | 7                       | 1                         | 7                      | 15/45          |
| Werewolf Online    | 5                       | 2                         | 8                      | 12/45          |
| Hidden Agenda      | 2                       | 4                         | 9                      | 8/45           |
| D&D Beyond         | 3                       | 3                         | 9                      | 9/45           |
| Novel AI           | 2                       | 3                         | 10                     | 7/45           |
| **MYTHOS (cible)** | **15**                  | **0**                     | **0**                  | **45/45**      |

> **Aucun concurrent existant ne couvre l'ensemble des features cibles de MYTHOS.** Le score maximum atteint est 15/45 (Among Us), principalement grace a ses mecaniques multijoueur, mais sans composante IA ni narrative forte.

---

## 6. Opportunites et menaces

### 6.1 Opportunites

| #  | Opportunite                                                     | Probabilite | Impact    | Action MYTHOS                                          |
| -- | --------------------------------------------------------------- | ----------- | --------- | ------------------------------------------------------ |
| O1 | Espace de marche vide au croisement IA narrative + multijoueur  | Elevee      | Tres fort | Occuper cette niche en premier (first mover advantage) |
| O2 | Baisse continue des couts des API LLM (~50%/an)                | Elevee      | Fort      | Modele economique viable a moyen terme                 |
| O3 | Demande post-Among Us pour un nouveau jeu social innovant       | Moyenne     | Tres fort | Positionner MYTHOS comme "Among Us avec de la narration IA" |
| O4 | Potentiel viral sur Twitch/YouTube (spectacle + IA)             | Moyenne     | Tres fort | Integrer des features spectateur-friendly              |
| O5 | Format JSON pour les scenarios = extensibilite communautaire    | Elevee      | Fort      | Prevoir un editeur de scenarios communautaire post-MVP |
| O6 | Marche francophone sous-desservi en jeux narratifs IA           | Elevee      | Moyen     | Lancer en francais d'abord, puis internationaliser     |
| O7 | Tendance "short-session gaming" chez les 15-30 ans              | Elevee      | Fort      | Format 15-25 min parfaitement calibre                  |

### 6.2 Menaces

| #  | Menace                                                          | Probabilite | Impact    | Mitigation MYTHOS                                      |
| -- | --------------------------------------------------------------- | ----------- | --------- | ------------------------------------------------------ |
| T1 | Un acteur majeur (Hasbro, Valve, etc.) lance un produit similaire| Moyenne    | Tres fort | Avancer vite, constituer une communaute fidele         |
| T2 | AI Dungeon ajoute un vrai mode multijoueur structure            | Moyenne     | Fort      | Se differencier par la qualite UX et les scenarios     |
| T3 | Couts API Claude trop eleves pour un modele F2P                 | Moyenne     | Fort      | Optimiser les prompts, caching, modeles hybrides       |
| T4 | Reglementation IA (AI Act) imposant des contraintes             | Elevee      | Moyen     | Conformite des la conception, moderation proactive      |
| T5 | Lassitude des utilisateurs envers le contenu genere par IA      | Faible      | Fort      | Qualite > quantite, scenarios construits, edition humaine |
| T6 | Problemes de moderation du contenu genere (reputation)          | Moyenne     | Fort      | Systeme de moderation robuste, garde-fous IA           |
| T7 | Difficulte a atteindre la masse critique de joueurs             | Elevee      | Fort      | Mode asynchrone en fallback, bots IA pour completer les parties |

---

## 7. Positionnement strategique de MYTHOS

### 7.1 USP -- Unique Selling Proposition

> **MYTHOS est la premiere plateforme de jeux narratifs multijoueurs ou une IA joue le role de Game Master en temps reel, offrant des experiences de deduction sociale et de narration collaborative en sessions courtes de 15-25 minutes.**

### 7.2 Decomposition de l'USP

| Element de l'USP                          | Ce qui nous differencie                                                                 | Concurrent le plus proche              | Notre avantage                                    |
| ----------------------------------------- | --------------------------------------------------------------------------------------- | -------------------------------------- | ------------------------------------------------- |
| **IA comme Game Master**                  | L'IA ne genere pas juste du texte : elle gere les regles, les evenements, l'equilibrage | AI Dungeon (IA narrative libre)        | IA structuree avec game loop, pas du texte libre  |
| **Multijoueur synchrone**                 | 2-8 joueurs en temps reel avec des roles distincts et des interactions                  | Among Us (multi sans narration)        | Ajout de la couche narrative IA                   |
| **Sessions courtes (15-25 min)**          | Format calibre pour le casual, avec un debut et une fin structures                      | Werewolf Online (~18 min)              | Narration immersive en plus des mecaniques        |
| **Scenarios JSON configurables**          | Architecture de moteur universel, scenarios comme "plugins"                              | Aucun (tous sont monolithiques)        | Extensibilite, communaute de createurs            |
| **Deduction sociale + narration**         | Combinaison unique de mecaniques sociales et de recit profond                           | Storium (narration sans social deduction)| Fusion des deux genres                           |

### 7.3 Proposition de valeur par cible

| Cible                     | Proposition de valeur                                                                                     |
| ------------------------- | --------------------------------------------------------------------------------------------------------- |
| **Joueurs casual (15-25 ans)** | "Vis une experience de jeu de role avec tes amis en 20 minutes, sans preparation ni regles compliquees." |
| **Fans d'Among Us / Werewolf** | "Imagine Among Us, mais avec une IA qui raconte une histoire unique a chaque partie."                  |
| **Joueurs de JDR**        | "Pas de MJ ? Pas de probleme. L'IA maitrise la partie, tu joues ton personnage."                         |
| **Streamers / Createurs** | "Du contenu unique a chaque partie, parfait pour streamer : suspense, trahisons, rebondissements IA."     |

### 7.4 Positionnement prix

| Segment                   | Concurrents references        | Pricing concurrent          | Pricing MYTHOS envisage                        |
| ------------------------- | ----------------------------- | --------------------------- | ---------------------------------------------- |
| Free-to-play              | Among Us (mobile), Werewolf   | Gratuit + cosmetics         | Gratuit (1-2 scenarios, parties limitees/jour)  |
| Premium lite              | AI Dungeon Hero               | 9.99$/mois                  | ~5-7 EUR/mois (scenarios illimites, pas de pub) |
| Premium full              | Novel AI Opus, D&D Beyond     | 25$/mois                    | Non prevu pour le MVP                           |

---

## 8. Avantages concurrentiels durables

### 8.1 Avantages a court terme (lancement)

| Avantage                                  | Durabilite | Imitable ?          | Description                                                       |
| ----------------------------------------- | ---------- | ------------------- | ----------------------------------------------------------------- |
| First mover sur le creneau IA + multi + narration | 6-12 mois  | Oui, a terme    | Aucun concurrent ne propose exactement ce mix. Avance de 6-12 mois. |
| Architecture moteur universel + JSON      | Durable    | Oui, mais couteux   | Permet d'ajouter des scenarios sans refaire le moteur.            |
| Cout de developpement faible (equipe 4-5) | Court terme| N/A                 | Un studio AAA mettrait 10x plus de temps et d'argent.             |

### 8.2 Avantages a moyen terme (6-18 mois)

| Avantage                                  | Durabilite | Imitable ?          | Description                                                       |
| ----------------------------------------- | ---------- | ------------------- | ----------------------------------------------------------------- |
| Ecosysteme de scenarios communautaires     | Durable    | Difficile           | Si les joueurs creent des scenarios JSON, effet reseau puissant.  |
| Donnees d'interaction (IA + joueurs)       | Durable    | Tres difficile      | Chaque partie genere des donnees pour ameliorer l'IA Game Master. |
| Communaute engagee                         | Durable    | Difficile           | Une communaute fidelisee est le meilleur rempart concurrentiel.   |
| Expertise prompt engineering gaming        | 12-24 mois | Oui, avec effort    | Savoir-faire unique dans l'utilisation des LLM pour le game mastering. |

### 8.3 Barrieres a l'entree pour les concurrents

| Barriere                                  | Force      | Explication                                                       |
| ----------------------------------------- | ---------- | ----------------------------------------------------------------- |
| Complexite technique (IA + temps reel + game design) | Forte | Combiner ces trois competences est rare.                         |
| Couts d'experimentation IA                | Moyenne    | Les couts API pour iterer sur le prompt engineering sont significatifs. |
| Effet reseau communautaire                | Forte (si atteint) | Plus de joueurs = plus de parties = meilleure experience.   |
| Catalogue de scenarios                    | Moyenne    | Un catalogue riche de scenarios prend du temps a constituer.      |

---

## 9. Lecons tirees des concurrents

### 9.1 Ce qu'on reprend (bonnes pratiques)

| Concurrent         | Bonne pratique                                   | Application dans MYTHOS                                            |
| ------------------ | ------------------------------------------------ | ------------------------------------------------------------------ |
| **Among Us**       | Simplicite des regles, onboarding immediat       | Tutoriel en 1 minute, regles expliquees pendant la partie par l'IA |
| **Among Us**       | Sessions courtes, rejouabilite infinie           | Format 15-25 min, scenarios aleatoires a chaque partie             |
| **Among Us**       | Mecaniques de vote et discussion structurees     | Phases de discussion et de vote dans le game loop                  |
| **Werewolf Online**| Phases jour/nuit qui rythment le jeu             | Game loop en 6 phases claires avec timer                           |
| **Werewolf Online**| Variete des roles pour la rejouabilite           | Roles distincts par scenario (avocat, temoin, juge dans TRIBUNAL)  |
| **Storium**        | Systeme de cartes pour structurer la narration   | Mecaniques de jeu structurees (pas de texte libre pur)             |
| **Character.AI**   | UX conversationnelle fluide et engageante        | Interface de chat soignee pour les interactions avec l'IA GM       |
| **Character.AI**   | Retention elevee (~25 min de session moyenne)     | Design UX visant une duree de session similaire                    |
| **AI Dungeon**     | Liberte d'action du joueur (texte libre)         | Possibilite d'actions libres en plus des choix proposes par l'IA   |
| **D&D Beyond**     | Richesse du lore et des descriptions             | Descriptions immersives generees par l'IA, ambiance soignee       |
| **Novel AI**       | Lorebook et memory pour la coherence narrative    | Systeme de contexte et memoire pour l'IA GM (coherence de session) |

### 9.2 Ce qu'on evite (erreurs et anti-patterns)

| Concurrent         | Erreur identifiee                                | Comment MYTHOS l'evite                                              |
| ------------------ | ------------------------------------------------ | ------------------------------------------------------------------- |
| **AI Dungeon**     | Contenu genere sans moderation → controverse     | Systeme de moderation multi-couche (regles JSON + filtres IA + review) |
| **AI Dungeon**     | UX datee, interface peu engageante               | Design moderne, responsive, mobile-first                            |
| **AI Dungeon**     | Pas de structure de jeu (pas de "partie")        | Game loop en 6 phases avec debut, climax et fin definis             |
| **Storium**        | Mode asynchrone uniquement → latence humaine     | Temps reel uniquement avec IA comme GM (pas d'attente)              |
| **Storium**        | Dependance a un narrateur humain disponible       | L'IA remplace le narrateur humain, disponible 24/7                  |
| **Character.AI**   | Pas de gameplay (chat pur, pas de mecaniques)    | Mecaniques de jeu concretes : votes, roles, objectifs, scoring      |
| **Among Us**       | Metajeu par Discord (communication externe)       | Communication integree, phases structurees limitant le metajeu      |
| **Among Us**       | Repetitivite apres de nombreuses parties          | L'IA genere des situations uniques a chaque partie                  |
| **Hidden Agenda**  | Contenu fini, pas rejouable                      | Generation procedurale par IA = rejouabilite infinie                |
| **Hidden Agenda**  | Production FMV couteuse et non scalable          | Texte + illustrations legeres = production scalable                 |
| **D&D Beyond**     | Onboarding complexe, regles lourdes              | Regles minimales, l'IA explique au fur et a mesure                  |
| **D&D Beyond**     | Cout eleve (abonnement + livres)                 | Modele freemium accessible, pas d'achat de contenu obligatoire      |
| **Novel AI**       | Pas de plan gratuit → barriere a l'entree        | Plan gratuit avec limitations raisonnables                          |
| **Novel AI**       | Interface complexe pour les non-inities           | Onboarding guide, interface epuree et intuitive                     |

### 9.3 Matrice de synthese strategique

```
+-----------------------------------------------------------------------+
|                    LECONS STRATEGIQUES CLES                           |
+-----------------------------------------------------------------------+
|                                                                       |
|  A REPRENDRE                      |  A EVITER                        |
|  -------------------------------- | -------------------------------- |
|  ✅ Sessions courtes (Among Us)   | ❌ Texte libre sans structure     |
|  ✅ Phases de jeu (Werewolf)      | ❌ Dependance a un humain (Storium)|
|  ✅ UX conversationnelle (c.AI)   | ❌ Contenu sans moderation        |
|  ✅ Roles varies (Werewolf/D&D)   | ❌ Pas de plan gratuit (NovelAI) |
|  ✅ Memory/lorebook (NovelAI)     | ❌ Onboarding complexe (D&D)     |
|  ✅ Votes/discussion (Among Us)   | ❌ Production non scalable (HA)  |
|                                   | ❌ Interface datee (AI Dungeon)  |
|                                                                       |
|  A CREER (INNOVATIONS MYTHOS)                                        |
|  --------------------------------                                     |
|  🔵 IA Game Master structuree (game loop 6 phases)                   |
|  🔵 Scenarios JSON configurables (moteur universel)                  |
|  🔵 Fusion deduction sociale + narration IA                          |
|  🔵 Coherence narrative garantie sur session complete                |
|  🔵 Extensibilite communautaire (creation de scenarios)              |
|                                                                       |
+-----------------------------------------------------------------------+
```

---

## Annexes

### Annexe A -- Sources utilisees pour ce benchmark

| Source                         | Type               | Date de consultation |
| ------------------------------ | ------------------ | -------------------- |
| Sites officiels concurrents    | Source primaire     | Fevrier 2026         |
| Steam / App Store reviews      | Retours utilisateurs| Fevrier 2026        |
| Reddit (subreddits respectifs) | Communaute          | Fevrier 2026        |
| SimilarWeb                     | Analyse trafic      | Fevrier 2026        |
| Newzoo Global Games Report     | Rapport marche      | 2025                |
| data.ai (App Annie)            | Donnees apps        | 2025                |
| Crunchbase                     | Donnees financieres | Fevrier 2026        |
| Articles presse specialisee    | Analyse             | 2024-2026           |

### Annexe B -- Glossaire

| Terme                  | Definition                                                                          |
| ---------------------- | ----------------------------------------------------------------------------------- |
| **LLM**               | Large Language Model -- Modele de langage de grande taille (ex: Claude, GPT)        |
| **GM / Game Master**   | Maitre du jeu -- Personne (ou IA) qui dirige une partie de jeu de role             |
| **Social Deduction**   | Genre de jeu ou les joueurs doivent identifier des traitres parmi eux               |
| **Game Loop**          | Boucle de jeu -- Cycle de phases qui structure le deroulement d'une partie          |
| **MVP**                | Minimum Viable Product -- Version minimale fonctionnelle du produit                 |
| **MAU**                | Monthly Active Users -- Utilisateurs actifs mensuels                                |
| **F2P**                | Free-to-Play -- Modele economique ou le jeu de base est gratuit                     |
| **FMV**                | Full Motion Video -- Video filmee avec des acteurs reels utilisee dans un jeu       |
| **UGC**                | User Generated Content -- Contenu cree par les utilisateurs                         |
| **USP**                | Unique Selling Proposition -- Proposition de valeur unique                           |

### Annexe C -- Methodologie de scoring

Le score global de chaque concurrent est calcule comme suit :

```
Score = Somme(Note_critere * Poids_critere) / 5

Avec :
- Note_critere : note de 1 a 5 sur chacun des 12 criteres
- Poids_critere : poids defini dans la section 1.2 (total = 100%)
- Division par 5 pour ramener sur une echelle /5
```

Exemple pour AI Dungeon :

| Critere                    | Note | Poids | Contribution |
| -------------------------- | ---- | ----- | ------------ |
| Qualite narrative          | 4    | 15%   | 0.60         |
| Multijoueur                | 2    | 15%   | 0.30         |
| Accessibilite / Onboarding | 3   | 10%   | 0.30         |
| Duree de session           | 3    | 5%    | 0.15         |
| Utilisation de l'IA        | 4    | 15%   | 0.60         |
| Performance temps reel     | 3    | 10%   | 0.30         |
| Multi-plateforme           | 4    | 5%    | 0.20         |
| Taille communaute          | 3    | 5%    | 0.15         |
| Modele economique          | 3    | 5%    | 0.15         |
| Croissance                 | 2    | 5%    | 0.10         |
| Originalite concept        | 4    | 5%    | 0.20         |
| Potentiel evolution        | 3    | 5%    | 0.15         |
| **Total**                  |      | 100%  | **3.20**     |

---

*Document de reference -- A mettre a jour mensuellement ou lors de l'emergence d'un nouveau concurrent significatif.*
