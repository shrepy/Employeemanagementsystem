
class PasswordResetsController < ApplicationController
	def new
		
	end

	def create
		@employee = Employee.find_by(email: params[:email])
		if @employee.present?
			PasswordMailer.with(employee: @employee).reset.deliver_now
		end
		redirect_to root_path , notice: "kjbgfetjeb"
	end

	def edit
      @employee = Employee.find_signed(params[:token], purpose: "password_reset")
	end


	def update
		@employee = Employee.find_signed(params[:token], purpose: "password_reset")
		if @employee.update(password_params)
		   redirect_to employee_session_path, notice: "your password was reset successfully. please sign in"
		else
			render :edit
		end
	end

	private

	def password_params
		params.require(:employee).permit(:password, :password_confirmation)
	end
end