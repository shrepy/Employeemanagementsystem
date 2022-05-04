# frozen_string_literal: true

# Holidays controller
class HolidaysController < InheritedResources::Base
  before_action :authenticate_employee!
  load_and_authorize_resource
  def index
    @holidays = Holiday.all
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save 
      redirect_to holidays_path
    else
      render :new 
    end
  end

  private

  def holiday_params
    params.require(:holiday).permit(:holiday_date, :holiday_name)
  end
end
