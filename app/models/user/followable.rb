class User
  module Followable
    extend ActiveSupport::Concern

    included do
      action_store :follow, :user, counter_cache: 'followers_count', user_counter_cache: 'following_count'
      action_store :follow, :topic
    end
  end
end
