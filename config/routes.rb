Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, controllers: { registrations: "registrations" }
  scope '/admin' do
    resources :users
  end
  resources :users
  resources :roles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'thankyou', to:'greetings#index'

  get 'home', to:'welcome#index'
 
  root to: 'welcome#index'
end
