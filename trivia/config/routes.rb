Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :questions do
    resources :answers, except: [:show, :new]
  end
  post 'answer_update', to: 'answers#answer_update', as: 'answer_update'
  post 'answersusers', to: 'answersusers#create'
  post 'ranking', to: 'pages#ranking'
  get 'answersusers', to: 'answersusers#index'
  get 'pages/index'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
