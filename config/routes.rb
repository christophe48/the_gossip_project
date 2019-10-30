Rails.application.routes.draw do
  #je crée mes routes (mes liens urls), to: j'apelle mes méthodes (donc mes pages view.)
  get '/', to: 'homes#index', as: 'homes'
  get 'welcomes/:first_name', to: 'welcomes#user'

  #je crée mes routes dynamique pour mes models gossips
  resources :gossips #cette commande me permet de créer les 7 relations avec le REST vu dans le cour de mardi


  #je crée mes routes dynamique pour mes auteurs
  resources :auteurs

  #je crée mes routes dynamique pour mes cities
  resources :cities
  
  #mes routes page contacts
  get 'contacts', to: 'contacts#contactus'
  get 'contacts/christophe', to: 'contacts#contact_christophe'
  get 'contacts/lucas', to: 'contacts#contact_lucas'

  #mes routes page team
  get 'teams', to: 'teams#home'
  get 'teams/christophe', to: 'teams#christophe'
  get 'teams/lucas', to: 'teams#lucas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
