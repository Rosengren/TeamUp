Rails.application.routes.draw do
  resources :games_users, only: [:create, :destroy]
  resources :user_proficiencies, only: [:create, :destroy]
  resources :teams
  resources :users, except: :new
  resources :user_teams
  resources :proficiency_posts, only: :create
  resources :games, only: [:create, :show, :destroy] do
    resources :proficiencies, except: :index do
      resources :proficiency_posts, only: [:create, :destroy]
    end
  end

  # Root of site
  root 'sessions#new'

  get    'profile' => 'users#show'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  post 'teams/:id/requestDecision' => 'teams#requestDecision', as: :request_decision
  post 'users/:id/endorse/:proficiency_id' => 'users#endorse', as: :endorse

  get    'admin'   => 'pages#admin'
  post   'admin'   => 'pages#create'

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
  namespace :search do
    resources :all
    resources :proficiencies
    resources :games
  end
end
