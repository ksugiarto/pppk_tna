class EventMatter < ActiveRecord::Base
	belongs_to :event

  attr_accessible :document, :event_id, :notes
  
  has_attached_file :document, :url  => "/event_matter/:id/:basename.:extension",
	  													 :path => ":rails_root/public/event_matter/:id/:basename.:extension"

  validates_attachment_content_type :document, :content_type => [ 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]
end
