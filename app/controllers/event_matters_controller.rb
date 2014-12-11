class EventMattersController < ApplicationController
  def get_event
    @event = Event.find(params[:event_id])
  end

  # GET /event_matters
  # GET /event_matters.json
  def index
    @event_matters = EventMatter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_matters }
    end
  end

  # GET /event_matters/1
  # GET /event_matters/1.json
  def show
    @event_matter = EventMatter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_matter }
    end
  end

  # GET /event_matters/new
  # GET /event_matters/new.json
  def new
    get_event
    @event_matter = @event.matters.new
  end

  # GET /event_matters/1/edit
  def edit
    get_event
    @event_matter = @event.matters.find(params[:id])
  end

  # POST /event_matters
  # POST /event_matters.json
  def create
    get_event
    @event_matter = @event.matters.create(params[:event_matter])
  end

  # PUT /event_matters/1
  # PUT /event_matters/1.json
  def update
    get_event
    @event_matter = @event.matters.find(params[:id])
    @event_matter.update_attributes(params[:event_matter])
  end

  # DELETE /event_matters/1
  # DELETE /event_matters/1.json
  def destroy
    get_event
    @event_matter = @event.matters.find(params[:id])
    @event_matter.document = nil # remove the attachment first
    @event_matter.save
    @event_matter.destroy
  end

  def print_exam_pdf
    get_event
    @event_matter = @event.matters.find(params[:id])

    respond_to do |format|
      format.pdf do
        pdf = ExamPdf.new(@event, @event_matter, view_context)
        send_data pdf.render, filename: "#{I18n.t 'print'} #{I18n.t 'event_matter.event_matter'} #{I18n.l Time.now.localtime, :format => '%Y-%m-%d %H-%M-%S'}.pdf",
        type: "application/pdf", :disposition => "inline"
      end 
    end
  end
end
