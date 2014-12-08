class TeacherHistory < ActiveRecord::Base
	belongs_to :event
	belongs_to :event_participant
	belongs_to :teacher

  attr_accessible :event_id, :event_participant_id, :status, :teacher_id

  def status_name
    case status
    when 0
      return "#{I18n.t 'event_participant.invited'}"
    when 1
      return "#{I18n.t 'event_participant.fix'}"
    when 5
      return "#{I18n.t 'event_participant.cancel'}"
    when 7
      return "#{I18n.t 'event_participant.pass'}"
    when 8
      return "#{I18n.t 'event_participant.not_pass'}"
    else return ""
    end
  end
end
