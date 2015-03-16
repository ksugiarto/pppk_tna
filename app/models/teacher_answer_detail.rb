class TeacherAnswerDetail < ActiveRecord::Base
	belongs_to :teacher_answer
	belongs_to :question
	belongs_to :subject

  attr_accessible :answer, :is_correct, :question_id, :subject_id, :teacher_answer_id
end
