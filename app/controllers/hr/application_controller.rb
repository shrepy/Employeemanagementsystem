# frozen_string_literal: true

# applicationcontroller
module Hr
  class ApplicationController < ActionController::Base
    before_action :authorize_admin
    layout 'application'

    private

    def authorize_admin
      redirect_to root_path, { notice: 'You Have Not Access:)' } unless current_employee.is_hr?
    end
  end
end
