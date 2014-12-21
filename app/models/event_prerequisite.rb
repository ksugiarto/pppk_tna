class EventPrerequisite < ActiveRecord::Base
	belongs_to :event
	
  attr_accessible :event_id, :max_age, :max_event_count, :max_long_teach, :min_age, :min_long_teach
end
