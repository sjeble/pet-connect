Rails.application.routes.draw do

  root 'welcome#index'
  get "/organizations/search" => "organizations#search", :as => :search_organizations

  resources :organizations do
    resources :pairings, except: [:show]
    resources :reviews, only:[:new, :create]
  end

  resources :users, except:[:index] do
    resources :events
    resources :pets, except:[:index] do
      resources :ratings, only:[:new, :create]
    end
  end

  resources :pairings do
    resources :messages
  end


  resources :sessions, except: [:index, :edit, :update, :show, :new, :delete]

  get '/inbox' =>
   "pairings#index", :as => :inbox
  get '/login' => "sessions#new", :as => :new_session
  get '/logout' => "sessions#destroy", :as => :destroy_session


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
