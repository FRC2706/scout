Rails.application.routes.draw do

  root 'competitions#index'

  resources :competitions do
    resources :matches, shallow: true
  end

  resources :objectives
end
