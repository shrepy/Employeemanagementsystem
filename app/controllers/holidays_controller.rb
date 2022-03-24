# frozen_string_literal: true

# Holidays controller
class HolidaysController < InheritedResources::Base
  def index
    @holidays = Holiday.all
  end
end
