class SchoolRequest < ActiveRecord::Base
	belongs_to :school

	has_many :participants, :class_name => "RequestParticipant"
	has_many :vocationals, :class_name => "RequestVocational"
	
  attr_accessible :notes, :references_number, :request_date, :school_id
end
