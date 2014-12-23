Moose::Application.routes.draw do
  root :to => redirect('/welcome/index')
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'comments' => 'comments#index'
  get 'overview/index'
  get 'welcome/index'

  resources :trees do
    resources :comments
  end
  resources :users
end
