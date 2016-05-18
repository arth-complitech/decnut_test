Rails.application.routes.draw do
  
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  resources :groups
  resources :departments do 
 
      collection do  
        get "all_deps"
      end 
  end 

  root 'pathways#homepage'

  resources :pathways do 
    collection do
        post :sort
    end 
  end
  resources :steps

  resources :pathways do
    resources :steps
    get "step_show/:step_id", to: "steps#step_show", as: :step_show
    get "step_index", to: "steps#step_index", as: :step_index
  end

  resources :users
  
  get "assign_user/:pathway_id", to: "assignments#assign_user", as: :assign_user
  post "assign_user/:pathway_id", to: "assignments#create_assignment"
  
  post "add_assignments_steps/:step_id", to: "steps#add_assignments_steps", as: :complete_step
  post "update_assignments/:pathway_id", to: "assignments#update_assignments", as: :complete_pathway
  post "duplicate_pathway/:pathway_id", to: "pathways#duplicate_pathway", as: :duplicate_pathway
  post "users/create" , to: "users#create" , as: :add_user
  patch "users/:user_id" , to: "users#update" , as: :update_user
  resources :assignments
  get "users/update_departments", to:"users#update_departments"

  match "invite_user" => "twilio#new_invite_user", :via => :get, as: :invite_new_user
  post "twilio/invite_user", to: "twilio#invite_user", as: :invite_user
  # resources :phone_numbers, only: [:new, :create]
  # post 'phone_numbers/verify' => "phone_numbers#verify"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
