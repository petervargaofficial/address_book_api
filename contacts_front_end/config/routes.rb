AddressBook::Application.routes.draw do
  root 'contacts#index'

  devise_for :users
  resources :contacts
  get '/contacts/:id/email', to: 'contacts#new_email', as: 'email_contacts'
  post '/contacts/:id/email', to: 'contacts#send_email'
  get '/contacts/:id/sent', to: 'contacts#sent_email', as: 'email_sent'
end


# Peters-MacBook-Pro:contacts_front_end petervarga$ rake routes
#                   Prefix Verb   URI Pattern                    Controller#Action
#                     root GET    /                              contacts#index
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                 contacts GET    /contacts(.:format)            contacts#index
#                          POST   /contacts(.:format)            contacts#create
#              new_contact GET    /contacts/new(.:format)        contacts#new
#             edit_contact GET    /contacts/:id/edit(.:format)   contacts#edit
#                  contact GET    /contacts/:id(.:format)        contacts#show
#                          PATCH  /contacts/:id(.:format)        contacts#update
#                          PUT    /contacts/:id(.:format)        contacts#update
#                          DELETE /contacts/:id(.:format)        contacts#destroy
#           email_contacts GET    /contacts/:id/email(.:format)  contacts#new_email
#                          POST   /contacts/:id/email(.:format)  contacts#send_email
#               email_sent GET    /contacts/:id/sent(.:format)   contacts#sent_email