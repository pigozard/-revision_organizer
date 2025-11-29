Bloc.destroy_all

Bloc.create!([{
  name: "Analyser les besoins utilisateur et concevoir une application web",
  content: "1) Quelle commande permet de créer un nouvel enregistrement ?
   Réponse : create

2) Quelle commande permet d'afficher tous les enregistrements ?
   Réponse : all

3) Quelle commande permet de récupérer un élément grâce à son ID ?
   Réponse : find

4) Quelle commande permet de modifier un enregistrement existant ?
   Réponse : update

5) Quelle commande permet de supprimer un enregistrement ?
   Réponse : destroy",
  bloc_prompt: "ceci est un prompt"
},
{
  name: "Planifier et superviser le développement d’
une application web en
équipe",
  content: "ceci est un content",
  bloc_prompt: "ceci est un prompt"
},
{
  name: "Développer le front-end et le back-end d’
une application web",
  content: "ceci est un content",
  bloc_prompt: "ceci est un prompt"
},
{
  name: "Déployer, maintenir et améliorer une application web",
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
