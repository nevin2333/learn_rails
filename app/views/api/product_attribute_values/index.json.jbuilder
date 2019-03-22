json.models do
  if @models.present?
    render_json_array_partial(json, @models, 'api/common/product_attribute_value', :model)
  else
    {}
  end
end
