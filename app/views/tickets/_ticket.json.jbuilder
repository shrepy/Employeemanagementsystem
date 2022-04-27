json.extract! ticket, :id, :status, :description, :ticket_type, :employee_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
