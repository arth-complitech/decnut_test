json.array!(@departments) do |department|
  json.extract! department, :id, :name, :status, :memo, :group_id
  json.url department_url(department, format: :json)
end
