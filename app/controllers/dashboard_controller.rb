# frozen_string_literal: true

# dashboard controller
class DashboardController < ApplicationController
  before_action :authenticate_employee!
  skip_before_action :authenticate_employee!, only: [:set_ip]
  def index
    @employees = Employee.all
  end
 

  def set_ip
    @ips = Ip.create(unblockip: params[:ip])
    redirect_to root_path  if @ips.save
  end
  
end
