if model.present?
  render_json_attrs(json, model)
else
  json.model {}
end