class Ability
  include CanCan::Ability

  def initialize(user)
    user_group_id = user.try(:user_group_id).to_i

    tata_usaha_id = UserGroup.where("name ~* 'sub bagian tata usaha'").last.try(:id).to_i
    pelayanan_pendidikan_id = UserGroup.where("name ~* 'seksi pelayanan pendidikan'").last.try(:id).to_i
    kepala_upt_id = UserGroup.where("name ~* 'kepala upt'").last.try(:id).to_i

    if user_group_id == tata_usaha_id
        can :manage, [School, SchoolRequest, SchoolVocational, Teacher, Curicculum, EventParticipant, EventPrerequisite]
        can :read, [EventMatter, EventExam, Question, "report"]
        can :review, Event
    elsif user_group_id == pelayanan_pendidikan_id
        can :manage, [Event, EventMatter, EventExam, Question]
        can :read, [School, SchoolRequest, SchoolVocational, Teacher, Curicculum, EventParticipant, EventPrerequisite, "report"]
        # can [:read, :create, :update, :destroy], Event
    elsif user_group_id == kepala_upt_id
        can :manage, "report"
        can :read, [Event, EventMatter, EventExam, Question, School, SchoolRequest, SchoolVocational, Teacher, Curicculum, EventParticipant, EventPrerequisite]
    else # admin
        can :manage, :all
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
end
