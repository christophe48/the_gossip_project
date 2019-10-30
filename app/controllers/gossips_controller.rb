class GossipsController < ApplicationController
 def index
   # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
   @gossips = Gossip.all
   @users = User.all
 end

 def show
   # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
   @gossip = Gossip.find(params[:id])
   @users = User.all
   @cities = City.all
end

 def new
   # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
 end

 def create
   # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
   # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
   # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
   @gossip = Gossip.new(user_id: 2, title: params[:title], content: params[:content])

   if @gossip.save
     redirect_to gossips_path
   else
     render 'gossips/show'
   end
 end

 def edit
   # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
   @gossip = Gossip.find(params[:id])
 end

 def update
   @gossip = Gossip.find(params[:id])
   if @gossip.update(title: params[:title], content: params[:content])
     redirect_to gossips_path
   else
     render :edit
   end
 end

 def destroy
   @gossip = Gossip.find(params[:id])
  if @gossip.destroy
    redirect_to gossips_path
  else
    render :show
  end
 end

end
