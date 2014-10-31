class CoreCompetency < ActiveRecord::Base
	belongs_to :vocational
	has_many :basic_competencies, :class_name => "BasicCompetency"

  attr_accessible :description, :seq_num, :vocational_id
end
