# frozen_string_literal: true

module AdminMain
  class HolidaysController < ApplicationController
    include AdminHoliday

    before_action :set_holiday, only: %i[edit update destroy show]

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
      redirect_to root_path, { notice: 'NOT FOUND' } unless @holiday.present?
    end
  end
end
