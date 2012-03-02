class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.role? :transporter
      can :read, :all
    end

    if user.role? :customer
      can :read, :all
      can :update, Delivery, :user_id => user.id
    end
  end
end
