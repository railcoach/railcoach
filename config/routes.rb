Dynamic::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks" }

  resources :projects do
    member do
      post 'request_membership' => "projects#request_membership", :as => 'request_membership'
      put 'invite_member/:user_id' => "projects#invite_member", :as => 'invite_member'
    end
    collection do
      get 'home'
    end
    resources :memberships do
      put ':membership_id/accept_invitation' => 'project/memberships#accept_invitation', :as => 'accept_invitation'
      put ':membership_id/accept_member' => 'project/memberships#accept_member', :as => 'accept_member'
      put ':membership_id/deny' => 'project/memberships#deny', :as => 'deny'
    end
  end

  resources :users do
    collection do
      get 'home' => 'users#home'
    end
  end

  namespace :user do
    resources :profiles
    resources :networks
  end

  resource :activations

  get "static/home" => "static#home"
  get "static/news" => "static#news"
  get "static/about" => "static#about"
  get "static/privacy" => "static#privacy"
  get "static/contact" => "static#contact"
  get "bam2011s" => "static#bam2011s"
  get "sag2012w" => "static#sag2012w"

  # special page for the launch
  get "boot" => "static#boot"

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
