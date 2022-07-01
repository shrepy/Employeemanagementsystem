# frozen_string_literal: true

module AdminMain
  class HolidaysController < ApplicationController
    before_action :set_holiday, only: %i[edit update destroy show]

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

    def edit; end

    def show; end

    def update
      if @holiday.update(holiday_params)
        redirect_to admin_main_holidays_path
      else
        render :edit
      end
    end

    def destroy
      if @holiday.destroy
        redirect_to admin_main_holidays_path
      else
        render :index
      end
    end

    private

    def set_holiday
      @holiday = Holiday.find_by_id params[:id]
      redirect_to root_path, { notic: 'NOT FOUND' } unless @holiday.present?
    end

    def holiday_params
      params.require(:holiday).permit(:holiday_date, :holiday_name, :holiday_type)
    end
  end
end
