class EventExamsController < ApplicationController
  def get_event
    @event = Event.find(params[:event_id])
  end

  # GET /event_exams
  # GET /event_exams.json
  def index
    @event_exams = EventExam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_exams }
    end
  end

  # GET /event_exams/1
  # GET /event_exams/1.json
  def show
    get_event
    @event_exam = @event.exams.find(params[:id])
    @modal = params[:modal].to_i

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_exam }
      format.js # show.js.erb
      format.pdf do
        pdf = ExamPdf.new(@event.id, @event_exam.id, ApplicationController.helpers.company_name, ApplicationController.helpers.get_date_print, view_context)
        send_data pdf.render, filename: "#{I18n.t 'event_exam.event_exam'} #{I18n.l Time.now.localtime, :format => '%Y-%m-%d %H-%M-%S'}.pdf",
        type: "application/pdf", :disposition => "inline"
      end
    end
  end

  # GET /event_exams/new
  # GET /event_exams/new.json
  def new
    get_event
    @event_exam = @event.exams.new
  end

  # GET /event_exams/1/edit
  def edit
    get_event
    @event_exam = @event.exams.find(params[:id])
  end

  # POST /event_exams
  # POST /event_exams.json
  def create
    get_event
    @event_exam = @event.exams.create(params[:event_exam])

    respond_to do |format|
      format.html { redirect_to event_event_exam_path(@event, @event_exam), notice: 'Event exam was successfully created.' }
      # format.json { render json: @event_exam, status: :created, location: @event_exam }
    end
  end

  # PUT /event_exams/1
  # PUT /event_exams/1.json
  def update
    get_event
    @event_exam = @event.exams.find(params[:id])
    @event_exam.update_attributes(params[:event_exam])

    respond_to do |format|
      format.html { redirect_to event_event_exam_path(@event, @event_exam), notice: 'Event exam was successfully updated.' }
      # format.json { head :no_content }
    end
  end

  # DELETE /event_exams/1
  # DELETE /event_exams/1.json
  def destroy
    get_event
    @event_exam = @event.exams.find(params[:id])
    @event_exam.destroy

    respond_to do |format|
      format.html { redirect_to event_exams_url }
      format.json { head :no_content }
    end
  end
end
