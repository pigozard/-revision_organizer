# Revision Organizer

Une application web Rails permettant aux étudiants de réviser leurs cours par blocs thématiques grâce à un assistant IA intégré.

---

## Fonctionnalités

- **Blocs de cours** : chaque bloc représente un thème ou chapitre du programme (ex. Associations & Validations Rails)
- **Chat IA** : chaque utilisateur peut ouvrir une conversation sur un bloc et poser des questions à un LLM contextualiser avec le contenu du bloc
- **Fiches de révision** : pages de révision structurées par bloc
- **Authentification** : inscription / connexion via Devise

---

## Stack technique

| Couche | Technologie |
|---|---|
| Backend | Ruby 3.3.5 / Rails 7.1 |
| Base de données | PostgreSQL |
| Frontend | Bootstrap 5, Hotwire (Turbo + Stimulus) |
| IA | [ruby_llm](https://github.com/codealchemy/ruby_llm) |
| Stockage images | Cloudinary + Active Storage |
| Auth | Devise |

---

## Modèles de données

```
User ──< Chat >── Bloc ──< Revision
                   │
                   └──< Message
```

- `Bloc` : contenu du cours + prompt système pour l'IA
- `Chat` : session de conversation entre un utilisateur et un bloc
- `Message` : échanges utilisateur / assistant au sein d'un chat
- `Revision` : fiche de révision associée à un bloc

---

## Installation

### Prérequis

- Ruby 3.3.5
- PostgreSQL
- Un compte [Cloudinary](https://cloudinary.com)
- Une clé API pour le LLM (OpenAI ou compatible)

### Setup

```bash
git clone https://github.com/pigozard/-revision_organizer.git
cd -revision_organizer

bundle install
rails db:create db:migrate db:seed
```

### Variables d'environnement

Créer un fichier `.env` à la racine :

```env
CLOUDINARY_URL=cloudinary://...
OPENAI_API_KEY=sk-...
```

### Lancer l'application

```bash
bin/dev
```

L'application est accessible sur [http://localhost:3000](http://localhost:3000).

---

## Structure des routes

| Méthode | Chemin | Description |
|---|---|---|
| GET | `/` | Liste des blocs |
| GET | `/blocs/:id` | Détail d'un bloc |
| POST | `/blocs/:bloc_id/chats` | Créer un nouveau chat |
| GET | `/chats/:id` | Voir un chat |
| POST | `/chats/:chat_id/messages` | Envoyer un message |
| GET | `/revisions/page1-4` | Fiches de révision |

---

Projet réalisé dans le cadre du bootcamp [Le Wagon](https://www.lewagon.com).
