class User
  module Praise
    extend ActiveSupport::Concern

    included do
      action_store :praise, :topic, counter_cache: true
      action_store :praise, :reply, counter_cache: true
    end

    def praise(target)
      self.create_action(:praise, target: target)
    end

    def cancel_praise(target)
      self.destroy_action(:praise, target: target)
    end
  end
end