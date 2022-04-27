class Ticket < ApplicationRecord
  belongs_to :employee
   enum ticket_type: {
    management: '0',
    employee: '1',
  }

  enum status: {
    accept: 'Accept',
    decline: 'Decline',
  }

end
