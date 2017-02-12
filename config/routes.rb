Rails.application.routes.draw do

  resources :team_data
  root 'competitions#index'

  resources :competitions do
    resources :matches, shallow: true
  end

  resources :objectives
  resources :teams, param: :number
end
