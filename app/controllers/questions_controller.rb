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
    @subject_picked_id = 0
  end

  # GET /questions/1/edit
  def edit
    get_event_exam
    @question = @event_exam.questions.find(params[:id])
    @subject_picked_id = @question.subject_id
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

  def pick_subject
    get_event_exam
    @subject = Subject.find(params[:subject_id])
    @subject_picked_id = @subject.id
  end

  def peek_indicator
    get_event_exam
    @subject = Subject.find(params[:subject_id])
  end

  def export_ans_sheet
    get_event_exam
    @event_participants = @event.participants.joins(:teacher).order("teachers.first_name")

    respond_to do |format|
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"Answer Sheet #{@event.title} #{Time.now.strftime("%Y-%m-%d %H.%M.%S")}.xls" }
    end
  end

  def import_ans_sheet
    get_event_exam
  end

  def import_submit_ans_sheet
    get_event_exam
    Question.import(params[:file], @event.id, @event_exam.id)
    redirect_to :back
  end
end
