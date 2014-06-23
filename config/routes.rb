Rails.application.routes.draw do

  get 'users/create_user_admin' => 'users#create_user_admin', as: :create_user_admin  
  post 'users/register_new_user' => 'users#register_new_user', as: :register_new_user  
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

  get 'user_story_tasks/:id/add_more_time' => 'user_story_tasks#add_more_time', as: :add_more_time
  post 'user_story_tasks/:id/register_more_time' => 'user_story_tasks#register_more_time', as: :register_more_time

  post 'success_criterions/:id/toggle_completed' => 'success_criterions#toggle_completed', as: :toggle_completed


  get 'user_stories/:id/responsible_assignment' => 'user_stories#responsible_assignment', as: :responsible_assignment
  get 'user_stories/:id/sprint_assignment' => 'user_stories#sprint_assignment', as: :sprint_assignment
  get 'user_stories/:id/tasks' => 'user_stories#tasks', as: :tasks
  get 'user_stories/:id/crits' => 'user_stories#crits', as: :crits

  get 'releases/:id/sprints_master' => 'releases#sprints_master', as: :sprints_master
  get 'projects/:id/releases_master' => 'projects#releases_master', as: :releases_master

  get 'projects/:id/releases_owner' => 'projects#releases_owner', as: :releases_owner
<<<<<<< HEAD
  get 'projects/:id/get_report' => 'projects#get_report', as: :get_report

=======
  get 'projects/:id/add_to_team_project' => 'projects#add_to_team', as: :add_to_team_project
>>>>>>> 83fca7697e987beafd37690dc44103de03a0df1a

  get 'projects/:id/add_to_team_project' => 'projects#add_to_team', as: :add_to_team_project
  get 'projects/:id/user_stories_master' => 'projects#user_stories_master', as: :user_stories_master
  get 'projects/:id/user_stories_dev' => 'projects#user_stories_dev', as: :user_stories_dev
  get 'projects/:id/show_team' => 'projects#show_team', as: :show_team
  get 'projects/:id/user_stories_owner' => 'projects#user_stories_owner', as: :user_stories_owner


  post 'users/:id/add_to_team' => 'users#add_to_team', as: :add_to_team  
  post 'users/:id/remove_from_team' => 'users#remove_from_team', as: :remove_from_team  
  post 'users/:id/toggle_sysadmin' => 'users#toggle_sysadmin', as: :toggle_sysadmin

  get 'sprints/:id/user_stories_for_sprint_master' => 'sprints#user_stories_for_sprint_master', as: :user_stories_for_sprint_master 
  get 'sprints/:id/get_burndown_chart' => 'sprints#get_burndown_chart', as: :get_burndown_chart 
  get 'sprints/:id/get_chart_points' => 'sprints#get_chart_points', as: :get_chart_points 
  get 'sprints/:id/get_chart_hours' => 'sprints#get_chart_hours', as: :get_chart_hours 

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
