# frozen_string_literal: true

class SingletonLeave
  @instance = new

  private_class_method :new
  def self.instance
    GlobelSetting.first
  end
end
