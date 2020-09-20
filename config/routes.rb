Rails.application.routes.draw do
  get 'photos/index/:id' => 'photo#index', as: 'user_photos'
  get 'users/index' => 'user#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
