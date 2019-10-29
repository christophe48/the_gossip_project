class GossipsController < ApplicationController
 def index
   # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
   @gossip = Gossip.all
   @user = User.all
 end

 def show
   # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
   @gossip = Gossip.all
   @user = User.all
end

 def new
   # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
   @gossip = Gossip.all

   @gossip = Gossip.new( 'title' => params[:title],
                         'content' => params[:content])

  if @gossip.save
    redirect_to gossips_path
  else
    render 'new'
  end
 end

 def create
   # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
   # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
   # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
   @gossip = Gossip.all
 end

 def edit
   # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
   @gossip = Gossip.all
 end

 def update
   # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
   # pour info, le contenu de ce formulaire sera accessible dans le hash params
   # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
   @gossip = Gossip.all
 end

 def destroy
   # Méthode qui récupère le potin concerné et le détruit en base
   # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
   @gossip = Gossip.all
 end
end
