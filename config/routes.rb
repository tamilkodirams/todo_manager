Rails.application.routes.draw do
  get "todos",to:"todos#index"
  #resources :todos
  #post "users/login", to: "users#login"
  #resources :users
end
