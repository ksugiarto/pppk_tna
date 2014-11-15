class SchoolRequestsController < ApplicationController
  def get_school
    @school = School.find(params[:school_id])
  end

  def show
    get_school
    @school_request = @school.requests.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /school_requests/new
  # GET /school_requests/new.json
  def new
    get_school
    @school_request = @school.requests.new
  end

  # GET /school_requests/1/edit
  def edit
    get_school
    @school_request = @school.requests.find(params[:id])
  end

  # POST /school_requests
  # POST /school_requests.json
  def create
    get_school
    @school_request = @school.requests.create(params[:school_request])
  end

  # PUT /school_requests/1
  # PUT /school_requests/1.json
  def update
    get_school
    @school_request = @school.requests.find(params[:id])
    @school_request.update_attributes(params[:school_request])
  end

  # DELETE /school_requests/1
  # DELETE /school_requests/1.json
  def destroy
    get_school
    @school_request = @school.requests.find(params[:id])
    @school_request.destroy
  end
end
