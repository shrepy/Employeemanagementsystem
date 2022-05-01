# frozen_string_literal: true

# Attendence controller
class AttendencesController < InheritedResources::Base
  #load_and_authorize_resource
  def index
    if current_user.role.name == 'HR'
        @attendences = Attendence.order(created_at: :desc) 
    else
        @attendences = Attendence.where(employee_id: current_employee).order(created_at: :desc)
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
      @attendence = Attendence.create(employee_id: current_employee.id, checkin_time: Time.zone.now, status: 'Present', ip_address: request.remote_ip)
      @attendence.save
    end
    redirect_to root_path
  end

  def update
    @attendence = Attendence.find(params[:id])
    if params[:attendence].present?
      @attendence.update(attendence_params)
      redirect_to root_path
    else
      redirect_to attendences_path
    end
  end

  def update_attendence
    attendence = current_employee.todays_last_attendence
    attendence.update(checkout_time: Time.zone.now, ip_address: request.remote_ip)
    redirect_to root_path
  end

  def search
    if current_user.role.name == 'HR'
      unless params[:start_date].blank? && params[:end_date].blank?
        @attendences = Attendence.where(created_at: params[:start_date]..params[:end_date])
      else
        @attendences = Attendence.all 
      end
    else
      unless params[:start_date].blank? && params[:end_date].blank?
        @attendences = Attendence.where(employee_id: current_employee, created_at: params[:start_date].to_date..(params[:end_date].to_date + 1.day)).order(created_at: :desc)
      else
        @attendences = Attendence.order(created_at: :desc)
      end
    end
  end

  def attendence_params
   params.require(:attendence).permit(:checkout_time)
  end

end
