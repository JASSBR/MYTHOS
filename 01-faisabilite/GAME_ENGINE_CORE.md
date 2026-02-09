# MYTHOS – Moteur de Jeu Universel (Game Engine Core)

## Philosophie

Le moteur MYTHOS repose sur un principe simple :
**Tous les scénarios suivent la même boucle de jeu. Seule la configuration change.**

L'IA Maître du Jeu reçoit un "Scenario Pack" (config JSON + prompt système) et le moteur gère le reste.

---

## 1. Boucle de jeu universelle (Game Loop)

Chaque partie MYTHOS suit **toujours** ce cycle :

```
┌─────────────────────────────────────────────────────┐
│                                                     │
│   ┌───────────┐                                     │
│   │  1. SETUP │ ← Création session, rôles, contexte │
│   └─────┬─────┘                                     │
│         ▼                                           │
│   ┌───────────────┐                                 │
│   │ 2. NARRATION  │ ← L'IA plante la scène         │
│   └─────┬─────────┘                                 │
│         ▼                                           │
│   ┌───────────────┐                                 │
│   │ 3. ACTION     │ ← Les joueurs agissent          │
│   └─────┬─────────┘                                 │
│         ▼                                           │
│   ┌───────────────┐                                 │
│   │ 4. RÉSOLUTION │ ← L'IA traite et raconte        │
│   └─────┬─────────┘                                 │
│         ▼                                           │
│   ┌───────────────┐                                 │
│   │ 5. DISCUSSION │ ← Les joueurs débattent         │
│   └─────┬─────────┘                                 │
│         ▼                                           │
│   ┌───────────────┐                                 │
│   │  CHECK FIN ?  │──── Non ──→ Retour à NARRATION  │
│   └─────┬─────────┘                                 │
│         │ Oui                                       │
│         ▼                                           │
│   ┌───────────────┐                                 │
│   │  6. FINALE    │ ← Climax + révélations          │
│   └───────────────┘                                 │
│                                                     │
└─────────────────────────────────────────────────────┘
```

---

## 2. Détail de chaque phase

### Phase 1 – SETUP

| Élément | Description |
|---------|-------------|
| **Déclencheur** | L'hôte lance la partie |
| **Entrée** | Scenario Pack + liste des joueurs |
| **Actions moteur** | 1. Charge le Scenario Pack (config + prompt IA) |
|  | 2. Distribue les rôles secrets (si applicable) |
|  | 3. Génère le contexte initial via l'IA |
|  | 4. Envoie à chaque joueur : contexte public + infos privées |
| **Sortie** | Chaque joueur voit l'intro + son rôle/objectif secret |
| **Durée** | ~10 secondes (génération IA) |

### Phase 2 – NARRATION

| Élément | Description |
|---------|-------------|
| **Déclencheur** | Automatique après Setup ou après Discussion |
| **Entrée** | État du jeu actuel (game_state) |
| **Actions moteur** | 1. Envoie le game_state à l'IA |
|  | 2. L'IA génère la scène du tour (texte narratif) |
|  | 3. L'IA génère les options d'action disponibles |
|  | 4. Broadcast à tous les joueurs |
| **Sortie** | Texte narratif + liste d'actions possibles |
| **Durée** | 3-5 secondes (génération) + temps de lecture |

### Phase 3 – ACTION

| Élément | Description |
|---------|-------------|
| **Déclencheur** | Fin de la phase Narration |
| **Entrée** | Options d'action générées par l'IA |
| **Mode** | Selon config du scénario : |
|  | → `individual` : chaque joueur choisit secrètement |
|  | → `vote` : choix collectif à la majorité |
|  | → `designated` : un joueur désigné choisit pour le groupe |
|  | → `simultaneous` : tous agissent en même temps, actions différentes |
| **Timer** | Configurable par scénario (30s, 60s, 90s...) |
| **Sortie** | Liste des actions de chaque joueur |

### Phase 4 – RÉSOLUTION

| Élément | Description |
|---------|-------------|
| **Déclencheur** | Tous les joueurs ont agi OU timer expiré |
| **Entrée** | Actions des joueurs + game_state |
| **Actions moteur** | 1. Envoie les actions + état à l'IA |
|  | 2. L'IA résout les conséquences narrativement |
|  | 3. Met à jour le game_state (ressources, indices, statuts) |
|  | 4. L'IA détermine les infos publiques vs privées |
|  | 5. Envoie résultat public à tous + résultats privés individuels |
| **Sortie** | Narration des conséquences + game_state mis à jour |

