# frozen_string_literal: true

module Api
  module V1
    class PerformanceSerializer < ActiveModel::Serializer
      attributes :id, :points, :month, :from, :to, :employee_id
    end
  end
end
