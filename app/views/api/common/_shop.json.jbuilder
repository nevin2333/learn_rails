if model.present?
  render_json_attrs(json, model)
  json.language model.system_language
else
  json.model {}
end