# frozen_string_literal: true

class Leaf < ApplicationRecord
  belongs_to :employee
  enum leave_status: {
    accept: 'accept',
    decline: 'decline',
    cancel: 'cancelled' # Newly created orde
  }
  validate :check_past_date, on: :create
  before_create :total_day
  after_save { employee.recalculate_leave_balance }

  before_validation :check_year, on: :create
  before_validation :leave_days, on: :create

  def total_day
    self.total_days = ((till_date - from_date) - total_leave_count) + 1
  end

  def total_leave_count
    if leave_starts == 'Half Day' && leave_end == 'Half Day'
      1
    elsif leave_starts == 'Half Day' || leave_end == 'Half Day'
      0.5
    else
      0
    end
  end

  def check_past_date
    return errors.add :base, 'Please select date :)' if from_date.nil? || till_date.nil?

    errors.add :base, 'Please select right date :)' unless from_date >= Time.now.to_date && till_date >= from_date
  end

  def check_year
    unless from_date.strftime('%Y').to_i <= Date.current.year && till_date.strftime('%Y').to_i <= Date.current.year + 1
      errors.add :base,
                 'Please select right year :)'
    end
  end

  def leave_days
    return errors.add :base, 'You Can Apply only 30 days leave :)' unless total_day <= 30
  end

  def cancel_leave
    from_date > Time.now
  end
end