### Phase 5 – DISCUSSION

| Élément | Description |
|---------|-------------|
| **Déclencheur** | Fin de la Résolution |
| **Entrée** | Résultats du tour |
| **Actions** | Chat textuel libre entre joueurs |
| **Timer** | Configurable (60s, 90s, 120s...) |
| **Option** | Bouton "Prêt" pour raccourcir si tous d'accord |
| **Sortie** | Passage au tour suivant |

### Phase 6 – FINALE

| Élément | Description |
|---------|-------------|
| **Déclencheur** | Condition de fin atteinte (voir end_conditions) |
| **Actions moteur** | 1. L'IA génère le climax narratif |
|  | 2. Révélation de tous les rôles secrets |
|  | 3. Calcul du résultat (victoire/défaite/score) |
|  | 4. L'IA génère un épilogue personnalisé |
| **Sortie** | Écran de fin avec résumé de la partie |

---

## 3. Game State (État du jeu universel)

Le game_state est l'objet central que le moteur maintient et envoie à l'IA à chaque phase :

```json
{
  "session_id": "abc123",
  "scenario": "tribunal",
  "current_round": 3,
  "max_rounds": 6,
  "phase": "action",

  "players": [
    {
      "id": "player_1",
      "name": "Zahid",
      "role": "avocat_defense",
      "secret_info": "Vous savez que l'accusé était au bar ce soir-là",
      "status": "alive",
      "custom_data": {}
    }
  ],

  "public_state": {
    "narrative_history": [
      { "round": 1, "text": "Le juge ouvre la séance..." },
      { "round": 2, "text": "Le premier témoin s'avance..." }
    ],
    "revealed_info": ["Le couteau a été trouvé dans la cuisine"],
    "resources": {}
  },

  "private_states": {
    "player_1": {
      "known_info": ["Vous avez vu l'accusé au bar à 22h"],
      "objective": "Faire acquitter l'accusé",
      "resources": {}
    }
  },

  "actions_history": [
    {
      "round": 1,
      "player": "player_1",
      "action": "interroger_temoin",
      "result": "Le témoin hésite et se contredit"
    }
  ],

  "end_conditions_met": false
}
```

---

## 4. Scenario Pack (Configuration par scénario)

Chaque scénario est défini par un **Scenario Pack** JSON qui configure le moteur :

```json
{
  "id": "tribunal",
  "name": "TRIBUNAL",
  "description": "Procès fictif avec rôles cachés",
  "version": "1.0",

  "settings": {
    "min_players": 4,
    "max_players": 8,
    "rounds": 5,
    "discussion_enabled": true,
    "discussion_timer_seconds": 90,
    "action_timer_seconds": 60,
    "action_mode": "individual"
  },

  "roles": [
    {
      "id": "juge",
      "name": "Le Juge",
      "team": "neutral",
      "count": 1,
      "description": "Vous présidez le procès. Vous cherchez la vérité.",
      "secret": "Vous avez un lien personnel avec la victime."
    },
    {
      "id": "avocat_defense",
      "name": "Avocat de la défense",
      "team": "defense",
      "count": 1,
      "description": "Défendez l'accusé coûte que coûte."
    },
    {
      "id": "procureur",
      "name": "Le Procureur",
      "team": "accusation",
      "count": 1,
      "description": "Prouvez la culpabilité de l'accusé."
    },
    {
      "id": "temoin",
      "name": "Témoin",
      "team": "variable",
      "count": "fill",
      "description": "Vous avez vu quelque chose cette nuit-là..."
    }
  ],

  "resources": [],

  "phases_override": {
    "round_1": { "name": "Ouverture du procès", "action_mode": "designated" },
    "round_2": { "name": "Audition des témoins", "action_mode": "individual" },
    "round_3": { "name": "Présentation des preuves", "action_mode": "individual" },
    "round_4": { "name": "Plaidoiries", "action_mode": "individual" },
    "round_5": { "name": "Verdict", "action_mode": "vote" }
  },

  "end_conditions": [
    { "type": "max_rounds", "value": 5 },
    { "type": "vote_reached", "target": "verdict" }
  ],

  "ai_system_prompt": "Tu es le Maître du Jeu d'un procès fictif. Tu incarnes le narrateur omniscient qui anime le procès. Tu génères les scènes, les témoignages de PNJ, les preuves, et les rebondissements. Tu ne révèles jamais les rôles secrets. Tu maintiens le suspense. Tu adaptes l'histoire aux actions des joueurs. Format : narration immersive, 2e personne du pluriel, paragraphes courts."
}
```

