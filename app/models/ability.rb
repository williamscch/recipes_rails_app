class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, Recipe, public: true

    return unless current_user.present?

    can :manage, Recipe, user: current_user
    # can :manage, Comment, user: current_user
    # can :manage, Like, user: current_user

    # return unless current_user.role == 'admin'

    # can :manage, :all
  end
end
