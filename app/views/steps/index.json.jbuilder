json.array!(@steps) do |step|
  json.extract! step, :id, :title, :subtitle, :body, :child_step, :parent_step, :url_link, :active, :memo, :pathway_id
  json.url step_url(step, format: :json)
end
