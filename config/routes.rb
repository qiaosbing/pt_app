require 'sidekiq/web'
Rails.application.routes.draw do
  resources :user_descs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => '/sidekiq_web' #sidekiq
  mount TestV1API => "/api/v1" #API接口
end
