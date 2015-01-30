class TeachersController < ApplicationController
  def get_data
    @countries = Country.order(:name)
    @provinces = Province.order(:name)
    @cities = City.order(:name)
    @schools = School.order(:name)
  end

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.order(:first_name).pagination(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
      format.js
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])
    @teacher_needs = @teacher.vocationals
    .where("teacher_vocationals.vocational_id NOT IN (SELECT vocational_id FROM events e JOIN event_participants ep ON e.id=ep.event_id WHERE ep.teacher_id=#{@teacher.id} AND ep.status=7)")

    @modal = params[:modal].to_i

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher }
      format.js # show.js.erb
    end
  end

  # GET /teachers/new
  # GET /teachers/new.json
  def new
    @teacher = Teacher.new
    get_data
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
    get_data
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teachers/1
  # PUT /teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :no_content }
    end
  end
end
