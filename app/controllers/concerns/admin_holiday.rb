# frozen_string_literal: true

module AdminHoliday
  def index
    @holidays = Holiday.all
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      redirect_to admin_main_holidays_path
    else
      render :new
    end
  end

  private

  def holiday_params
    params.require(:holiday).permit(:holiday_date, :holiday_name, :holiday_type)
  end
end
