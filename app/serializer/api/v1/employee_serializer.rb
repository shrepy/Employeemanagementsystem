# frozen_string_literal: true

module Api
  module V1
    class EmployeeSerializer < ActiveModel::Serializer
      attributes :id, :name, :email

      # def employees
      #   object.employees.map do |employee|
      #     {
      #       name: employee.name,
      #       email: employee.email,
      #       designation: employee.designation
      #     }
      #   end
      # end
    end
  end
end
