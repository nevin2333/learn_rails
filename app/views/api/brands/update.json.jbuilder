if @model.present?
  render_json_attrs(json, @model)
  json.logo @model.logo&.url
else
  json.model {}
end