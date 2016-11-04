Rails.application.routes.draw do
  root 'welcome#index'
  get  '/signup',  to: 'users#new'
  get 'welcome/index'

  resources :events do
    resources :comments
  end

  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
