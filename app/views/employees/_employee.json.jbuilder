json.extract! employee, :id, :employee_type, :created_at, :updated_at
json.url employee_url(employee, format: :json)
