class Attendence < ApplicationRecord
  belongs_to :employee

  before_save :working_hour
 
  private

  def working_hour
    unless self.checkout_time.nil?
      data = (self.checkout_time - self.checkin_time).to_i
      hour = (data/3600).to_i
      min = ((data-(hour*3600)) / 60).to_i
      sec = (data-(hour*3600) - (min*60)).to_i
      self.hour = "#{hour}:#{min}:#{sec}"
    end
  end
end
