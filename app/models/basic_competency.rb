class BasicCompetency < ActiveRecord::Base
	belongs_to :core_competency

  attr_accessible :core_competency_id, :seq_num, :description
end
