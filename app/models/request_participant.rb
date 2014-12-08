class RequestParticipant < ActiveRecord::Base
	belongs_to :school_request
	belongs_to :teacher

  attr_accessible :notes, :school_request_id, :teacher_id

  # scope :not_picked, select("*").joins(:order_request).where("EXTRACT(HOUR FROM delivered_time)+7>=17 AND EXTRACT(MINUTE FROM delivered_time)>0")

  def self.not_picked(event_id)
  	where("teacher_id NOT IN (SELECT teacher_id FROM event_participants WHERE event_id=#{event_id.to_i})")
  end
end
