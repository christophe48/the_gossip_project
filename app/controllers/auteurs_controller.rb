class AuteursController < ApplicationController
  def index
    # Méthode qui récupère tous les auteurs et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    # Méthode qui récupère l'auteur concerné et l'envoie à la view show (show.html.erb) pour affichage
    @user = User.find(params[:id])
    @city = City.all
 end

  def new
    # Méthode qui crée un auteur vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @user = User.all
  end

  def create
    # Méthode qui créé un auteur à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher l'auteur' créé)
    @user = User.all
  end

  def edit
    # Méthode qui récupère l'auteur concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @user = User.all
  end

  def update
    # Méthode qui met à jour l'auteur à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher l'auteur' modifié)
    @user = User.all
  end

  def destroy
    # Méthode qui récupère l'auteur' concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @user = User.all
  end
end
