AddressBook::Application.routes.draw do
  root 'contacts#index'

  devise_for :users
  resources :contacts
end