class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.pagination(params[:page])

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @events }
    # end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @modal = params[:modal].to_i

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
      format.js # show.js.erb
      format.pdf do
        pdf = EventIndividualPdf.new(@event, ApplicationController.helpers.company_name, ApplicationController.helpers.get_date_print, view_context)
        send_data pdf.render, filename: "#{I18n.t 'event.event'} #{I18n.l Time.now.localtime, :format => '%Y-%m-%d %H-%M-%S'}.pdf",
        type: "application/pdf", :disposition => "inline"
      end
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @event.date_start = params[:date_start]
    @event.date_end = params[:date_end]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  def check_request #step 1
    @school_requests = SchoolRequest.order(:request_date)

    if params[:id].to_i==0
      @event_id = 0
    else
      @event = Event.find(params[:id])
      @event_id = @event.id
    end
  end

  def check_request_next
    if params[:id].to_i==0
      @event = Event.create(:title => "Diklat Baru")
    else
      @event = Event.find(params[:id])
    end

    respond_to do |format|
      format.html { redirect_to pick_date_events_path(:id => @event.id) }
    end
  end

  def pick_date #step 2
    @event = Event.find(params[:id]) if params[:id].to_i!=0
    @events = Event.where("date_start IS NOT NULL")
  end

  def save_date
    @event = Event.find(params[:id])
    @event.update_attributes(:date_start => params[:date_start], :date_end => params[:date_end])

    respond_to do |format|
      format.html { redirect_to pick_vocational_event_path(@event) }
    end
  end

  def pick_vocational #step 3
    @event = Event.find(params[:id])
    @vocationals = Vocational.order(:curicculum_id, :name).pagination(params[:page])
  end

  def save_vocational
    @event = Event.find(params[:id])
    @event.update_attributes(:vocational_id => params[:vocational_id].to_i)

    respond_to do |format|
      format.html { redirect_to entry_information_event_path(@event) }
    end
  end

  def entry_information #step 4
    @event = Event.find(params[:id])
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
