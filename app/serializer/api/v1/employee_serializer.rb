# frozen_string_literal: true

module Api
  module V1
    class EmployeeSerializer < ActiveModel::Serializer
      attributes :id, :name, :email
    end
  end
end
