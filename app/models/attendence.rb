class Attendence < ApplicationRecord
  belongs_to :employee

  before_save :working_hour
 
  private

  def working_hour
    unless self.checkout_time.nil?
      data = self.checkout_time - self.checkin_time
      hour = data/3600
      self.hour = hour.round(2)
    end
  end
end
