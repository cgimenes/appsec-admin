class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      case user.role
      when 'admin'
        can :manage, :all
      when 'appsec'
        can :manage, [Vuln, Team, Asset]
        can :read, User
        can :create, User
      when 'guest'
        can :read, [Vuln, Team, Asset, User]
      end
      can [:read, :create], Comment
      can [:update, :destroy], Comment, user_id: user.id
    end
  end
end
