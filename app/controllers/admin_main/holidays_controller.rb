# frozen_string_literal: true

module AdminMain
  class HolidaysController < ApplicationController
    include AdminHoliday

    before_action :set_holiday, only: %i[edit update destroy show]

    private

    def set_holiday
      @holiday = Holiday.find_by_id params[:id]
      redirect_to root_path, { notice: 'NOT FOUND' } unless @holiday.present?
    end
  end
end
