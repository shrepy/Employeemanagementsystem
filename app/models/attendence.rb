class Attendence < ApplicationRecord
  self.inheritance_column = "not_sti"
  belongs_to :employee

  before_save :working_hour
 
  private

  def working_hour
    unless self.checkout_time.nil?
      data = (self.checkout_time - self.checkin_time).to_i
      hour = (data/3600).to_i
      min = ((data-(hour*3600)) / 60).to_i
      sec = (data-(hour*3600) - (min*60)).to_i
      self.hour = "#{hour} hours #{min} minutes"
    end
  end

  # def self.search(search, sear)
  #       if search 
  #           where(["CAST(created_at AS text) LIKE ? AND CAST(created_at AS text) LIKE ?", "%#{search}%", "%#{search}%"])
  #       else
  #           all
  #       end
  # end 
end
