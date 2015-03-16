class TeacherSubject < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :teacher_vocational
	belongs_to :basic_competency

	has_many :details, :class_name => "TeacherSubjectDetail"

  attr_accessible :is_competent, :basic_competency_id, :teacher_id, :teacher_vocational_id
end
