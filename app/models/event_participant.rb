class EventParticipant < ActiveRecord::Base
  belongs_to :event
	belongs_to :event_exam
	belongs_to :teacher

	before_create :default_status

  attr_accessible :event_id, :event_exam_id, :exam_grade, :status, :teacher_id, :total_presence

  scope :new_participant, where("event_participants.status = ? OR event_participants.status IS NULL", 0)
  scope :fix_participant, where(:status => 1)

  scope :have_email, joins(:teacher, "INNER JOIN schools ON teachers.school_id=schools.id").where("schools.email IS NOT NULL AND schools.email NOT LIKE ''")
  scope :no_email, joins(:teacher, "INNER JOIN schools ON teachers.school_id=schools.id").where("schools.email IS NULL OR schools.email LIKE ''")

  def default_status
  	if self.status.blank?
      self.status = 0
    end
  end

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

  def self.filter_nip(nip)
    if nip.present?
      joins(:teacher).where("teachers.nip ~* '#{nip}'")
    else
      scoped
    end
  end

  def self.filter_name(name)
    if name.present?
      joins(:teacher).where("teachers.first_name ~* ? OR teachers.last_name ~* ?", name, name)
    else
      scoped
    end
  end
end
