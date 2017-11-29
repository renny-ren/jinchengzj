class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    can :read, :all
    if @user.blank?
    elsif @user.role == 'member'
      roles_for_members
    elsif @user.role == 'admin'
      roles_for_admin
    else @user.role == 'root'
      can :manage, :all
    end
  end

  protected

  def roles_for_members
    topic_for_members
    reply_for_all
  end

  def roles_for_admin
    topic_for_admin
    reply_for_all
  end

  def topic_for_members
    can :create, Topic
    can :update, Topic, user_id: user.id
    can :destroy, Topic do |topic|
      topic.user_id == user.id && topic.replies_count == 0
    end
  end

  def reply_for_all
    can :create, Reply
    can [:update, :destroy], Reply, user_id: user.id
  end

  def topic_for_admin
    can [:create, :action, :destroy], Topic
    can :update, Topic, user_id: user.id
  end

end
