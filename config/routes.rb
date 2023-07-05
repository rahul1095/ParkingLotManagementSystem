Rails.application.routes.draw do
  resources :cars
  resources :tickets

  get 'cars_by_color', to: 'cars#by_color'
  get 'ticket_number_by_registration_number', to: 'tickets#by_registration_number'
  get 'tickets_by_color', to: 'tickets#by_color'
end
