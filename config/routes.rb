Rails.application.routes.draw do
  root 'projects#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users', to: 'users/registrations#index', as: 'volunteers'
    get 'users/:id', to: 'users/registrations#show', as: 'profile'
  end
  
  resources :projects do
    collection do
      get :volunteered
      get :own
    end

    member do
      post :toggle_volunteer
    end
  end

  resources :offers

  resources :admin do
    collection do
      post :delete_project
      post :delete_user
    end
  end
end
