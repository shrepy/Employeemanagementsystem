# frozen_string_literal: true

# Holidays controller
class HolidaysController < InheritedResources::Base
  before_action :authenticate_employee!
  def index
    @holidays = Holiday.all
  end
end
