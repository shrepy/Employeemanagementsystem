# frozen_string_literal: true

# applicationcontroller

module Hr
  # applicationcontroller
  class ApplicationController < ApplicationController
      protect_from_forgery unless: -> { request.format.json? }

    before_action :authorize_hr
    layout 'application'

    def authorize_hr
      redirect_to root_path, alert: I18n.t('employee.unauthorize_error') unless current_employee.is_hr?
    end
  end
end
