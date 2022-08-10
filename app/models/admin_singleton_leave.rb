# frozen_string_literal: true

class AdminSingletonLeave
  @instance = new
  private_class_method :new
  def self.instance
    AdminGlobelSetting.first
  end
end
