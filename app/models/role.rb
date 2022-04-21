class Role < ApplicationRecord
	has_one :employee, dependent: :destroy
end
