class EventParticipantsController < ApplicationController
  def get_event
    @event = Event.find(params[:event_id])
  end

  # GET /event_participants
  # GET /event_participants.json
  def index
    @event_participants = EventParticipant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_participants }
    end
  end

  # GET /event_participants/1
  # GET /event_participants/1.json
  def show
    @event_participant = EventParticipant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_participant }
    end
  end

  # GET /event_participants/new
  # GET /event_participants/new.json
  def new
    @event_participant = EventParticipant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_participant }
    end
  end

  def check_request
    get_event
    @school_requests = SchoolRequest.joins(:vocationals).where("request_vocationals.vocational_id IN (?)", @event.vocational_id)
  end

  def check_all
    get_event
    school_requests = SchoolRequest.joins(:vocationals).where("request_vocationals.vocational_id IN (?)", @event.vocational_id)
    sr_ids = []
    school_requests.each do |sr|
      sr_ids << sr.id
    end

    # minus teacher who already in request participant, minus teacher who already picked
    @teacher_vocationals = TeacherVocational.where(:vocational_id => @event.vocational_id)
                                            .where("teacher_id NOT IN (SELECT teacher_id FROM request_participants WHERE school_request_id IN (?))", sr_ids)
                                            .where("teacher_id NOT IN (SELECT teacher_id FROM event_participants WHERE event_id IN (?))", @event.id)

  end

  def checked
    get_event
    @event_participants = @event.participants.joins(:teacher).order("teachers.first_name")
  end

  def checked_email
    get_event
  end

  def send_invitation
    get_event

    # select distinct(school_id) from event_participants e join teachers t on e.teacher_id=t.id;

    schools = @event.participants.select("teachers.school_id").joins(:teacher).uniq
    schools.each do |s|
      school = School.find(s.school_id)
      teachers = @event.participants.joins(:teacher).where("teachers.school_id=#{school.id}").uniq

      EventMailer.event_invitation(@event.id, school.id, teachers, ApplicationController.helpers.upt_leader).deliver
    end

    redirect_to checked_email_event_event_participants_path(@event)
  end

  def print_invitation
    get_event

    respond_to do |format|
      format.pdf do
        pdf = InvitationPdf.new(@event, ApplicationController.helpers.upt_leader, view_context)
        send_data pdf.render, filename: "#{I18n.t 'print'} #{I18n.t 'event_participant.invitation'} #{I18n.l Time.now.localtime, :format => '%Y-%m-%d %H-%M-%S'}.pdf",
        type: "application/pdf", :disposition => "inline"
      end 
    end
  end

  def pick_participant
    get_event
    @event.participants.create(:teacher_id => params[:teacher_id])
    
    check_request
    check_all
  end

  def register_participant
    get_event
  end

  def fix_participant
    get_event
    @event.participants.each do |participant|
      participant.update_attributes(:status => 0)
    end
    
    if params[:event_participant].present?
      params[:event_participant][:participant_ids].each do |participant|
        event_participant = @event.participants.find(participant)
        event_participant.update_attributes(:status => 1)
      end
    end

    redirect_to @event
  end

  def review_participant
    get_event
  end

  # GET /event_participants/1/edit
  def edit
    @event_participant = EventParticipant.find(params[:id])
  end

  # POST /event_participants
  # POST /event_participants.json
  def create
    @event_participant = EventParticipant.new(params[:event_participant])

    respond_to do |format|
      if @event_participant.save
        format.html { redirect_to @event_participant, notice: 'Event participant was successfully created.' }
        format.json { render json: @event_participant, status: :created, location: @event_participant }
      else
        format.html { render action: "new" }
        format.json { render json: @event_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_participants/1
  # PUT /event_participants/1.json
  def update
    get_event
    @event_participant = @event.participants.find(params[:id])
    @event_participant.update_attributes(params[:event_participant])

    if @event.status.to_i==1
      teacher_history = @event_participant.teacher.histories.where(:event_id => @event.id, :event_participant_id => @event_participant.id).last
      if teacher_history.blank?
        teacher_history = @event_participant.teacher.histories.create(:event_id => @event.id, :event_participant_id => @event_participant.id, :status => @event_participant.status.to_i)
      else
        teacher_history.update_attributes(:status => @event_participant.status.to_i)
      end
    end

    respond_to do |format|
      format.json { respond_with_bip(@event_participant) }
    end
  end

  # DELETE /event_participants/1
  # DELETE /event_participants/1.json
  def destroy
    get_event
    @event_participant = @event.participants.find(params[:id])
    @event_participant.destroy
  end
end
