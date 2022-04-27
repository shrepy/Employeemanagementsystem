# frozen_string_literal: true

# Attendence controller
class AttendencesController < InheritedResources::Base
  #load_and_authorize_resource
  def index
    if current_user.role.name == 'HR'
      unless params[:start_date].blank? && params[:end_date].blank?
        @attendences = Attendence.where(created_at: params[:start_date]..params[:end_date])
      else
        @attendences = Attendence.all 
      end
    else
      unless params[:start_date].blank? && params[:end_date].blank?
        @attendences = Attendence.where(employee_id: current_employee, created_at: params[:search]..params[:sear])
      else
        @attendences = Attendence.all
      end
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
    last = Attendence.where(checkin_time: Time.zone.now-2.minutes..Time.zone.now).last
    unless last.nil?
       last.update(checkout_time: nil)
    else
      @attendence = Attendence.create(employee_id: current_employee.id, checkin_time: Time.zone.now, status: 'Present')
      @attendence.save
    end
    redirect_to root_path
  end

  def update
    @attendence = Attendence.find(params[:id])
    if params[:attendence].present?
      @attendence.update(attendence_params)
    elsif @attendence.update(checkout_time: Time.zone.now)
    else
      redirect_to attendences_path
    end
     redirect_to root_path
  end

  def attendence_params
   params.require(:attendence).permit(:checkout_time)
  end

end
