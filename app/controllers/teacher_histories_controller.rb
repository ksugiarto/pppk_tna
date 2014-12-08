class TeacherHistoriesController < ApplicationController
  # GET /teacher_histories
  # GET /teacher_histories.json
  def index
    @teacher_histories = TeacherHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teacher_histories }
    end
  end

  # GET /teacher_histories/1
  # GET /teacher_histories/1.json
  def show
    @teacher_history = TeacherHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher_history }
    end
  end

  # GET /teacher_histories/new
  # GET /teacher_histories/new.json
  def new
    @teacher_history = TeacherHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher_history }
    end
  end

  # GET /teacher_histories/1/edit
  def edit
    @teacher_history = TeacherHistory.find(params[:id])
  end

  # POST /teacher_histories
  # POST /teacher_histories.json
  def create
    @teacher_history = TeacherHistory.new(params[:teacher_history])

    respond_to do |format|
      if @teacher_history.save
        format.html { redirect_to @teacher_history, notice: 'Teacher history was successfully created.' }
        format.json { render json: @teacher_history, status: :created, location: @teacher_history }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teacher_histories/1
  # PUT /teacher_histories/1.json
  def update
    @teacher_history = TeacherHistory.find(params[:id])

    respond_to do |format|
      if @teacher_history.update_attributes(params[:teacher_history])
        format.html { redirect_to @teacher_history, notice: 'Teacher history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_histories/1
  # DELETE /teacher_histories/1.json
  def destroy
    @teacher_history = TeacherHistory.find(params[:id])
    @teacher_history.destroy

    respond_to do |format|
      format.html { redirect_to teacher_histories_url }
      format.json { head :no_content }
    end
  end
end
