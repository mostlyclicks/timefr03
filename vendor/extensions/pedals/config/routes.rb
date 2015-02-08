Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :pedals do
    resources :pedals, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pedals, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :pedals, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
