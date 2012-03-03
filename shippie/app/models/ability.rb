class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.role? :transporter
      can :read, :all
      can :create, Bid
    end

    if user.role? :customer
      can :read, :all
      can :update, Delivery, :user_id => user.id
      can :create, Delivery
      can :destroy, Delivery, :user_id => user.id
    end
  end
end
