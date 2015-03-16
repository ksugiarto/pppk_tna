class BasicCompetency < ActiveRecord::Base
	belongs_to :core_competency
	has_many :subjects, :class_name => "Subject"

  attr_accessible :core_competency_id, :seq_num, :description
end
