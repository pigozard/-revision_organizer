Bloc.destroy_all

Bloc.create!([{
  name: "Active Record",
  content: "Old School: SQL commands in code
We did it. Painful Both will result in adding a row in database: We’ll use the Active Record Pattern (2003)The active record pattern is a pattern found in software that stores its data in relational databases. […] The interface of an object conforming to this pattern would include functions such as [ save , destroy ], plus [instance variables] that correspond […] to the columns in the underlying database table.
Wikipedia An object is represented as a row of a table in a relational database. Create the database First specify a database Then create it, run this in your terminalDrop the database To get rid of your database and all its data (!!) Migrations rake db:create created a database with an empty schema.
You need to add tables, the one you figured out with kitt.lewagon.com/db Let’s model a Restaurant! Each time you change your schema (add / remove table), (add / remove column), you need to create a schema migration.
It’s a change in the structure of your schema, not the data. Table creation migration Active Record helps us to write schema migration with ruby, not SQL. Run the migrations
Active Record figures out which migration to run on your schema (the ones not already run). Oops, the client wants ratings!
Add a column migration Schema is ready! Model We don’t have a Restaurant class yet for our restaurants table. Active Record naming convention Remember the convention
Table name: lower_snake_case, plural form (store several rows) Model class name: UpperCamelCase, singular form (mapped to 1 row) Rails is full of Convention over Configuration.
Unleash the magic Creating a record Where’s the code? A Java Developer Retrieving all records Calling all - a class method - on your model gives you an ActiveRecord::Relation (similar to Array ) of all your records for this model. Elements of this ‘array’ are instances of the model class Restaurant . Counting records of a table
(Faster than Restaurant.all.length , why?) Retrieving a specific record The restaurant variable is an instance of the model class Restaurant .
Updating an existing record Deleting a record Filtering records As for the all class method, where returns an ActiveRecord::Relation (similar to Array ) of class model instances. where like
Finding by attribute find => Returns one record First and Last Depends on the primary key ( id column).Seeds The Rails Way To run the seed, open your terminal:
Easily fake data See alsoFaker::Address / Faker::Name / Faker::Lorem Faker::Business / Faker::Commerce / Faker::Company Faker::Internet / Faker::Number / Faker::PhoneNumber https://github.com/stympy/faker
Growth Hacking Web scrapping (nokogiri) or API calls (rest-client) Fetch GitHub repos from @lewagon Browser extension to install: JSON Formatter on Chrome.
Read this great doc Active Record Basics Skip the chapter 6 (Validations) and 7 (Callbacks) for now. Your turn! Playboard	A Bookmarks	 Needs attention	 Rehearse
Active Record Basics DB (ActiveRecord Basics) Qu’est-ce qu’une migration ? On crée une migration quand on a besoin de modifier le schéma de notre base de données (ajouter/supprimer une table, ajouter/supprimer une colonne, etc.).
C’est un changement de la structure de la base de données, qui n’a pas d’impact sur les données. Play this one again DB (ActiveRecord Basics)
Comment obtient-on un enregistrement spécifique d’un modèle Active Record ? En appelant .find(id) sur ton modèle ! Si on n’a pas l’id de l’enregistrement que l’on cherche, on peut également appeler .find_by(attribut : valeur) :
Play this one again DB (ActiveRecord Basics) Imaginons que tu aies déjà créé la base de données avec une table doctors (docteurs), comment ajouterais-tu un nouveau docteur dans ta base de données ? En créant une instance de Doctor (docteur) et en appelant la méthode #save dessus :
Ou directement avec la méthode de classe create: Play this one again DB (ActiveRecord Basics)
Tu crées une nouvelle migration. Quelle commande Terminal dois-tu utiliser pour l’exécuter ? En exécutant la commande suivante dans le terminal :DB (ActiveRecord Basics)
Comment obtient-on le nombre d’instance d’un modèle Active Record donné ?En appelant .count sur ton modèle !
DB (ActiveRecord Basics)peut également passer une string en argument à la méthode de classe .where:Et enfin : Play this one again
DB (ActiveRecord Basics) Quelle est la requête SQL générée par Doctor.all ? N’oublie pas que chaque requête Active Record génère une requête SQL que tu peux lire dans les logs de ton application depuis ton terminal !
Play this one again DB (ActiveRecord Basics) Comment les tables de base de données doivent-elles être nommées pour Active Record ?
Le nom de ta table doit être pluriel en lower_snake_case. Par exemple : sports_cars, doctors, restaurants Le mapping magique 1:1 d’Active Record entre les enregistrements de ta base de données et les instances de tes modèles
dépend complètement de cette convention ! Play this one again DB (ActiveRecord Basics)Quelle est la requête SQL générée par Doctor.find_by(age: 42, specialty: 'Dentist') ?
N’oublie pas que chaque requête Active Record génère une requête SQL que tu peux lire dans les logs de ton application depuis ton terminal !
Play this one again DB (ActiveRecord Basics) Comment les modèles Active Record doivent-ils être nommés ?
Le nom de la classe de ton modèle doit être au singulier en UpperCamelCase. Par exemple : SportsCar, Doctor, Restaurant
Le mapping magique 1:1 d’Active Record entre les enregistrements de ta base de données et les instances de tes modèles
dépend complètement de cette convention ! Play this one again DB (ActiveRecord Basics)
Complète la migration suivante pour créer une table doctors (docteurs) avec un nom (name) et une spécialité (specialty).
Quelle tâche rake dois-tu exécuter dans ton terminal pour supprimer ta base de données ?
ttention, ceci supprimera ton schéma de base de données (structure) ainsi que tes données ! Play this one againDB (ActiveRecord Basics)
Quelle tâche rake dois-tu exécuter dans ton terminal pour créer ta base de données ?DB (ActiveRecord Basics)
Qu’est-ce qu’Active Record ? Active Record est un patron de conception (« design pattern » en anglais), qui stocke tes objets dans une base de données relationnelle.
Il abstrait les requêtes SQL et comprend un ensemble de méthodes et outils simples pour gérer ta base de données en Ruby / ligne de commande.
Quelle est la différence entre ::find_by et ::where ::find_by retourne le premier enregistrement qui remplit la condition, tandis que ::where retourne tous les enregistrements qui remplissent la condition, dans un array.
N’oublie pas que ::where retourne toujours un array (même s’il n’y qu’un seul enregistrement ou aucun), et que
::find_by retourne une instance ou nil ! Play this one again DB (ActiveRecord Basics)
Complète la migration suivante pour ajouter une colonne âge (age) à la table doctors (docteurs).DB (ActiveRecord Basics)
Comment obtient-on toutes les instances d’un modèle Active Record donné ?En appelant .all sur ton modèle !DB (ActiveRecord Basics)
Par quoi le nom d’un fichier de migration doit-il toujours commencer ? Un timestamp (« horodatage ») (format : YYYYMMDDHHMMSS) ! Par exemple :
db/migrate/20140725164644_create_restaurants.rb Le timestamp est nécessaire pour garder une trace des migrations qui doivent être exécutées lors de l’exécution de la commande rake db:migrate. Il permet également de classer les fichiers de migration par ordre chronologique dans le projet.
DB (ActiveRecord Basics)
Comment obtient-on la première instance d’un modèle Active Record ? En appelant .first sur le modèle.
B (ActiveRecord Basics)
Qu’est-ce qu’une migration ? On crée une migration quand on a besoin de modifier le schéma de notre base de données (ajouter/supprimer une table, ajouter/supprimer une colonne, etc.).
C’est un changement de la structure de la base de données, qui n’a pas d’impact sur les données. Play this one againKick-start terminal instructions
Contexte et objectifs
  T’entraîner à utiliser ta première tâche rake pour créer ta base de données.
  Souviens-toi que tu as désormais des tâches rake à ta disposition pour manipuler ta base de données : Spécifications
Avant de commencer à modifier la structure du schéma de base de données, entraîne-toi à créer une base de données. Ne t’embête pas à créer des tables et ne t’inquiète pas d’avoir des modèles. Pour le moment, contente-toi de créer la base de données !
Enseignements clés Comprendre ce que chacune des tâches rake listées ci-dessus permet de faire, et utiliser la bonne tâche pour créer ta base de données Migrations Terminal Instructions	Last rake run
Contexte et objectifs Comprendre le concept de la migration de schéma Apprendre à exécuter des migrations sur ta base de données en utilisant des tâches rake.
Spécifications Cet exercice porte sur les migrations. On n’a pas de modèle pour le moment, donc tu vas devoir coder les migrations pour créer ton schéma de base de données (souviens-toi que le schéma est la structure de la DB, composée de tables et de colonnes, pas de données). Tu veux créer le schéma d’une base de données qui hébergera un clone de Hacker News, un célèbre site Web qui partage des liens à propos des technologies et des startups. Tu as besoin d’une table posts pour stocker les posts (avec un titre et une URL).
Dans db/migrate , on a créé un fichier 20141025152200_create_posts.rb qui contient une classe de migration Active Record. Les fichiers de migration ont toujours le format
suivant : yyyymmddhhmmss_nom_de_la_migration.rb . Le timestamp dans le fichier est très important : il permet à rake db:migrate de savoir quelles migrations n’ont pas encore été exécutées. Migration pour créer une table
Écris le code dans 20141025152200_create_posts.rb pour créer la table posts . Ta table posts doit contenir les colonnes suivantes :une string title une string url les timestamps created_at et updated_at
Exécute ensuite cette migration avec rake db:migrate . Vérifie que ta table a bien été créée.
Tu vois autre chose que ta table posts ? Il s’agit de la tuyauterie d’Active Record 😊 Tu sais à quoi elle sert ?
Migration pour actualiser une table Retourne au cours et lis la documentation sur les migrations Active Record. Tu verras comme il est facile d’effectuer des migrations sur Rails. Mais on n’a pas encore abordé Rails ;) alors tu vas devoir créer tes fichiers de migration manuellement.
Utilise la tâche rake db:timestamp pour obtenir un timestamp correct pour le nom de ton fichier de migration. Écris une nouvelle migration dans un nouveau fichier db/migrate/ pour ajouter une nouvelle colonne à la table posts .
Appelle la colonne votes de type integer avec une valeur par défaut de 0 : un post d’utilisateur n’a pas de vote au moment de sa création.
Souviens-toi de ce qu’on a dit à propos des noms de fichier de migration ! Le format est très important.
Exécute ensuite cette migration avec rake db:migrate .
Enseignements clés
Tu dois maintenant avoir compris que les migrations sont liées à des changements dans la structure du schéma (c’est-à-dire les tables et leurs colonnes).Models
Terminal Instructions	Last rake run
Rep ort an issue
Contexte et objectifs
Tu sais maintenant comment utiliser les migrations pour actualiser le schéma de base de données. On va pouvoir utiliser la base de données pour insérer quelques lignes et faire des requêtes. Pour cela, on va continuer à travailler avec notre clone d’Hacker News.
Avant de commencer cet exercice, pense à lire le guide de démarrage d’Active Record.
Configuration
Comme il s’agit d’un nouvel exercice, il faut que tu crées une nouvelle base de données dans le dossier db :
On t’a déjà donné le fichier de migration (regarde le fichier db/migrate ). Il doit correspondre au fichier que tu as créé à partir de zéro dans l’exercice précédent !
Vérifie que le schéma est en place en ouvrant la base de données avec sqlite3 :
Spécifications
Créer le modèle de classe
Ajoute un modèle de classe à ta table posts dans le dossier app/models .
Utiliser le modèle pour exécuter des requêtes
On t’a donné le même squelette d’application que vendredi dernier. Tu peux le lancer avec :
Ouvre app/controllers/posts_controller.rb et implémente les méthodes. Rappel : n’écris pas de SQL. Contente-toi d’utiliser les méthodes Active Record avec ton modèle de classe. Il n’y a pas
de rake pour tester la deuxième partie de l’exercice : tu devras lancer ton application dans le terminal pour la tester.
Enseignements clés
Qu’est-ce qu’un mapping objet-relationnel (Object-relational mapping, ORM) ? Qu’est-ce que cela simplifie ?
De quelle convention de nommage le mapping Active Record dépend-il ? D’où la magie vient-elle ?
As-tu remarqué qu’il est beaucoup plus pratique d’utiliser Active Record que d’écrire tout le SQL toi-même ?
Seed API
Kick-start terminal instructions
Contexte et objectifs
La gem faker est sympa, mais ce serait encore mieux de pouvoir importer directement
de vraies données depuis Hacker News, non ? Et bien, c’est possible ! On peut le faire grâce à leur API.
Configuration
On va utiliser le client rest pour appeler l’API d’Hacker News. Commence par installer la gem :
Tu peux réutiliser la séquence drop create migrate seed pour tester ta seed.
Une fois que tu as géré la seed, tu peux regarder les lignes que tu viens d’insérer avec rake db:seed en utilisant les requêtes SQL traditionnelles :
Spécifications
Ouvre le fichier db/seeds.rb et écris du code pour insérer 10 posts, (Pas 100, sinon on risque de se faire bannir de l’API) à partir des données de l’API d’Hacker News.
Tu peux appeler l’endpoint de l’API https://hacker-news.firebaseio.com/v0/topstories.json. Cela te donnera un array des 100 derniers id de posts. Puis pour les 10 premiers (PAS 100 !) id, tu dois appeler l’API pour obtenir les détails d’un post.
À titre d’exemple, si tu veux obtenir des détails sur le post 20916749 , tu dois appeler https://hacker-news.firebaseio.com/v0/item/20916749.json
Seed Faker
Contexte & Objectifs
Maintenant que tu es familier avec les migrations et les modèles, il est temps pour un scénario de la vie réelle. Comment testes-tu si ta base de données fonctionne, si tu n’as pas de données ?
Pour ce faire, nous devons créer un tas de données que nous pouvons utiliser pour initialiser notre base de données. Cela s’appelle une seed .
Alimenter ta base de données
Pour ajouter des données après la création d’une base de données, tu peux commencer par remplir le fichier db/seeds.rb avec quelques commandes Ruby que tu aimerais exécuter. Par exemple, si tu veux créer 3 publications :
Ou si tu veux en créer 10 :
Tu peux ensuite exécuter ce fichier en exécutant dans ton terminal :
Données de test avec faker
Lorsque tu sèmes des données dans ta base de données, tu souhaites peut-être qu’elles ressemblent à de vraies données utilisateur sans avoir à trouver l’inspiration et à les écrire toi- même. Dans ce cas, tu peux utiliser la gemme faker pour générer des données fausses. Installons- la :
Tu peux ensuite l’utiliser dans ton fichier db/seeds.rb :
Explore la documentation de la gem faker pour trouver les modules appropriés parmis les nombreux proposés.
Réinitialisation de ta base de données
Voici une commande utile pour supprimer ta base de données, la recréer, migrer le schéma et la seed. Cela te fera gagner beaucoup de temps et tu l’utiliseras beaucoup lors des semaines de projet, c’est le moment de s’entraîner !
Une fois que tu as réinitialisé ta base de données, tu peux interroger ta base de données dans une rake console , par exemple avec :
Spécifications
Ouvre le fichier db/seeds.rb et écris du code pour insérer 100 publications, en utilisant des données fausses générées par la gem faker . Il y a plein d’options amusantes de faker là-dedans, alors sois créatif 😊.",
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
