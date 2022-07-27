# frozen_string_literal: true

class Holiday < ApplicationRecord
  validates :holiday_name, presence: true
  validates :holiday_date, presence: true
end
