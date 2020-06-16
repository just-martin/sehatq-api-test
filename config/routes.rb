Rails.application.routes.draw do
  resources :bookings
  resources :schedules
  resources :hospitals
  resources :doctors

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :doctors
      resources :bookings
      get "booking_list" => "bookings#index_by_user"
      resources :hospitals
      resources :schedules
      get "doctor_schedule_list" => "schedules#index_by_doctor"
      get "doctor_hospital_schedule_list" => "schedules#index_by_doctor_and_hospital"
      
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
