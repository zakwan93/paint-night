Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
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
   match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
 
  root to: 'welcome#index'
end
