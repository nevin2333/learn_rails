if model.present?
  render_json_attrs(json, model)
  json.language model.system_language
  json.logo model.logo&.url
else
  json.model {}
end