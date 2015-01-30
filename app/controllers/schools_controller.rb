class SchoolsController < ApplicationController
  def get_data
    @countries = Country.order(:name)
    @provinces = Province.order(:name)
    @cities = City.order(:name)
    @curicculums = Curicculum.order(:name)
  end

  # GET /schools
  # GET /schools.json
  def index
    get_data
    @schools = School.order(:name).pagination(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schools }
      format.js
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @school = School.find(params[:id])
    @modal = params[:modal].to_i

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.json
  def new
    @school = School.new
    get_data
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
    get_data
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(params[:school])

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render json: @school, status: :created, location: @school }
      else
        format.html { render action: "new" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schools/1
  # PUT /schools/1.json
  def update
    @school = School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end

  def import
  end

  def import_submit
    School.import(params[:file])
    redirect_to schools_path
  end
end
