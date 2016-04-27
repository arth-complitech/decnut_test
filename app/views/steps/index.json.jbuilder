json.array!(@steps) do |step|
  json.extract! step, :id, :pathway_id, :title, :subtitle, :body, :child_step, :parent_step, :url_link, :active, :memo
  json.url step_url(step, format: :json)
end
