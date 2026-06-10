require "sidekiq/web"

Rails.application.routes.draw do
  get "css_mosaic/index"
  post "css_mosaic/add_piece"
  
  mount Sidekiq::Web => "/sidekiq"
  
  get "sidekiq_test", to: "sidekiq_test#index"
  post "sidekiq_test", to: "sidekiq_test#index"

  get "cloudinary_test/index"
  post "cloudinary_test/index"

  get "vips_test/index"
  post "vips_test/index"

  get "up" => "rails/health#show", as: :rails_health_check
end
