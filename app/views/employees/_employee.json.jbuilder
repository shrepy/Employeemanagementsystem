json.extract! employee, :id, :name, :father_name, :mother_name, :age, :phone_number, :email, :address, :trainer_id, :destination, :created_at, :updated_at
json.url employee_url(employee, format: :json)
