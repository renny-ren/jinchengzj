class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_admin?
    else
      can :read, :all
      roles_for_topic(user)
      roles_for_reply(user)
    end
  end

  protected

  def roles_for_topic(user)
    can :create, Topic
    can :update, Topic, user_id: user.id
    can :destroy, Topic do |topic|
      topic.user_id == user.id && topic.replies_count == 0
    end
  end

  def roles_for_reply(user)
    can :create, Reply
    can [:update, :destroy], Reply, user_id: user.id
  end

end