### Exemple pour DEEP (sous-marin) :

```json
{
  "id": "deep",
  "name": "DEEP",
  "description": "Survie en sous-marin",

  "settings": {
    "min_players": 3,
    "max_players": 6,
    "rounds": 8,
    "discussion_enabled": true,
    "discussion_timer_seconds": 60,
    "action_timer_seconds": 45,
    "action_mode": "vote"
  },

  "roles": [
    {
      "id": "capitaine",
      "name": "Capitaine",
      "team": "crew",
      "count": 1
    },
    {
      "id": "ingenieur",
      "name": "Ingénieur",
      "team": "crew",
      "count": 1
    },
    {
      "id": "matelot",
      "name": "Matelot",
      "team": "crew",
      "count": "fill"
    }
  ],

  "resources": [
    { "id": "oxygen", "name": "Oxygène", "initial": 100, "min": 0, "max": 100, "decay_per_round": 12 },
    { "id": "energy", "name": "Énergie", "initial": 80, "min": 0, "max": 100, "decay_per_round": 8 },
    { "id": "hull", "name": "Coque", "initial": 100, "min": 0, "max": 100, "decay_per_round": 0 },
    { "id": "depth", "name": "Profondeur", "initial": 200, "min": 0, "max": 1000, "decay_per_round": 0 }
  ],

  "end_conditions": [
    { "type": "resource_zero", "resource": "oxygen", "result": "defeat" },
    { "type": "resource_zero", "resource": "hull", "result": "defeat" },
    { "type": "resource_zero", "resource": "depth", "result": "victory" },
    { "type": "max_rounds", "value": 8, "result": "defeat" }
  ],

  "ai_system_prompt": "Tu es l'ordinateur de bord du sous-marin Abyss-7. Tu narres les événements de manière immersive. À chaque tour, tu génères une crise (fuite, panne, créature, etc.) et proposes 3-4 options de survie. Chaque option affecte les ressources (oxygène, énergie, coque, profondeur). L'objectif de l'équipage est de remonter à la surface (profondeur = 0). Sois dramatique mais juste."
}
```

---

## 5. Communication IA – Prompt universel

Le moteur construit le prompt envoyé à l'IA ainsi :

```
[SYSTEM PROMPT du Scenario Pack]

---

ÉTAT ACTUEL DU JEU :
- Tour : {current_round} / {max_rounds}
- Phase : {phase}
- Joueurs : {liste avec rôles}
- Ressources : {si applicable}
- Historique narratif : {résumé des tours précédents}
- Dernières actions des joueurs : {actions du tour}

---

INSTRUCTIONS POUR CE TOUR :
- Génère la narration de la phase {phase}
- Propose {nb_options} options d'action
- Chaque option doit avoir : un label court, une description, et un indice de risque
- Respecte le format JSON suivant pour les options :

{
  "narration": "Texte narratif immersif...",
  "options": [
    { "id": "opt_1", "label": "...", "description": "...", "risk": "low|medium|high" },
    ...
  ],
  "private_messages": {
    "player_id": "Message visible uniquement par ce joueur..."
  }
}
```

---

## 6. Résumé : ce qui est COMMUN vs ce qui est SPÉCIFIQUE

| COMMUN (moteur) | SPÉCIFIQUE (scenario pack) |
|---|---|
| Game Loop (6 phases) | Prompt système de l'IA |
| Session Manager (lobby, invitations) | Rôles et distribution |
| WebSocket (synchronisation) | Ressources / jauges |
| Choice Engine (vote, individuel, timer) | Conditions de fin |
| Chat entre joueurs | Overrides de phases |
| Game State management | Nombre de tours |
| Envoi des prompts à l'IA | Action mode par phase |
| Affichage narration + choix | Thème visuel |
| Écran de fin + révélations | Règles spécifiques |
