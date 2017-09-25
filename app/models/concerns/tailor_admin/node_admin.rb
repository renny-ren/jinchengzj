module TailorAdmin
  module NodeAdmin
    extend ActiveSupport::Concern

    included do
      rails_admin do
        # visible do
        #   # controller bindings is available here. Example:
        #   bindings[:controller].current_user.role == :admin
        # end
        label '节点'
        list do
          field :name do
            label '节点名'
          end
          field :topics_count do
            label '帖子数量'
          end
        end

        show do
          field :name do
            label '节点名'
          end
          field :topics_count do
            label '帖子数量'
          end
          field :topics do
            label '相关帖子'
          end
        end

        edit do
          field :name do
            required true
            label '节点名' 
          end
        end
      end
    end
  end
end