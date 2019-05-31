Rails.application.routes.draw do
  get 'new', to: 'pages#new', as: :new
  get 'score', to: 'pages#score', as: :score
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
