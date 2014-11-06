class TeacherVocational < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :vocational

  attr_accessible :notes, :teacher_id, :vocational_id
end
