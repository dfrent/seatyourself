Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'restaurants#index'
  get "restaurants/look_for" => "restaurants#look_for"

  resource :user, except: [:index]
  resources :restaurants do
    resources :food_items, except: [:show]
    resources :reservations, except: [:index]
  end

  resource  :sessions, only: [:create, :new, :destroy]


end
