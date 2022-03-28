class Attendence < ApplicationRecord
  belongs_to :employee

  # before_save :update_att

  # private
  # def update_att
  #   byebug
  # end
end
