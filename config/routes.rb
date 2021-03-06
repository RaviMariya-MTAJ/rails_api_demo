Rails.application.routes.draw do
  concern :api_base do
    resources :products
  end

  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end
end