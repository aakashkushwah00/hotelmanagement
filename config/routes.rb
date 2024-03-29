require 'resque/server'
Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/new'
  
  get 'admin_dashboard/index'

  get 'admin_dashboard/adminindex'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'

  get '/about', to: 'home#about'
  get '/room', to: 'home#room'
  get '/blog', to: 'home#blog'
  get '/contact', to: 'home#contact'
  get '/allhotels', to: 'home#allhotels'
  get 'home/hotelrooms/:hotel_id', to: 'home#hotelrooms', as: 'test'

  resources :hotels do 
    resources :rooms
    resources :employees
    collection do
      post 'import_csv'
    end
  end 

authenticate :user do
    mount Resque::Server.new, at: '/jobs'
end


  resources :home
  resources :bookings

  get 'allbookings', to: 'bookings#allbooking'
  
  get 'rooms/', to: 'rooms#allroom'
  get 'employees/', to: 'employees#allemployee'


end
