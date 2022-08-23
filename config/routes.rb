Rails.application.routes.draw do
  get 'blogs/index'
  root 'users#index'
  devise_for :users
  
  post '/blogs/:id/approve' , to: 'blogs#approve', as: 'blog_approve'
  post '/blogs/:id/unapprove' , to: 'blogs#unapprove', as: 'blog_unapprove'

  resources :blogs 
  resources :comments    
 
  # get 'blogs/id/approve' , to: 'blogs#approve', as: 'blog_approve'
  # get 'blogs/id/unapprove' , to: 'blogs#unapprove', as: 'blog_unapprove'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
