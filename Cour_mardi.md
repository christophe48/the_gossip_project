Cour REST et CRUD

Pour simplifier, le REST établit la règle suivante: "en général, il y a 7 choses que l'on veut faire, sur Internet, quand on manipule une ressource".
Une ressource, c'est généralement un élément de ta BDD par exemple la ressource potin, de The Gossip Project.
Si tu es en mode REST, il y a donc 7 requêtes (ou demandes) que l'utilisateur doit pouvoir envoyer à ton serveur :

Afficher toutes les ressources = GET tous les potins (l'index des potins donc)
Afficher une des ressources = GET juste un potin (show ton potin)
Afficher la page de création d'une ressource = GET la page avec le formulaire de création d'un nouveau potin (un new potin donc)
Envoyer les informations pour créer une ressource = POST les données du formulaire de création du potin (create ton potin)
Afficher la page de modification d'une ressource = GET la page avec le formulaire d'édition d'un potin existant (edit ton potin)
Envoyer les informations pour éditer une ressource = PUT ou PATCH les données du formulaire de mise à jour du potin (update ton potin)
Supprimer une ressource = DELETE un potin spécifique (destroy le potin)

Plus haut nous avons vu les 7 méthodes du REST. Et bien si on réfléchit, on peut les réunir en 4 catégories qui correspondent au fameux CRUD
dont on parle depuis des lustres :

_CREATE_ : regroupe l'affichage du formulaire de création (méthode #new) et son traitement + sauvegarde en base de la ressource (méthode #create).
_READ_ : regroupe l'affichage d'une ressource précise (méthode #show) et l'affichage de toutes les ressources en base (méthode #index).
_UPDATE_ : regroupe l'affichage du formulaire d'édition (méthode #edit) et son traitement + mise à jour en base de la ressource (méthode #update).
_DESTROY_ : c'est la destruction en base d'une ressource (méthode #destroy). C'est la seule catégorie où il n'y a qu'une méthode.


Comme tu peux le voir, en Rails, REST et CRUD sont donc imbriqués comme ceci :

#CREATE
get /gossips/new affichera un formulaire de création de potin. Ce formulaire va envoyer un POST à la route…
…post /gossips qui ira à la méthode #create de ton controller dont le rôle est de sauvegarder le potin en BDD
#READ
get /gossips affichera l'index des potins (= liste de tous les potins).
get /gossips/:id affichera la page de "profil" du potin.
#UPDATE
get /gossips/:id/edit affichera un formulaire de mise à jour de potin. Ce formulaire va envoyer un PUT à la route…
…put /gossips/:id qui ira à la méthode #update de ton controlle dont le rôle est de modifier ton potin en BDD
#DESTROY
delete /gossips/:id aura pour effet de supprimer ton potin en BDD

Pour automatiser l'écriture des routes précédente on peut mettre dans notre fichier config/routes.rb
#resources :gossips

Sache aussi que tu peux imbriquer les routes entre elles et faire ce que l'on appelle des nested resources. Cela permet de gérer, par exemple, un _CRUD pour des commentaires qui sont liés à un gossip_ : tu veux pouvoir _afficher la liste des commentaires_ mais seulement ceux _liés à un gossip donné_. Tu veux pouvoir créer un commentaire en le liant à un gossip donné. etc.
Cela nécessite, que pour _chaque action CRUD sur un commentaire, que l'on sache de quel gossip (auquel le commentaire est lié) on parle._

Pour faire ça, voici ce qu'il faut écrire :

#resources :gossips do
#  resources :comments
#end

#🚀 ALERTE BONNE ASTUCE
Par défaut, resources va créer les 7 routes vers les 7 méthodes du CRUD. Or, parfois, tu n'auras pas besoin de toutes ces routes. Par exemple : les commentaires de potins, tu veux pouvoir les créer, mais tu n'as pas envie que les gens puissent les modifier, ou les voir individuellement. Autre exemple : tu refuses que les gens puissent supprimer les potins.
Tu peux supprimer une route créée par resources avec un except: comme cela :

#resources :gossips, except: [:destroy]
Ou carrément restreindre les routes en faisant un petit only:

#resources :comments, only: [:new, :create, :index, :destroy]
Tu peux utiliser only: ou except: comme cela t'arrange le mieux, et en précisant derrière le nom des méthodes concernées (index, show, new, create, edit, update ou destroy)

#🚀 ALERTE BONNE ASTUCE (bis)
Et c'est là que ma préconisation d'hier prend tout son sens : utilise $ rails routes souvent car c'est un précieux allié.
_Une fois que tu utilises la ligne resources, lire le fichier routes.rb ne suffit plus._

#4. Points importants à retenir
Rails utilise le REST pour ses routes. Elles renvoient vers des controllers qui suivent les 7 méthodes du CRUD : _#new, #create, #show, #index, #edit, #update, #destroy._

Il est possible et très facile de faire des routes qui _suivent le REST avec resources._

Tu peux _limiter le nombre de routes créées par resources avec only: ou except:_ et en précisant derrière le nom des méthodes concernées (index, show, new, create, edit, update ou destroy)

Pour visualiser les routes de ton application, tapes _$ rails routes_. Pour cibler les routes d'un controller particulier, tapes _$ rails routes | grep gossips_.

⚠️ À partir de maintenant, nous te demanderons obligatoirement que tes routes suivent le REST, et que tes controllers aient les bons noms de méthodes CRUD. Tes routes devront alors utiliser quasi-exclusivement des lignes en resources.


___________________________________________________________________________________________________________________
#Cour Faire un Formulaire avec rails

Un formulaire de base, en HTML, comporte plusieurs éléments indispensables :

Les balises _<form> et </form>_ pour marquer son début et sa fin
2 options à renseigner dans la balise <form> : l'option _action_ pour identifier l'URL pointée et l'option _method_ pour indiquer le verbe HTTP de l'envoi (POST, PUT, etc.)
Généralement un champ _<input type="text">_ pour obtenir la saisie de l'utilisateur
Obligatoirement un bouton d'envoi sous la forme _<input type="submit">_
Ainsi, prenons l'exemple d'un formulaire qui enverrait un champ nom_du_champ (à compléter par l'utilisateur) à l'URL url_de_l'action, en faisant une méthode POST

#<form action= <%= gossips_path %> method="POST">
#      <input type="hidden" name="authenticity_token" value=<%= form_authenticity_token %> >
#      <input type="text" name="gossip_text">
#      <input type="submit" value="Valider">
#</form>

Sur Rails un formulaire n'est pas assez sécuriser, il faut un _Authenticity Token_ pour ça, il faut mettre
#<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
Grâce au _type="hidden"_, cette ligne sera _invisible pour l'utilisateur_. Par contre, tu peux _checker le code source de ta page : le <%= form_authenticity_token %>_ sera remplacé par un long string qui validera que la requête provient bien d'un formulaire web et que personne n'usurpe ton identité

En résumé, voilà le cheminement complet :

Le formulaire s'affiche dans le navigateur, l'utilisateur le remplit et clique sur le bouton d'envoi ;
Le contenu du formulaire est envoyé sous forme de requête au serveur avec l'URL et l'action HTTP paramétrés ;
Le serveur va dans le routeur et regarde à quoi correspond ce couple URL-verbe HTTP ;
Il fait alors suivre l'information à la méthode du controller que le routeur pointe ;
La méthode s'exécute avec, à disposition, les informations contenues dans le formulaire.
