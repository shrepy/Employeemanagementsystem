# frozen_string_literal: true

# Attendence controller
class AttendencesController < InheritedResources::Base
  # load_and_authorize_resource
  before_action :set_attendance, only: %i[show edit]
  def index
    @attendences = current_employee.attendences.order(created_at: :desc)
  end

  def show
    @attendence = if current_employee.is_hr?
                    Attendence.find_by_id params[:id]
                  else
                    Attendence.find_by(employee_id: current_employee.id)
                  end
    @attendences = Attendence.where(employee_id: @attendence.employee_id)
  end

  def edit
    if current_employee.is_hr?
      @attendence = Attendence.find(params[:id])
    else
      render json: { message: 'You Have Not Access :)' }, status: 404
    end
  end

  def create
    last_attendance = Attendence.where(checkin_time: Time.zone.now - 2.minutes..Time.zone.now,
                                       employee_id: current_employee.id).last
    if last_attendance.nil?
      Attendence.create(employee_id: current_employee.id, checkin_time: Time.zone.now,
                        status: 'Present', checkin_ip_address: request.remote_ip)
    else
      last_attendance.update_column('checkout_time', nil)
    end
    redirect_to root_path
  end

  def update
    @attendence = Attendence.find(params[:id])
    if params[:attendence].present?
      if @attendence.update(attendence_params)
        redirect_to attendences_path
      else
        render :edit
      end
    else
      redirect_to attendences_path
    end
  end

  def update_attendence
    attendence = current_employee.todays_last_attendence
    attendence.update(checkout_time: Time.zone.now, checkout_ip_address: request.remote_ip)
    redirect_to root_path
  end

  def search
    if current_employee.is_hr?
      @attendences = if params[:start_date].blank? && params[:end_date].blank?
                       Attendence.all
                     else
                       Attendence.where(created_at: params[:start_date]..params[:end_date])
                     end
    elsif params[:start_date].blank? && params[:end_date].blank?
      @attendences = Attendence.order(created_at: :desc)
    else
      @attendences = Attendence.where(employee_id: current_employee,
                                      created_at: params[:start_date].to_date..(params[:end_date].to_date + 1.day))
                               .order(created_at: :desc)
    end
  end

  def attendence_params
    params.require(:attendence).permit(:checkout_time)
  end

  def set_attendance
    @attendence = Attendence.find_by_id params[:id]
    render json: { message: 'Not Found' }, status: 404 unless @attendence.present?
  end
end
