module TailorAdmin
  module UserAdmin
    extend ActiveSupport::Concern

    included do
      rails_admin do
        list do
          # field :avatar, :paperclip
          field :username do
            label 'username'
          end
          field :nickname do
            label 'nickname'
          end
          field :gender
          field :major
          field :topics_count
          field :replies_count
        end
      end      
    end
  end
end