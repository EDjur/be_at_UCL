Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'sessions/new'

  root 'welcome#index'
  get  '/signup',  to: 'users#new'
  get 'welcome/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :events do
    resources :comments
    resources :tickets
  end

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
