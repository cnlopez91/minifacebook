Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/' => 'application#home'
  get '/users' => 'users#index'
  get '/userwall' => 'users#userwall'
  get '/addfriend' => 'users#addfriend'
  post '/post' => 'users#post'
  post '/comment' => 'users#comment'
  delete '/posts/:id' => 'users#post_destroy'
  delete '/comments/:id' => 'users#comment_destroy'
end
