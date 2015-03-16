class EventExam < ActiveRecord::Base
	belongs_to :event
  has_many :questions, :class_name => "Question"
  has_many :teacher_answers, :class_name => "TeacherAnswer"

  attr_accessible :description, :event_id, :exam_type
end
