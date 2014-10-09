json.array!(@workouts) do |workout|
  json.extract! workout, :id, :date_of, :length, :user_id
  json.url workout_url(workout, format: :json)
end
