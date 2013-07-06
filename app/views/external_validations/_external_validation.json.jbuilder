json.extract!(external_validation, :name)
json.validators external_validation.validators do |validator|
  json.class validator.class.name
  json.extract!(validator, :attributes, :options)
end
