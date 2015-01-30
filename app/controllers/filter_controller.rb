class FilterController < ApplicationController
	def city
    @cities = City
    .filter_name(params[:name])
    .order(:name)
    .pagination(params[:page])
  end

  def school
    @schools = School
    .filter_name(params[:name])
    .filter_city(params[:city_id])
    .order(:name)
    .pagination(params[:page])
  end

  def teacher
  	@teachers = Teacher
  	.filter_nip(params[:nip])
  	.filter_name(params[:name])
  	.filter_school(params[:school])
  	.order(:first_name)
    .pagination(params[:page])
  end

  def event
  	@events = Event
  	.filter_title(params[:title])
    .filter_vocational(params[:vocational])
    .filter_event_date(params[:date_start], params[:date_end])
    .filter_status(params[:status])
  	.order(:date_start)
    .pagination(params[:page])
  end

  def event_check_request
  	@school_requests = SchoolRequest
  	.filter_reference(params[:reference])
  	.filter_request_date(params[:date_start], params[:date_end])
  	.order(:request_date)
  end

  def participant_check_all
  	@event = Event.find(params[:event_id])
  	school_requests = SchoolRequest.joins(:vocationals).where("request_vocationals.vocational_id IN (?)", @event.vocational_id)
    sr_ids = []
    school_requests.each do |sr|
      sr_ids << sr.id
    end

    # minus teacher who already in request participant, minus teacher who already picked
    @teacher_vocationals = TeacherVocational
    .where(:vocational_id => @event.vocational_id)
    .where("teacher_id NOT IN (SELECT teacher_id FROM request_participants WHERE school_request_id IN (?))", sr_ids)
    .where("teacher_id NOT IN (SELECT teacher_id FROM event_participants WHERE event_id IN (?))", @event.id)
    .filter_nip(params[:nip])
  	.filter_name(params[:name])
  end

  def participant_checked
  	@event = Event.find(params[:event_id])
  	@event_participants = @event.participants.joins(:teacher)
  	.filter_nip(params[:nip])
  	.filter_name(params[:name])
  	.order("teachers.first_name")
  end
end