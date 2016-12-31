Rails.application.routes.draw do
  resources :competitions do
    resources :matches, shallow: true
  end
end
