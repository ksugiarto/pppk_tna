class TeacherVocationalsController < ApplicationController
  # GET /teacher_vocationals
  # GET /teacher_vocationals.json
  def index
    @teacher_vocationals = TeacherVocational.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teacher_vocationals }
    end
  end

  # GET /teacher_vocationals/1
  # GET /teacher_vocationals/1.json
  def show
    @teacher_vocational = TeacherVocational.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher_vocational }
    end
  end

  # GET /teacher_vocationals/new
  # GET /teacher_vocationals/new.json
  def new
    @teacher_vocational = TeacherVocational.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher_vocational }
    end
  end

  # GET /teacher_vocationals/1/edit
  def edit
    @teacher_vocational = TeacherVocational.find(params[:id])
  end

  # POST /teacher_vocationals
  # POST /teacher_vocationals.json
  def create
    @teacher_vocational = TeacherVocational.new(params[:teacher_vocational])

    respond_to do |format|
      if @teacher_vocational.save
        format.html { redirect_to @teacher_vocational, notice: 'Teacher vocational was successfully created.' }
        format.json { render json: @teacher_vocational, status: :created, location: @teacher_vocational }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher_vocational.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teacher_vocationals/1
  # PUT /teacher_vocationals/1.json
  def update
    @teacher_vocational = TeacherVocational.find(params[:id])

    respond_to do |format|
      if @teacher_vocational.update_attributes(params[:teacher_vocational])
        format.html { redirect_to @teacher_vocational, notice: 'Teacher vocational was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher_vocational.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_vocationals/1
  # DELETE /teacher_vocationals/1.json
  def destroy
    @teacher_vocational = TeacherVocational.find(params[:id])
    @teacher_vocational.destroy

    respond_to do |format|
      format.html { redirect_to teacher_vocationals_url }
      format.json { head :no_content }
    end
  end
end
