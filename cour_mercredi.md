Les liens https://www.grafikart.fr/tutoriels/crud-841
https://guides.rubyonrails.org/getting_started.html

#edit l'article :
min 11 : création du code,
min 13 code complet

il faut récupéré larticle dans le controler dans la def update
et faire update le post
_@post.update(params[:post])_

dans les params:
-le require permet de vérifier quune information y est et elle me la retourne
-le permit permet d'autoriser la manipulation des champs
_puts params.require(:post).permit(:name,:content).inspect_

ensuite pour upate nous atribuons une variable sur la ligne sur dessus et on met:
_@post.update(variable)_

et aprés on redirige vers la page que l'on veut avec
_redirect_to_


#delete article :
min 25
mettre une fenetre de valdiation etes vous sur? il faut utiliser data_confirm:
_<a href="<%=post_path(post.id)%>" class="btn btn-danger" data-confirm="Etes-vous sur de vouloir supprimer ce post?">Supprimer</a>_

aprés le data confirm si on veut appliquer une méthode particulière à cette action notamment faire appel à la methode delete, il nous faut rajouter
_data-method="DELETE"_ (la méthode c'est celle du REST établit par resources :posts)
par la suite il faut créer la méthode destroy avec un
_@post.destroy_

#aspect visuel dans HTML:
min37
_placeholder:_ me permet de mettre dans l'encadrer d'écriture le nom en grisé de ce qu'il doit remplir

#pour aller plus vite:
le scaffold va créer rapidement un système de modification de contenue basique, ceci va faire une migration
#$rails g scaffold la_table les_champs
