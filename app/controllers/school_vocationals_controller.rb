class SchoolVocationalsController < ApplicationController
  def get_school
    @school = School.find(params[:school_id])
  end

  def get_vocational
    @vocationals = Vocational.select("DISTINCT ON (name) *")
    .where("curicculum_id = ?", @school.curicculum_id)
    .where("vocationals.name NOT IN (SELECT v.name FROM school_vocationals sv JOIN vocationals v on sv.vocational_id=v.id WHERE school_id=#{@school.id})")
    .order(:name)
  end

  # GET /school_vocationals/new
  # GET /school_vocationals/new.json
  def new
    get_school
    get_vocational
    @school_vocational = @school.vocationals.new
  end

  # GET /school_vocationals/1/edit
  def edit
    get_school
    get_vocational 
    @school_vocational = @school.vocationals.find(params[:id])
  end

  # POST /school_vocationals
  # POST /school_vocationals.json
  def create
    get_school
    @school_vocational = @school.vocationals.create(params[:school_vocational])
  end

  # PUT /school_vocationals/1
  # PUT /school_vocationals/1.json
  def update
    get_school
    @school_vocational = @school.vocationals.find(params[:id])
    @school_vocational.update_attributes(params[:school_vocational])
  end

  # DELETE /school_vocationals/1
  # DELETE /school_vocationals/1.json
  def destroy
    get_school
    @school_vocational = @school.vocationals.find(params[:id])
    @school_vocational.destroy
  end
end
