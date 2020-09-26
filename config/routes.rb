Rails.application.routes.draw do

  
  root 'static_pages#home'    # routes localhost:3000/ <=> localhost:3000/static_route/home
  # refer from short url to native long url
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  # atomaticlly generate REST url
  resources :users    # resource la so nhieu , model la so it

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
