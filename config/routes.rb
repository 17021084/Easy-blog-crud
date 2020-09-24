Rails.application.routes.draw do

  get 'users/new'
  root 'static_pages#home'    # routes localhost:3000/ <=> localhost:3000/static_route/home
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
