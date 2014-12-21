class EventPrerequisitesController < ApplicationController
  def get_event
    @event = Event.find(params[:event_id])
  end

  # GET /event_prerequisites
  # GET /event_prerequisites.json
  def index
    @event_prerequisites = EventPrerequisite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_prerequisites }
    end
  end

  # GET /event_prerequisites/1
  # GET /event_prerequisites/1.json
  def show
    @event_prerequisite = EventPrerequisite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_prerequisite }
    end
  end

  # GET /event_prerequisites/new
  # GET /event_prerequisites/new.json
  def new
    @event_prerequisite = EventPrerequisite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_prerequisite }
    end
  end

  # GET /event_prerequisites/1/edit
  def edit
    get_event
    @event_prerequisite = @event.prerequisite.find(params[:id])
  end

  # POST /event_prerequisites
  # POST /event_prerequisites.json
  def create
    @event_prerequisite = EventPrerequisite.new(params[:event_prerequisite])

    respond_to do |format|
      if @event_prerequisite.save
        format.html { redirect_to @event_prerequisite, notice: 'Event prerequisite was successfully created.' }
        format.json { render json: @event_prerequisite, status: :created, location: @event_prerequisite }
      else
        format.html { render action: "new" }
        format.json { render json: @event_prerequisite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_prerequisites/1
  # PUT /event_prerequisites/1.json
  def update
    get_event
    @event_prerequisite = @event.prerequisites.find(params[:id])
    @event_prerequisite.update_attributes(params[:event_prerequisite])

    respond_to do |format|
      format.json { respond_with_bip(@event_prerequisite) }
    end
  end

  # DELETE /event_prerequisites/1
  # DELETE /event_prerequisites/1.json
  def destroy
    @event_prerequisite = EventPrerequisite.find(params[:id])
    @event_prerequisite.destroy

    respond_to do |format|
      format.html { redirect_to event_prerequisites_url }
      format.json { head :no_content }
    end
  end
end
