# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :employee
  validates :description, presence: true
end
