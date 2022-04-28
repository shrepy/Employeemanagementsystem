class Employee < ApplicationRecord
  self.inheritance_column = "not_sti"
  has_many :performances, dependent: :destroy
  has_many :salaries, dependent: :destroy
  has_many :attendences, dependent: :destroy
  has_many :leafs, dependent: :destroy
  belongs_to  :designation, dependent: :destroy
  belongs_to  :role, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :daily_tasks
  #validates :name, :father_name, :mother_name, :age, :phone_number, :address, :trainer_id, :destination, :password, :password_confirmation, :image, :department, :bank_name, :account_number, :pan_card_number, :aadhar_card_number, :salary, :primary_skill, presence: true
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

  def working_days
    created_at_time = []
    attendences.each do |attendence|
      if attendence.created_at.strftime('%m-%y') == Time.now.strftime('%m-%y')
        created_at_time << attendence.created_at.strftime('%d-%m-%y')
      end
    end
    days = created_at_time.uniq
    working_days = days.count
  end

  def leave_total
    count = 0
    leafs.each do |leaf|
      if leaf.leave_status == "accept"
        count = count + leaf.total_days 
      end
    end
    unless count == 0
      return count - leave_count
    end
    return count

  end

  def self.search(search)
        if search 
            where(["name LIKE ? OR father_name LIKE ?","%#{search}%", "%#{search}%"])
        else
            all
        end
  end 

  def todays_last_attendence
    todays_attendences = attendences.where('checkin_time > ? AND checkin_time < ?', Date.today.beginning_of_day, Date.today.end_of_day)
    todays_attendences.sort.last
  end

  def show_checkin?
    attendence = todays_last_attendence
    return true if attendence.present? && attendence.checkout_time.present?
  end

  # def check_salary_amount
  #   return errors.add :base, "Salary not Valid :)"  unless salary <= 50000
  # end

end
