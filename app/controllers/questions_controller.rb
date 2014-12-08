class QuestionsController < ApplicationController
  def get_event_exam
    @event = Event.find(params[:event_id])
    @event_exam = @event.exams.find(params[:event_exam_id])
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    get_event_exam
    @question = @event_exam.questions.new
  end

  # GET /questions/1/edit
  def edit
    get_event_exam
    @question = @event_exam.questions.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    get_event_exam
    @question = @event_exam.questions.create(params[:question])
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    get_event_exam
    @question = @event_exam.questions.find(params[:id])
    @question.update_attributes(params[:question])
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    get_event_exam
    @question = @event_exam.questions.find(params[:id])
    @question.destroy
  end
end
