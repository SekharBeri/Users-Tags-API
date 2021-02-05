Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        post "add_tags" => "users#add_tags"
        delete "remove_tags" => "users#remove_tags"
      end

      resources :tags
      
      post '/login' => "authentication#login"
      post 'logout' => "authentication#logout"
    end
  end
end
