Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
    
  root to: "introductions#index"
  
  resources :subjects do
    collection do
      get 'search'
    end
  end

  resources :publics, only: [:index, :create, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :students

  resources :users, only: [:index, :show] do
    resources :attendances
    collection do
      post 'check'
    end
  end
  
end
