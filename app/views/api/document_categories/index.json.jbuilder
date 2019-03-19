json.models do
  if @models.present?
    render_json_array_partial(json, @models, 'api/common/document_category', :model)
  else
    {}
  end
end
