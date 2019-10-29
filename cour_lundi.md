# README
Le cour:

liens: https://www.youtube.com/watch?v=VEm_zMEnajc&feature=youtu.be

Rails est un dossier ruby qui contient énormément de fichiers qui permettent de faire tourner une application web.

quand on lance
# $ rails new nom_de_lappli
Gemfile fait appels aux gem,

-app contient le html du dossier
-controller fait le chef d'orchestre
-les models permettent de gérer les tables (SQL)
-les asset contient les java scrip et css
-config contient les fichier de configuration comme route.rb (les route de notre application web), le lien avec les clé API si besoin dans initialize
-DB cest toute les base de données
-lib sont les librairie externe
-log contient les logs
-public contient des fichiers statique et public (ex: les images)
-test cest là ou on met nos test d'applications
-tmp sont les fichier de cache temporaire.
-vendor sont les code qu'on ne controle pas comme boostrap.

lancer server d'application rails permet d'écouter ce que faire l'utilisateur et fait le lien le code si besoin.
#$ rails server

# minute 16 de la vidéo.
pour que le server comprenne où aller et faire le liens entre toutes les pages et questionner le controller, le models, et rend la view  il faut configurer les routes dans route.rb
le lien pratique: https://guides.rubyonrails.org/routing.html
aprés la route il faut configurer le controller (1 controler/route) avec les méthodes nécessaires afin que l'on consulte la bonne view.
# $ get 'nom_route', to: 'nom_controller#nom_methode_du_controller'
ensuite il faut faire la view pour faire l'affichage que l'on veut.
# ATTENTION IL FAUT FAIRE 1 DOSSIERS PAR CONTROLLER QUE LON CREE qui sera une page principal par la suite

pour plus de rapidité, nous pouvons directement créer un controler avec les méthodes que l'on désire.
# $ rails generate controller nom_controller nom_1er_methode nom_2eme_methode etc..

outil pratique pour voir toutes nos routes:
#$ rails routes

#minute 33 : création d'une base de donnée (Model/db)
Je peux récupérer ma base de données avec view.
@nom_de_ma_variable = Model.new

#minutes 41 : Création d'action sur notre page web et résolution Authenticity_token
Authenticity_token permet d'éviter l'usurpation d'un user.
en langage html :
<form action="/" method ="post">
  <input type="hidden" name="authenticity_token"
    value="<% form_authenticity_token %>">
      <input type="text" name="first_name">
      <input type="submit" name="Envoyer">
</form>

dans mon controller je peux récupérer les infos rentrées avec "params"
puts params["authenticity_token"]
puts params["first_name"]

# minute 46, création d'un modèle grâce au view

_____________________________________________________________________
Cours "En route Simone"

Tu peux faire un GET depuis ton terminal grâce à curl. Teste donc en faisant $ curl http://freebox.com/ et compare avec le code source de http://freebox.com/ dans ton navigateur.

Avec le temps, d'autres types de requêtes sont apparues. On pense à POST, mais il en existe d'autres qui ont chacune leur utilité. Rails utilise 5 de ces méthodes :

GET : utilisée pour demander une page (et derrière la renvoyer à l'utilisateur) ;
POST : utilisée pour recevoir de l'information d'un utilisateur et derrière créer une ressource en base ;
PUT / PATCH : utilisées pour recevoir de l'information d'un utilisateur et derrière mettre à jour une ressource en base ;
DELETE : utilisée pour demander la suppression une ressource en base.

Pour chaque route paramétrée, Rails va nous afficher 4 infos :

-le Prefix : ok c'est LE truc ultra important. On va le voir, pour pointer vers cette route depuis notre code, on va se servir de ce prefix. La ressource sur les liens en Rails va t'expliquer pourquoi donc pour le moment, rappelle-toi que pour trouver le prefix d’une route, il faut faire $ rails routes
-le Verb : le verbe de notre méthode HTTP (GET/POST/etc.).
-le URI Pattern : l'adresse de notre route au sein de l'app Rails. Elle peut être dynamique (on verra ça plus tard) et le (.:format) n'est pas très important pour le moment (en gros on peut faire des routes en .json ou .mp4, mais la majorité seront sans extension en HTML)
-le Controller#Action : indique vers quel controller et quelle méthode la route renvoie

#La commande $ rails routes peut être conjuguée avec d'autres commandes de lignes de commande grâce à |.
Par exemple, si tu fais
#$ rails routes | grep static_pages,
la commande ne te sortira que les routes avec static_pages à l'intérieur. Très pratique quand on a beaucoup de routes à gérer et qu'on veut éviter de scroller dans son terminal.

pour insérer le nom d'une variable dans une route il faut utilisé :
# get '/users/:un_nom_de_variable', to: 'users#méthode'

Si toutefois tu avais un doute en codant une route dynamique, voici sont deux conseils qui t'aideront un max :

params est souvent affiché dans le serveur.
Donc après avoir saisi une route dynamique dans le navigateur, regarde ton terminal et cherche l'endroit où Parameters: { … } est imprimé : ça va t'aider à en extraire l'information que tu cherches.
On insistera jamais assez : "dans le doute, mets des puts partout". C'est particulièrement vrai avec params. Rajoute des puts params dans la méthode du controller pour qu'il s'affiche dans le terminal. En voyant son contenu, tu pigeras plus facilement comment l'utiliser.

#Points important à retenir
Un utilisateur navigue et interagit avec un site web en effectuant des requêtes. Une requête est définie par un verbe GET/POST/PUT/etc. et une URL. Le rôle du routeur (dans Rails, il s'agit du fichier routes.rb) est de rediriger une requête vers la méthode d'un controller de l'application.

Faire une route c'est comme ça :

#get '/static_pages/contact', to: 'controller#method'
$ rails routes te servira beaucoup, notamment pour récupérer le prefix de tes routes.

Les routes dynamiques peuvent être faites en ajoutant une variable dans la route avec un :, par exemple :

#get '/users/:id', to: 'controller#method'
Au final, une route dynamique contient de l'information (la variable) que tu peux récupérer ensuite dans le controller via le hash params. Dans l'exemple ci-dessus, si on tape l'URL "/users/123" on aurait params[:id] qui serait égal à "123".
____________________________________________________________________
Cours: Liens, façon rails
Un helper est une méthode spécifique à Rails qui va t'aider d'une façon où d'une autre. Ici, le helper link_to est une méthode que tu vas pouvoir mettre dans une view sous le format :

#<%= link_to "clique ici", le_fameux_path %>
Quand il va la lire, elle va se transformer ainsi avant d'être envoyée au navigateur :

#<a href="url_liée_au_path_saisi_dans_ton_link_to">clique ici</a>
En résumé, le helper link_to génère une balise HTML a avec le bon url en href pour peu que tu lui donnes le bon path à suivre.

#4. Points importants à retenir
Pour faire des liens dans rails, il faut utiliser <%= link_to "clique ici", ton_path %>.

Le path est le prefix (obtenu avec $ rails routes) auquel tu ajoutes _path._

Pour pointer vers des URLs dynamiques, passe les paramètres dynamiques dans ton path. year_month_day_path(@year.id, @month.id, @day.id) pointera vers l'URL : /years/:year_id/months/:month_id/days/:id
