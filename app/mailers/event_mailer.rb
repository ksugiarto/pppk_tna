class EventMailer < ActionMailer::Base
  default from: "\"PPPK TNA\" <system@gmail.com>"

  def event_invitation(event_id, school_id, participants, upt_leader)
  	@event = Event.find(event_id)
  	@school = School.find(school_id)
    @participants = participants
    @upt_leader = upt_leader
    
    mail(:to => @school.try(:email), :cc => "hanfe_strife@yahoo.co.id", :subject => "[no-reply]-Event Invitation")
    # mail(:to => shipper_email, :cc => "kristono.sugiarto@gmail.com", :subject => "[no-reply]-Proof of Delivery Notification")
  end
end
