class Event < ActiveRecord::Base
  belongs_to :vocational
  has_many :exams, :class_name => "EventExam"
  has_many :matters, :class_name => "EventMatter"
  has_many :participants, :class_name => "EventParticipant"

  before_create :default_status

  attr_accessible :date_end, :date_start, :description, :title, :status, :vocational_id

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end

  def default_status
  	if self.status.blank?
      self.status = 0
    end
  end
end
