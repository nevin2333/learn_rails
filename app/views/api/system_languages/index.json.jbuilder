json.models do
  if @models.present?
    render_json_array_partial(json, @models, 'api/common/system_language', :model)
  else
    {}
  end
end
