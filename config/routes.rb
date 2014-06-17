Rails.application.routes.draw do


  get "users/set_sysadmins"
  resources :success_criterions

  resources :user_story_tasks

  resources :user_stories

  resources :risks

  resources :stakeholders

  resources :sprints

  resources :releases

  resources :projects
  devise_for :users
  resources :users
  root 'misc#about'

  get "misc/about"

  get 'projects/:id/releases_owner' => 'projects#releases_owner', as: :releases_owner
  get 'projects/:id/add_to_team_project' => 'projects#add_to_team', as: :add_to_team_project

  get 'projects/:id/show_team' => 'projects#show_team', as: :show_team
  get 'projects/:id/user_stories_owner' => 'projects#user_stories_owner', as: :user_stories_owner
  post 'users/:id/add_to_team' => 'users#add_to_team', as: :add_to_team  
  post 'users/:id/remove_from_team' => 'users#remove_from_team', as: :remove_from_team  
  post 'users/:id/toggle_sysadmin' => 'users#toggle_sysadmin', as: :toggle_sysadmin

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
