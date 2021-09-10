Rails.application.routes.draw do
  root 'homes#top'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_for :users
  get '/shikoku' => 'homes#shikoku', as: 'shikoku'
end
