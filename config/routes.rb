Rails.application.routes.draw do
  root 'users#new'
  resources :users
  get 'success' => 'static#success'
  get 'csv' => 'users#export_csv', :as => :csv
end
