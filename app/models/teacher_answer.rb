class TeacherAnswer < ActiveRecord::Base
	belongs_to :event_exam
	belongs_to :teacher

	has_many :details, :class_name => "TeacherAnswerDetail"

  attr_accessible :event_exam_id, :score, :teacher_id
end
