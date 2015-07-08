Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: [:index, :create, :new]
  get 'success' => 'static#success'
  get 'csv' => 'users#export_csv', :as => :csv
end
