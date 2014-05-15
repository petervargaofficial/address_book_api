EmailSender::Application.routes.draw do
  root 'email#about'

  post '/email', to: 'email#email'
  get '/show', to: 'email#show'
end
