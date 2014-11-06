class RequestParticipant < ActiveRecord::Base
	belongs_to :school_request
	belongs_to :teacher

  attr_accessible :notes, :school_request_id, :teacher_id
end
