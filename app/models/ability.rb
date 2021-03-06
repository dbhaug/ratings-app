class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
    if user.admin
        can :manage, :all
    elsif user.experienced
        can :create, Item
        baseUser user
    elsif User.where(id: user.id).exists?
        baseUser user
    else
        notSignedIn
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end

  private

  def baseUser(user)
    can :home, [User]
    can :read, :all
    cannot :read, User
    can [:read, :update], User, id: user.id
    can :updateFavorites, User, id: user.id
    can :update, Review
    cannot :index, User
    cannot :showFlagged, Review
    can [:new, :create], Review
  end
  
  def notSignedIn
    can :create, :session
    can :home, User
    can :read, Item
    can :read, Category
    can [:new,:create], User
    cannot :index, User
    cannot :showFlagged, Review
  end
end
