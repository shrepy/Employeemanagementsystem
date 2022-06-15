class AdminMain::AttendencesController < ApplicationController

	def index
      # employee_attendence(@attendence.employee_id)
      @attendences = Attendence.all
    end
end
