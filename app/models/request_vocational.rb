class RequestVocational < ActiveRecord::Base
	belongs_to :school_request
	belongs_to :vocational

  attr_accessible :notes, :school_request_id, :vocational_id
end
