# frozen_string_literal: true

# Attendence controller
class AttendencesController < InheritedResources::Base
  #load_and_authorize_resource
  def index
    if current_user.role.name == 'HR'
      @attendences = Attendence.search(params[:search])
    else
      @attendences = Attendence.where(employee_id: current_employee).search(params[:search])
    end
  end

  def show
    @attendence = Attendence.find(params[:id])
    @attendences = Attendence.where(params[:employee_id])
  end

  def edit
    @attendence = Attendence.find(params[:id])
  end
  
  def create
    @attendence = Attendence.create(employee_id: current_employee.id, checkin_time: Time.zone.now, status: 'Present')
    redirect_to root_path if @attendence.save
  end

  def update
    @attendence = Attendence.find(params[:id])
    byebug 
    if params[:attendence].present?
      @attendence.update(attendence_params)
    elsif @attendence.update(checkout_time: Time.zone.now)
      redirect_to root_path
    else
      redirect_to attendences_path
    end
     redirect_to root_path
  end

   def attendence_params
     params.require(:attendence).permit(:checkout_time)
   end
end
