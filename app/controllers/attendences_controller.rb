# frozen_string_literal: true

# Attendence controller
class AttendencesController < InheritedResources::Base
  def create
    @attendence = Attendence.create(employee_id: current_employee.id, checkin_time: Time.zone.now, status: 'Present')
    redirect_to root_path if @attendence.save
  end

  def update
    @attendence = Attendence.find(params[:id])
    if @attendence.update(checkout_time: Time.zone.now)
      redirect_to root_path
    else
      redirect_to employee_path
    end
  end

  # def attendence_params
  #   params.require(:attendence).permit(:checkin_time, :checkout_time, :status, :employee_id)
  # end
end