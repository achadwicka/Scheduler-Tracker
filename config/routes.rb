Rails.application.routes.draw do

  resources :diagnoses
  resources :reservations
  resources :blocks
  resources :treatments
  root 'welcome#index'
  devise_for :admins, path: 'admins', controllers: {sessions: "admins/sessions", registrations: "admins/registrations", confirmations: "admins/confirmations",  mailer:"admins/mailer", passwords: "admins/passwords", shared: "admins/shared", unlocks: "admins/unlocks"}
  devise_for :doctors, path: 'doctors', controllers: {sessions: "doctors/sessions", registrations:"doctors/registrations", confirmations: "doctors/confirmations", mailer: "doctors/mailer", passwords: "doctors/passwords", shared: "doctors/shared", unlocks: "doctors/unlocks"}
  devise_for :clients, path: 'clients', controllers: {sessions: "clients/sessions", registrations:"clients/registrations", confirmations: "clients/confirmations", mailer: "clients/mailer", passwords: "clients/passwords", shared: "clients/shared", unlocks: "clients/unlocks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/pick_date' => 'reservations#pick_date'
  get '/pick_date_to_edit' => 'reservations#pick_date_to_edit'

  get '/client' => 'clients#mostrar'
  get '/client/history' => 'clients#history'
  post 'reservations/go_new'
  get '/doctor' => 'doctors#mostrar'
  
  get '/treatments/show' => 'treatments#show'
  get '/treatments/client' => 'treatments#client'
  get '/showclient' => 'treatments#showclient'

  get '/reservations_to_edit' => 'reservations#index_to_edit'
  post '/reservations_go_edit' => 'reservations#go_edit'
  get '/reservations_admin_edit' => 'reservations#admin_edit'

  get '/admin/new_doctor' => 'admins#new_doctor'
  post 'admins/add_doc'
  get '/doctor/history' => 'doctors#history'



end
