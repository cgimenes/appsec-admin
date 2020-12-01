Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  scope "/admin" do
    resources :users
    resources :teams
    resources :assets
  end

  resources :comments
  resources :vulns do
    member do
      get :clone
    end
  end
end
