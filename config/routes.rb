Rails.application.routes.draw do
  get 'welcome/index' => 'welcome#index'
  root 'welcome#index'

  resources :professors
  resources :alunos
  resources :disciplinas

  get 'login'   => 'sessions#new'
  post 'access'  => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
end
