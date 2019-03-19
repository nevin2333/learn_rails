json.models do
  if @models.present?
    render_json_array_partial(json, @models, 'api/common/document', :model)
  else
    {}
  end
end
