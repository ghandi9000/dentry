Moose::Application.routes.draw do
  get 'signin' => 'users#signin'
  get 'signup' => 'users#new'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  
  get 'overview/index'

  get 'welcome/signup'

  get 'welcome/index'

  get 'welcome/signin'

  resources :trees, :users
  root :to => redirect('/welcome/index')
end
