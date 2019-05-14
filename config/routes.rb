Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "url#index"
  resources :url 
  resources :pdf_metadata

end
