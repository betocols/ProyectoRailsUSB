class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role=="admin"
        can [:read, :update, :destroy], [User, Tutorial]
        can [:read, :destroy], Question
    else user.role=="user"
        can [:create, :read], [Question, Answer, Comment]
        can :update, Answer
    end
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
end
