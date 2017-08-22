class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_admin?
    else
      can :read, :all
      can [:edit, :update], Topic, user_id: user.id
      can [:update, :destroy], Reply, user_id: user.id

    end
  end
end
