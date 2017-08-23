class User
  module Praise
    extend ActiveSupport::Concern

    included do
      action_store :praise, :topic, counter_cache: true
    end

    def praise(topic)
      self.create_action(:praise, target: topic)
    end

    def cancel_praise(topic)
      self.destroy_action(:praise, target: topic)
    end
  end
end