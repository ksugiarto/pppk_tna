class RequestVocationalsController < ApplicationController
  # GET /request_vocationals
  # GET /request_vocationals.json
  def index
    @request_vocationals = RequestVocational.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_vocationals }
    end
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
    @request_vocational = RequestVocational.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_vocational }
    end
  end

  # GET /request_vocationals/1/edit
  def edit
    @request_vocational = RequestVocational.find(params[:id])
  end

  # POST /request_vocationals
  # POST /request_vocationals.json
  def create
    @request_vocational = RequestVocational.new(params[:request_vocational])

    respond_to do |format|
      if @request_vocational.save
        format.html { redirect_to @request_vocational, notice: 'Request vocational was successfully created.' }
        format.json { render json: @request_vocational, status: :created, location: @request_vocational }
      else
        format.html { render action: "new" }
        format.json { render json: @request_vocational.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_vocationals/1
  # PUT /request_vocationals/1.json
  def update
    @request_vocational = RequestVocational.find(params[:id])

    respond_to do |format|
      if @request_vocational.update_attributes(params[:request_vocational])
        format.html { redirect_to @request_vocational, notice: 'Request vocational was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_vocational.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_vocationals/1
  # DELETE /request_vocationals/1.json
  def destroy
    @request_vocational = RequestVocational.find(params[:id])
    @request_vocational.destroy

    respond_to do |format|
      format.html { redirect_to request_vocationals_url }
      format.json { head :no_content }
    end
  end
end
