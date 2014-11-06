class SchoolVocationalsController < ApplicationController
  def get_school
    @school = School.find(params[:school_id])
  end

  def get_vocational
    @vocationals = Vocational.order(:name)
  end

  # GET /school_vocationals/new
  # GET /school_vocationals/new.json
  def new
    get_vocational
    get_school
    @school_vocational = @school.vocationals.new
  end

  # GET /school_vocationals/1/edit
  def edit
    get_vocational 
    get_school
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
