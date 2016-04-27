json.array!(@pathways) do |pathway|
  json.extract! pathway, :id, :title, :active, :memo, :user_id
  json.url pathway_url(pathway, format: :json)
end
