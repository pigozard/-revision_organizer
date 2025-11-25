# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Bloc.create!([{
  name: "Bloc 1",
  content: "ceci est un content",
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
