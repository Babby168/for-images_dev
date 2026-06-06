Rails.application.routes.draw do
  get "cloudinary_test/index"
  post "cloudinary_test/index"

  get "up" => "rails/health#show", as: :rails_health_check
end
