Bloc.destroy_all

Bloc.create!([{
  name: "Active Record",
  content: "# Pour diviser le contenu en sections logiques

ACTIVE_RECORD_INTRO = <<~TEXT
  Old School: SQL commands in code
  We did it. Painful

  What we don't want to write:
  DB = SQLite3::Database.new("db/database.sqlite3")
  DB.execute("INSERT INTO restaurants (name) VALUES ('La Tour d\\'Argent')")

  What we want to write:
  restaurant = Restaurant.new(name: "La Tour d'Argent")
  restaurant.save

  Both will result in adding a row in database with id and name columns.

  We'll use the Active Record Pattern (2003)
  The active record pattern is a pattern found in software that stores its data in relational databases.
  The interface of an object conforming to this pattern would include functions such as save, destroy,
  plus instance variables that correspond to the columns in the underlying database table.

  An object is represented as a row of a table in a relational database.
TEXT

ACTIVE_RECORD_SETUP = <<~TEXT
  Active Record - Setup

  Let's start from a boilerplate:
  mkdir -p ~/code/lewagon/lectures && cd $_
  gh repo clone lewagon/active-record-boilerplate
  cd active-record-boilerplate
  rm -rf .git
  bundle install
  rake

  rake is a task launcher. All tasks are defined in a Rakefile.

  rake -T shows available tasks:
  - rake rubocop (Look for style guide offenses)
  - rake spec (Run RSpec code examples)
TEXT

DATABASE_CREATION = <<~TEXT
  Create the database

  First specify a database in config/database.yml:
  development:
    adapter: sqlite3
    database: db/development.sqlite3

  Then create it:
  rake db:create

  To drop the database:
  rake db:drop
TEXT

MIGRATIONS = <<~TEXT
  Migrations

  rake db:create created a database with an empty schema.
  You need to add tables using migrations.

  Each time you change your schema (add/remove table or column),
  you need to create a schema migration.

  Table creation migration:
  TIMESTAMP=`rake db:timestamp`
  touch db/migrate/${TIMESTAMP}_create_restaurants.rb

  class CreateRestaurants < ActiveRecord::Migration[7.0]
    def change
      create_table :restaurants do |t|
        t.string :name
        t.string :address
        t.timestamps
      end
    end
  end

  Run migrations with:
  rake db:migrate
TEXT

ACTIVE_RECORD_MODEL = <<~TEXT
  Model

  Create a Restaurant class for the restaurants table:

  class Restaurant < ActiveRecord::Base
  end

  Active Record naming convention:
  - Table name: lower_snake_case, plural form
  - Model class name: UpperCamelCase, singular form

  Rails is full of Convention over Configuration.
TEXT

CRUD_OPERATIONS = <<~TEXT
  CRUD Operations

  Creating a record:
  restaurant = Restaurant.new(name: "La Tour d'Argent", address: "15 Quai de la Tournelle")
  restaurant.save

  Retrieving all records:
  restaurants = Restaurant.all

  Counting records:
  Restaurant.count

  Retrieving a specific record:
  restaurant = Restaurant.find(1)
  restaurant.name
  restaurant.address

  Updating a record:
  restaurant = Restaurant.find(1)
  restaurant.address = '14 Quai de la Tournelle'
  restaurant.save

  Deleting a record:
  restaurant = Restaurant.find(1)
  restaurant.destroy

  Filtering records:
  restaurants = Restaurant.where(rating: 3)
  restaurants = Restaurant.where("name LIKE ?", "%tour%")

  Finding by attribute:
  restaurant = Restaurant.find_by(name: "La Tour d'Argent")

  First and Last:
  Restaurant.first
  Restaurant.last
TEXT

ASSOCIATIONS = <<~TEXT
  Associations

  A doctor has many interns:

  class Doctor < ActiveRecord::Base
    has_many :interns
  end

  class Intern < ActiveRecord::Base
    belongs_to :doctor
  end

  Migration for interns table:
  create_table :interns do |t|
    t.string :first_name
    t.string :last_name
    t.references :doctor, foreign_key: true
    t.timestamps
  end

  Usage:
  doctor = Doctor.new(first_name: "Gregory", last_name: "House")
  doctor.save
  intern = Intern.new(first_name: "Allison", last_name: "Cameron")
  intern.doctor = doctor
  intern.save

  Retrieve interns:
  doctor.interns
TEXT

MANY_TO_MANY = <<~TEXT
  Many-to-Many Associations

  Doctor has many patients through consultations:

  class Doctor < ActiveRecord::Base
    has_many :consultations
    has_many :patients, through: :consultations
  end

  class Patient < ActiveRecord::Base
    has_many :consultations
  end

  class Consultation < ActiveRecord::Base
    belongs_to :patient
    belongs_to :doctor
  end

  Then you can do:
  doctor.patients
TEXT

VALIDATIONS = <<~TEXT
  Validations

  Check validity before saving to database.

  Presence validation:
  class Doctor < ActiveRecord::Base
    validates :last_name, presence: true
  end

  Checking validity:
  doctor = Doctor.new(first_name: "Gregory")
  doctor.valid? # => false
  doctor.errors.messages # => { last_name: ["can't be blank"] }

  Uniqueness validation:
  validates :last_name, uniqueness: true
  validates :first_name, uniqueness: { scope: :last_name }

  Length validation:
  validates :last_name, length: { minimum: 3 }

  Format validation:
  validates :email, format: { with: /\A.*@.*\.com\z/ }
TEXT

LLM_INTRO = <<~TEXT
  Large Language Models

  How do they work?
  LLMs are AI systems trained on massive text data to predict words and generate language,
  using models like transformers.

  What can they do?
  They can code, summarize, chat, and more. LLMs are reshaping how we work, learn,
  and create across all industries.

  Why should you care?
  LLMs unlock smarter features: chatbots, search, content generation, support —
  and reshape how users interact with products.
TEXT

RUBY_LLM_SETUP = <<~TEXT
  Ruby LLM Setup

  Install the gem:
  gem "ruby_llm", "~> 1.2.0"
  bundle install

  Configure:
  touch config/initializers/ruby_llm.rb

  RubyLLM.configure do |config|
    config.openai_api_key = ENV["OPENAI_API_KEY"]
  end

  Basic usage:
  chat = RubyLLM.chat
  response = chat.ask("What is Ruby on Rails?")
  puts response.content
TEXT

LLM_TOOLS = <<~TEXT
  Tools - Extend LLM capabilities

  Tools allow AI models to interact with external systems by calling your Ruby code.

  Example Weather Tool:
  class WeatherTool < RubyLLM::Tool
    description "Gets current weather for a location"
    param :latitude, desc: "Latitude (e.g., 52.5200)"
    param :longitude, desc: "Longitude (e.g., 13.4050)"

    def execute(latitude:, longitude:)
      url = "https://api.open-meteo.com/v1/forecast?latitude=#{latitude}&longitude=#{longitude}"
      response = URI.parse(url).read
      JSON.parse(response)
    end
  end

  Usage:
  ruby_llm_chat = RubyLLM.chat
  response = ruby_llm_chat.with_tool(WeatherTool).ask("What is the weather in Paris?")
TEXT

PROMPT_ENGINEERING = <<~TEXT
  Prompt Engineering

  The practice of designing inputs to get the best outputs from LLMs.

  Four main areas:
  1. Persona - Tell the model who it should act as
  2. Context - Provide background information
  3. Task - Give a clear, specific goal
  4. Format - Specify the output format (Markdown, JSON, etc.)

  Example:
  You are an experienced chef, specialised in French gastronomy.
  I am a beginner cook, looking to learn simple recipes.
  Guide me into making a classic French oeuf mayo.
  Provide step-by-step instructions in bullet points, using Markdown.

  DO:
  - Be clear and task-focused
  - Set a persona for expertise and tone
  - Give relevant context
  - Specify output format
  - Use examples (few-shot prompting)

  AVOID:
  - Vague or open-ended prompts
  - Overly broad goals
  - Negative phrasing
  - Stuffing too much into one prompt
TEXT

DEVISE_SETUP = <<~TEXT
  Devise - Authentication gem for Rails

  Installation:
  gem "devise"
  bundle install
  rails generate devise:install

  Configuration:
  1. Set default_url_options in config/environments/development.rb
  2. Define root_url in config/routes.rb
  3. Add flash messages to application.html.erb

  Generate User model:
  rails generate devise User
  rails db:migrate

  Helpers:
  - user_signed_in? (returns true/false)
  - current_user (returns User instance or nil)

  Protect routes:
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  end

  Skip authentication for specific actions:
  skip_before_action :authenticate_user!, only: :home
TEXT

ACTION_CABLE = <<~TEXT
  Action Cable - WebSocket for Rails

  Unlike HTTP, WebSocket is bidirectional.
  A message created on the server can be broadcast to subscribed clients.

  Setup with Solid Cable:
  gem "solid_cable"
  bundle install
  rails solid_cable:install:migrations
  rails db:migrate

  Configure in config/cable.yml:
  development:
    adapter: solid_cable
    silence_polling: true

  Subscribe client to channel:
  <%= turbo_stream_from @chat %>

  Broadcast message:
  broadcast_append_to chat, target: "messages", partial: "messages/message"

  Stream LLM responses:
  RubyLLM.chat.ask("Question") do |chunk|
    next if chunk.content.blank?
    print chunk.content
    broadcast_replace(message)
  end
TEXT

GIT_COLLABORATION = <<~TEXT
  Git Branching & Collaboration

  One rule: one feature == one branch

  Working on a new branch:
  git checkout -b customize-form
  git add .
  git commit -m "meaningful message"
  git push origin customize-form

  Creating a Pull Request:
  - Push your branch to GitHub
  - Click "Create Pull Request"
  - Add clear title and description
  - Request review from teammates

  Getting master up to date:
  git checkout master
  git pull origin master
  git sweep (clean up unused branches)
  bundle install
  rails db:migrate

  Two rules:
  1. Never commit directly to master
  2. Always make sure git status is clean before pull, checkout or merge
TEXT

PRODUCT_DESIGN = <<~TEXT
  Product Design Process

  1. Product Pitch
  Define: Need, Target, Goal, Differentiators

  Template: "For [users] who need to [action] and want to [goal],
  they choose [product] because [differentiator]"

  2. Core User Journey
  All steps to complete the main task

  3. User Flow
  Visual representation of the user journey

  4. UI Kit
  Minimal lo-fi components (buttons, cards, forms, etc.)

  5. Wireframe
  Lo-fi mockup of each page

  6. Prototype
  Connect pages for a live demo
TEXT",
  bloc_prompt: "You are currently questioning the student about the block: “Active Record basics.”
Ask questions only about this block and the course excerpts provided.
Start with very simple questions, then increase the difficulty slightly.

Active Record course content:

Active Record = ORM that maps DB tables ↔ Ruby classes

Convention: table users → model User

Main methods: .create, .find, .where, .update, .destroy

Validations: validates :email, presence: true, uniqueness: true

Associations: has_many, belongs_to, has_many :through

Migrations: add_column, remove_column, change_column

Examples of questions to ask:

Which method is used to create a user?

How do you validate the presence of an email?

Which association corresponds to “A restaurant has many dishes”?

What is CRUD?

PROMPT"
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
