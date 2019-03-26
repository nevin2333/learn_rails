if model.present?
  render_json_attrs(json, model)
  json.icon model.icon&.url
  json.image model.image&.url

  json.product_attributes model.product_attributes do |product_attribute|
    render_json_attrs(json, product_attribute)
    json.product_attribute_values product_attribute.product_attribute_values do |product_attribute_value|
      render_json_attrs(json, product_attribute_value)
    end
  end

else
  json.model {}
end