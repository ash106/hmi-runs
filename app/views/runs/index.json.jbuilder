json.array!(@runs) do |run|
  json.extract! run, :id, :date_of, :distance, :user_id
  json.url run_url(run, format: :json)
end
