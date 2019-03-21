if model.present?
  render_json_attrs(json, model)
  json.icon model.icon&.url
  json.image model.image&.url
else
  json.model {}
end