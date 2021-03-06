MyTeam::Application.routes.draw do
  #devise_for :users
  devise_for :users, :path => '/api/users',
    :controllers => {:sessions => 'sessions', :registrations => "registrations"}
  #, :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  get 'api/vacancies/search/:skills' => 'api/vacancies#search'
  post 'api/teams/:team_id/members/join' => 'api/members#join'
  post 'api/teams/:team_id/members/dismiss' => 'api/members#dismiss'
  post 'api/users/update_account' => 'api/users#update_account'

  namespace "api" do
    resources "skills"
    resources "teams" do
      resources "tasks" do 
        resources "comments", :controller => "task_comments"
      end

      resources "vacancies"
      resources "members"
    end
  end

  match 'users/account' => 'welcome#index'
  match 'users/sign_up' => 'welcome#index'
  match 'users/sign_in' => 'welcome#index'

  match 'teams' => 'welcome#index'
  match 'teams/:team_id' => 'welcome#index'
  match 'teams/:team_id/edit' => 'welcome#index'
  match 'teams/:team_id/new' => 'welcome#index'

  match 'vacancies' => 'welcome#index'
  match 'vacancies/:vacancy_id' => 'welcome#index'

  match 'teams/:team_id/tasks' => 'welcome#index'
  match 'teams/:team_id/tasks/:task_id' => 'welcome#index'
  match 'teams/:team_id/tasks/:task_id/edit' => 'welcome#index'
  match 'teams/:team_id/tasks/new' => 'welcome#index'

  match 'teams/:team_id/vacancies' => 'welcome#index'
  match 'teams/:team_id/vacancies/:vacancy_id' => 'welcome#index'
  match 'teams/:team_id/vacancies/:vacancy_id/edit' => 'welcome#index'
  match 'teams/:team_id/vacancies/new' => 'welcome#index'

  match 'teams/:team_id/members/join' => 'welcome#index'

  match 'teams/:team_id/members' => 'welcome#index'
  match 'teams/:team_id/members/:member_id' => 'welcome#index'
  match 'teams/:team_id/members/:member_id/edit' => 'welcome#index'
  match 'teams/:team_id/members/new' => 'welcome#index'

  root :to => 'welcome#index'


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
