class TeacherSubjectDetail < ActiveRecord::Base
	belongs_to :teacher_subject
	belongs_to :subject

  attr_accessible :is_competent, :subject_id, :teacher_subject_id
end
