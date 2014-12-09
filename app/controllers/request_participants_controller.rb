class RequestParticipantsController < ApplicationController
  def get_school
    @school = School.find(params[:school_id])
    @school_request = @school.requests.find(params[:school_request_id])
  end

  def get_teacher
    @teachers = @school.teachers.order(:first_name)
  end

  # GET /request_participants/1
  # GET /request_participants/1.json
  def show
    @request_participant = RequestParticipant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_participant }
      format.js
    end
  end

  # GET /request_participants/new
  # GET /request_participants/new.json
  def new
    get_school
    get_teacher
    @request_participant = @school_request.participants.new
  end

  # GET /request_participants/1/edit
  def edit
    get_school
    get_teacher
    @request_participant = @school_request.participants.find(params[:id])
  end

  # POST /request_participants
  # POST /request_participants.json
  def create
    get_school
    @request_participant = @school_request.participants.create(params[:request_participant])
  end

  # PUT /request_participants/1
  # PUT /request_participants/1.json
  def update
    get_school
    @request_participant = @school_request.participants.find(params[:id])
    @request_participant.update_attributes(params[:request_participant])
  end

  # DELETE /request_participants/1
  # DELETE /request_participants/1.json
  def destroy
    get_school
    @request_participant = @school_request.participants.find(params[:id])
    @request_participant.destroy
  end
end
