class ApplicationController < ActionController::Base
	# before_action :show_employee

	# def show_employee
	# end

	def after_sign_in_path_for(resource_or_scope)
		if request.remote_ip != "106.215.64.138"
	 		destroy_employee_session_path
	 	else
        	stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
	 	end
      end
end
