class RequestParticipantsController < ApplicationController
  # GET /request_participants
  # GET /request_participants.json
  def index
    @request_participants = RequestParticipant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_participants }
    end
  end

  # GET /request_participants/1
  # GET /request_participants/1.json
  def show
    @request_participant = RequestParticipant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_participant }
    end
  end

  # GET /request_participants/new
  # GET /request_participants/new.json
  def new
    @request_participant = RequestParticipant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_participant }
    end
  end

  # GET /request_participants/1/edit
  def edit
    @request_participant = RequestParticipant.find(params[:id])
  end

  # POST /request_participants
  # POST /request_participants.json
  def create
    @request_participant = RequestParticipant.new(params[:request_participant])

    respond_to do |format|
      if @request_participant.save
        format.html { redirect_to @request_participant, notice: 'Request participant was successfully created.' }
        format.json { render json: @request_participant, status: :created, location: @request_participant }
      else
        format.html { render action: "new" }
        format.json { render json: @request_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_participants/1
  # PUT /request_participants/1.json
  def update
    @request_participant = RequestParticipant.find(params[:id])

    respond_to do |format|
      if @request_participant.update_attributes(params[:request_participant])
        format.html { redirect_to @request_participant, notice: 'Request participant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_participants/1
  # DELETE /request_participants/1.json
  def destroy
    @request_participant = RequestParticipant.find(params[:id])
    @request_participant.destroy

    respond_to do |format|
      format.html { redirect_to request_participants_url }
      format.json { head :no_content }
    end
  end
end
