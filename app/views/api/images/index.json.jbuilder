json.models do
  if @models.present?
    render_json_array_partial(json, @models, 'api/common/image', :model)
  else
    {}
  end
end
