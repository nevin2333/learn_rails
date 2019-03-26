if model.present?
  render_json_attrs(json, model)
  json.product_attribute_values model.product_attribute_values do |product_attribute_value|
    render_json_attrs(json, product_attribute_value)
  end
else
  json.model {}
end