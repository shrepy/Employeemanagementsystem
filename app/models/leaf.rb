class Leaf < ApplicationRecord
  belongs_to :employee
   enum leave_status: {
    accept: 'accept',
    decline: 'decline',
    cancel: 'cancelled' # Newly created orde
  }
  validate :check_past_date
  before_create :total_day
  after_save { employee.recalculate_leave_balance }
  

  def total_day
    self.total_days = ((self.till_date - self.from_date) - total_leave_count) + 1
  end

  def total_leave_count
    if leave_starts == "Half Day" && leave_end == "Half Day"
      return 1
    elsif leave_starts == "Half Day" || leave_end == "Half Day"
      return 0.5
    else 
      return 0
    end 
  end


  def check_past_date
    return errors.add :base, "Please select date :)" if from_date.nil? || till_date.nil?

    errors.add :base, "Please select right date :)" unless from_date >= Time.now.to_date && till_date >= from_date
  end

end
