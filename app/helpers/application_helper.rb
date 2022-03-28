module ApplicationHelper
	def checkout
		if current_employee.attendences.present?
			 current_employee.attendences.each do |b|
			 	if b.checkin_time.strftime("%d-%m-%y") == Time.zone.now.strftime("%d-%m-%y")
			 		a = current_employee.attendences.last
			 		if a.checkout_time.nil?
			 			byebug
			 			return b.id
			 		else
			 			return nil
			 		end
			 	end
			end
	    end
	end

	def salary_total
		array = []
		current_employee.salaries.each do |s| 
			if s.created_at.strftime("%m-%y") == Time.zone.now.strftime("%m-%y")
				current_employee.attendences.each do |a|
					array << a.checkin_time.strftime("%d-%m-%y")
					array.uniq
				end
			return s.salary/30 * array.uniq.count
			end
		end
	end
end
