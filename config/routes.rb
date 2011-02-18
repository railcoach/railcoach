Dynamic::Application.routes.draw do

  get "activations/create"
  match 'user/activate/:activation_code' => 'activations#create', :as => :user_activation

  resources :user_sessions

  resources :projects
  match 'project/home' => 'projects#home', :as => :home_projects
  match 'project/:project_id/become_member' => 'projects#become_member', :via => :put, :as => :become_member_project
  match 'project/:project_id/invite_member' => 'projects#invite_member', :via => :put, :as => :invite_member_project
  match 'project/membership/:membership_id/accept_invitation' => 'project/memberships#accept_invitation', :via => :put, :as => :accept_invitation_project_membership
  match 'project/membership/:membership_id/accept_member' => 'project/memberships#accept_member', :via => :put, :as => :accept_member_project_membership

  resources :users
  match 'user/home' => 'users#home', :as => :home_users
  namespace :user do
    resources :profiles
  end

  get "static/home"
  get "static/projects"
  get "static/members"
  get "static/news"
  get "static/about"

  # User session routes
  match 'login' => 'user_sessions#create', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  resources :user_sessions


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "static#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
