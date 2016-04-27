json.array!(@groups) do |group|
  json.extract! group, :id, :name, :active, :status, :memo
  json.url group_url(group, format: :json)
end
