json.models do
  if @models.present?
    render_json_array_partial(json, @models, 'api/common/product_attribute', :model)
  else
    {}
  end
end
