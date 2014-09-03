Rails.application.routes.draw do

  root 'runs#leaderboard'
  devise_for :users
  resources :users
  resources :runs
  get "/leaderboard", to: "runs#leaderboard", as: :leaderboard
end
