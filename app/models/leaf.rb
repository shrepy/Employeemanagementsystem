class Leaf < ApplicationRecord
  belongs_to :employee
   enum leave_status: {
    accept: 'accept', # Newly created orde
    request: 'request'
  }
end
