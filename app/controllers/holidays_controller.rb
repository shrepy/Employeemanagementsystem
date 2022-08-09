# frozen_string_literal: true

# Holidays controller
class HolidaysController < ApplicationController
  before_action :authenticate_employee!
  load_and_authorize_resource
  include AdminHoliday
end
