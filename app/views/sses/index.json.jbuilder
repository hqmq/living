json.array!(@sses) do |ss|
  json.extract! ss, :key, :data
  json.url ss_url(ss, format: :json)
end