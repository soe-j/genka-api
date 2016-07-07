json.array!(@periods) do |period|
  json.extract! period, :id, :project_id, :process_id, :member_id, :start_time
  json.url period_url(period, format: :json)
end
