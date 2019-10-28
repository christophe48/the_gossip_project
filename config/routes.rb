Rails.application.routes.draw do
  get 'auteur/content'
  #je crée mes routes (mes liens urls), to: j'apelle mes méthodes (donc mes pages view.)
  get 'home', to: 'home#index'
  get 'welcome/:first_name', to: 'welcome#user'

  #je crée mes routes dynamique pour mes models gossips
  get 'gossip/:id', to: 'gossip#content'

  #je crée mes routes dynamique pour mes auteurs
  get 'gossip/auteur/:id', to: "auteur#content", as: "auteurs"

  #mes routes page contacts
  get 'contact', to: 'contact#contactus'
  get 'contact/christophe', to: 'contact#contact_christophe'
  get 'contact/lucas', to: 'contact#contact_lucas'

  #mes routes page team
  get 'team', to: 'team#home'
  get 'team/christophe', to: 'team#christophe'
  get 'team/lucas', to: 'team#lucas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
