Rails.application.routes.draw do

  resources :workouts

  root 'workouts#leaderboard'
  devise_for :users
  resources :users
  resources :runs
  get "/workout-leaderboard", to: "workouts#leaderboard", as: :workout_leaderboard
  get "/run-leaderboard", to: "runs#leaderboard", as: :run_leaderboard
end
