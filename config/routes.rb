Rails.application.routes.draw do
  resources :periods
  resources :members do
    get 'reports' => 'reports#show'
  end
  resources :stages
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
