Rails.application.routes.draw do
  resources :urls
  root to: 'urls#new'
  get '/:short', to: 'urls#redirect' 
  get 'view/:short', to: 'urls#show', as: :view
end
