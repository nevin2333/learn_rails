if product.present?
  render_json_attrs(json, product)
  json.product_labels product.product_labels do |product_label|
    render_json_attrs(json, product_label)
  end
  json.brand_id product.brand_id.to_s
  json.shop_id product.shop_id.to_s
  json.brand product.brand

  json.pictures product.images do |picture|
    json.id picture.id
    json.uid picture.id
    json.url picture.picture_url&.url
  end

  json.path product.product_category&.path
  json.product_label_names product.product_labels&.pluck(:name)&.join(',')
  json.product_label_ids product.product_labels&.ids.map{|a| a.to_s}
else
  json.model {}
end