Rails.application.routes.draw do
  # API rotalarımızı /api/v1/ önekiyle grupluyoruz.
  namespace :api do
    namespace :v1 do
      get "users/index"
      get "users/show"
      get "packages/index"
      get "packages/show"
      get "packages/create"
      get "packages/update"
      get "packages/destroy"
      get "surveys/index"
      get "surveys/show"
      get "surveys/create"
      get "surveys/update"
      get "surveys/destroy"
      get "projects/index"
      get "projects/show"
      get "projects/create"
      get "projects/update"
      get "projects/destroy"
      get "scales/index"
      get "scales/show"
      get "scales/create"
      get "scales/update"
      get "scales/destroy"
      # Bu namespace içindeki ana rotayı ("/") welcome controller'ının index metoduna bağlar.
      root to: "welcome#index"
      resources :scales
      resources :projects
      resources :surveys
      resources :packages
      resources :products
      resources :users, only: [:index, :show, :create] 
    end
  end
end