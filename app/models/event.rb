class Event < ActiveRecord::Base
  belongs_to :vocational
  has_many :exams, :class_name => "EventExam"
  has_many :matters, :class_name => "EventMatter"
  has_many :participants, :class_name => "EventParticipant"
  has_many :prerequisites, :class_name => "EventPrerequisite"

  before_create :default_status
  after_create :default_prerequisite

  attr_accessible :date_end, :date_start, :description, :title, :status, :vocational_id

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end

  def default_status
  	if self.status.blank?
      self.status = 0
    end
  end

  def default_prerequisite
    EventPrerequisite.create(:event_id => self.id)
  end

  def status_name
    case status
    when 0
      return "#{I18n.t 'event.new'}"
    when 1
      return "#{I18n.t 'event.close'}"
    when 5
      return "#{I18n.t 'event.void'}"
    else return ""
    end
  end


  def self.filter_title(title)
    if title.present?
      where("title ~* ?", title)
    else
      scoped
    end
  end

  def self.filter_vocational(vocational)
    if vocational.present?
      where("vocational_id IN (?)", vocationals = Vocational.where("name ~* ?", vocational))
    else
      scoped
    end
  end

  def self.filter_event_date(start_date, end_date)
    if start_date.present? and end_date.blank?
      where("date_start >= ?", start_date)
    elsif start_date.blank? and end_date.present?
      where("date_start <= ?", "#{end_date} 23:59:59")
    elsif start_date.present? and end_date.present?
      where("date_start BETWEEN ? AND ?", start_date, "#{end_date} 23:59:59")
    else
      where("EXTRACT(MONTH FROM date_start)=EXTRACT(MONTH FROM CURRENT_DATE)")
    end
  end

  def self.filter_status(id)
    if id.present?
      where(:status => id)
    else
      scoped
    end
  end
end
