Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'restaurants#index'

  resource :users, except: [:index]
  resources :restaurants do
    resources :food_items, except: [:show]
  end
  resources :reservations, except: [:index]

  resource  :sessions, only: [:create, :new, :destroy]

end
