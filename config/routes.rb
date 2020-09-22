Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
    
  resources :items, only: :index do
    collection do
      post :update_summary
      post :update_item_changes
    end
  end

  resources :favourites do 
    collection do
      post :update_favourite
    end
  end
end
