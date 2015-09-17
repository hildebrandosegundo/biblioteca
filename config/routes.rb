Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'livros/index'

  get 'livros/listaAdmin'
  get 'livros/listaNormalUser'
  post 'livros/edit' => 'livros#edit'

  post 'livros/update' => 'livros#update'

  delete 'livros/destroy' => 'livros#destroy'

  post 'livros' => 'livros#create'

  get 'authors/index'

  post 'authors' => 'authors#create'

  post 'instituicaos' => 'instituicaos#create'

  get 'instituicaos/index'

  get 'editoras/index'

  get 'home/index'

  get 'minhabiblioteca/index'

  get 'cadastro/index'

  get 'contato/index'

  get 'cadpesinst/index'

  get 'locacaos/index'

  post 'locacaos' => 'locacaos#create'

  get 'pessoas/index'

  post 'pessoas' => 'pessoas#create'

  post 'editoras' => 'editoras#create'

  resources :pessoas
  resources :livros
  resources :editoras
  resources :authors
  resources :locacaos
  resources :home, :only => [:index]
  resources :contato, :only => [:index]
  resources :cadastro, :only => [:index]
  resources :cadpesinst, :only => [:index]
  resources :minhabiblioteca, :only => [:index]
  resources :instituicaos

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
