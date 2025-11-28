Bloc.destroy_all

Bloc.create!([{
  name: "Active Record",
  content: "content = Active Record: ORM qui mappe objets Ruby vers tables SQL. Convention: table en snake_case pluriel, model en CamelCase singulier. Migrations (create_table, add_column, etc.) pour modifier schema. CRUD: .new + .save, .all, .find(id), .where(conditions), .update, .destroy. Relations: belongs_to, has_many, has_many through:. Validations: presence, uniqueness, length, format. Seeds avec Faker pour fake data.\n\nLLM & RubyLLM: gem pour interagir avec OpenAI/Anthropic. RubyLLM.chat.ask(prompt), .with_temperature(n), .with_instructions(system_prompt). Tokens = unités facturées, context window = limite tokens. Temperature contrôle créativité (0=déterministe, 1=créatif). Config: config.openai_api_key dans initializer.\n\nPrompt Engineering: 4 piliers - Persona (rôle du LLM), Context (infos utilisateur/situation), Task (objectif clair), Format (Markdown/JSON). Few-shot = donner exemples input/output. Itérer sur prompts pour affiner réponses. Éviter vague/négatif, être spécifique.\n\nTools & Agents: Tools = fonctions Ruby appelées par LLM (class < RubyLLM::Tool, param :name, def execute). .with_tool(MyTool) pour activer. Agents = LLM choisit tools, Workflows = ordre fixe. Tools permettent API calls, accès DB, actions utilisateur.\n\nWebSocket & ActionCable: streaming réponses LLM en temps réel. adapter: solid_cable (ou Redis prod). turbo_stream_from @chat pour subscribe. broadcast_append_to/broadcast_replace_to pour envoyer chunks. RubyLLM.chat.ask(prompt) { |chunk| broadcast }. dom_id(record) pour cibler élément DOM.\n\nDevise: gem auth Rails. rails g devise:install puis devise User puis db:migrate. Routes auto (/users/sign_in, sign_up, etc). Helpers: user_signed_in?, current_user. before_action :authenticate_user! pour protéger routes. devise_parameter_sanitizer.permit pour champs custom. rails g devise:views pour personnaliser vues.\n\nGit workflow: 1 feature = 1 branch. git checkout -b nom-branch, commit, push origin nom-branch. Pull Request sur GitHub pour review + merge dans master. Jamais commit direct sur master. git status clean avant pull/checkout/merge. Résoudre conflicts manuellement ou sur GitHub. Issues pour user stories, Projects pour Kanban.\n\nModels & Associations: Chat has_many :messages, belongs_to :user/challenge. Message belongs_to :chat. Challenge has_many :chats. System prompt stocké en DB (text column). generate_title_from_first_message avec LLM pour titre chat automatique.\n\nUX: Product Pitch = for [segment] who need [action] want [goal] choose [product] because [differentiator]. Core User Journey = steps pour need principal. User Flow = représentation visuelle. UI Kit = composants lo-fi. Wireframe = mockup pages. Prototype = pages connectées.",
  bloc_prompt: "ceci est un prompt"
},
{
  name: "Bloc 2",
  content: "ceci est un content",
  bloc_prompt: "ceci est un prompt"
},
{
  name: "Bloc 3",
  content: "ceci est un content",
  bloc_prompt: "ceci est un prompt"
},
{
  name: "Bloc 4",
  content: "ceci est un content",
  bloc_prompt: "ceci est un prompt"
}
])

Revision.create!([{
  title: "révision 1",
  content: "1234",
  bloc_id: 1
}
])
