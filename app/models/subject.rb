class Subject < ActiveRecord::Base
	belongs_to :basic_competency

  attr_accessible :basic_competency_id, :description, :seq_num

  def full_seq_num
  	"#{basic_competency.try(:core_competency).try(:seq_num)}.#{basic_competency.try(:seq_num)}.#{seq_num}"
  end
end
