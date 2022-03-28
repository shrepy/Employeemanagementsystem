json.extract! attendence, :id, :checkin_time, :checkout_time, :status, :employee_id, :created_at, :updated_at
json.url attendence_url(attendence, format: :json)
