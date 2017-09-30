module TailorAdmin
  module TopicAdmin
    extend ActiveSupport::Concern

    included do
      rails_admin do
        label '帖子'
        label_plural '帖子'

        list do
          field :title
          field :body
          field :is_excellent do
            label '精华'
          end
          field :praises_count
          field :replies_count
        end

      end
    end
  end
end