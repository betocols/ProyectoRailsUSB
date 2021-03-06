class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == "admin"
        can [:read, :update, :destroy, :create], User#, Tutorial]
        can [:read, :destroy], [Question, CommentA, CommentQ, Answer]
        cannot :create, Answer
    elsif user.role == "user"
        can [:create, :read], [Question, Answer, CommentA, CommentQ]
        can :update, [User, Answer, CommentA, CommentQ]
        can :read, User
        can :destroy, Question
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
