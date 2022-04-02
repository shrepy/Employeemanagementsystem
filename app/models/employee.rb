class Employee < ApplicationRecord
  has_many :performances
  has_many :salaries
  has_many :attendences
  has_many :leafs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def recalculate_leave_balance
    leafs.each do |leave|
      if leave.updated_at.min == Time.zone.now.min
        if leave.leave_status == "accept" && leave_count > 0
          update_attribute(:leave_count, leave_count - 1)
        end
      end
    end
  end
end
