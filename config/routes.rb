Rails.application.routes.draw do
  root 'homes#top'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_for :users
  get '/region/:region' => 'homes#region', as: "region"
  resources :posts
  resources :post_images, only: [:new, :create, :destroy]
end
