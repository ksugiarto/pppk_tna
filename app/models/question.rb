class Question < ActiveRecord::Base
	belongs_to :event_exam
  # has_many :choices, :class_name => "QuestionChoice"

  attr_accessible :answer_1, :answer_2, :answer_3, :answer_4, :content, :event_exam_id, :notes, :right_answer, :score
end
