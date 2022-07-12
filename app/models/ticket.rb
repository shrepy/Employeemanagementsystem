# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :employee
  has_many :comments, dependent: :destroy
  enum ticket_type: {
    management: '0',
    employee: '1'
  }

  enum status: {
    accept: 'Accept',
    decline: 'Decline'
  }

  validates :description, presence: true

  def self.search(search)
    if search
       Ticket.joins(:employee).where('employees.name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
