CollaborativeCursing::Application.routes.draw do
  root :to => "Home#index"
  
  controller :flags do
    post 'flag' => :flag, :as => 'flag'
    delete 'unflag' => :unflag, :as => 'unflag'
  end

  controller :insults do
    get 'insults' => :index
    post 'insults' => :create
    delete 'insults/:id' => :destroy, :as => 'delete_insult'
  end

  controller :sessions do
    get 'login' => :new, :as => 'login'
    post 'login' => :create
    delete 'logout' => :destroy, :as => 'logout'
  end

  controller :users do
    get 'user' => redirect('/')
    post 'users' => :create
    get 'user/new' => :new, :as => 'sign_up'
    get 'user/:id' => :show, :as => 'user'
    put 'user/:id' => :update
    delete 'user/:id' => :destroy
    get 'user/:id/edit' => :edit, :as => 'edit_user'
    get 'user/verify/:id/:verification' => :verify
  end

  controller :votes do
    post "vote" => :vote
    delete "unvote" => :destroy
  end

  match '/*filter' => "Home#index"

  match '*other' => redirect('/')

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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
