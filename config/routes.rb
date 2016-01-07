Rails.application.routes.draw do

  resources :workouts

  root 'runs#leaderboard'
  devise_for :users, controllers: {sessions: 'sessions'}
  resources :users
  resources :runs
  get "/workout-leaderboard", to: "workouts#leaderboard", as: :workout_leaderboard
  get "/run-leaderboard", to: "runs#leaderboard", as: :run_leaderboard
end
