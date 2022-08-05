# frozen_string_literal: true

class SingletonLeave
  def self.instance
    GlobelSetting.first
  end
end
