# frozen_string_literal: true

# dashboard controller
class DashboardController < ApplicationController
  before_action :authenticate_employee!
  def index
    @employees = Employee.all
  end
end
