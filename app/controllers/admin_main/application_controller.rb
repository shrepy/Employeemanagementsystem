module Admin
  # applicationcontroller
  class ApplicationController < ActionController::Base
    before_action :authorize_admin
    layout 'application'

    def authorize_admin
      redirect_to root_path, alert: I18n.t('employee.unauthorize_error') unless current_employee.is_admin?
    end
  end
end