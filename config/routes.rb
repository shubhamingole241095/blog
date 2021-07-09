Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  resources :homes
  resources :posts, only: [:index, :show], path: 'blog' do
  	get 'published', to: 'posts#published', on: :collection 
  	get 'archived', to: 'posts#archived', on: :collection 
    match :list_by_tag, on: :member, via: [:get]
  end
end
