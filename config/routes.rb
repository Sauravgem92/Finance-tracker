Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  #Adding the destroy get route as sign_out route is not working
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end
