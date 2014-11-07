class RequestVocationalsController < ApplicationController
  def get_school
    @school = School.find(params[:school_id])
    @school_request = @school.requests.find(params[:school_request_id])
  end

  def get_vocational
    @vocationals = Vocational.order(:name)
  end

  # GET /request_vocationals/1
  # GET /request_vocationals/1.json
  def show
    @request_vocational = RequestVocational.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_vocational }
    end
  end

  # GET /request_vocationals/new
  # GET /request_vocationals/new.json
  def new
    get_school
    get_vocational
    @request_vocational = @school_request.vocationals.new
  end

  # GET /request_vocationals/1/edit
  def edit
    get_school
    get_vocational
    @request_vocational = @school_request.vocationals.find(params[:id])
  end

  # POST /request_vocationals
  # POST /request_vocationals.json
  def create
    get_school
    @request_vocational = @school_request.vocationals.create(params[:request_vocational])
  end

  # PUT /request_vocationals/1
  # PUT /request_vocationals/1.json
  def update
    get_school
    @request_vocational = @school_request.vocationals.find(params[:id])
    @request_vocational.update_attributes(params[:request_vocational])
  end

  # DELETE /request_vocationals/1
  # DELETE /request_vocationals/1.json
  def destroy
    get_school
    @request_vocational = @school_request.vocationals.find(params[:id])
    @request_vocational.destroy
  end
end
