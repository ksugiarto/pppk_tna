class TeacherAnswersController < ApplicationController
  before_filter :set_teacher_answer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @teacher_answers = TeacherAnswer.all
    respond_with(@teacher_answers)
  end

  def show
    respond_with(@teacher_answer)
  end

  def new
    @teacher_answer = TeacherAnswer.new
    respond_with(@teacher_answer)
  end

  def edit
  end

  def create
    @teacher_answer = TeacherAnswer.new(params[:teacher_answer])
    @teacher_answer.save
    respond_with(@teacher_answer)
  end

  def update
    @teacher_answer.update_attributes(params[:teacher_answer])
    respond_with(@teacher_answer)
  end

  def destroy
    @teacher_answer.destroy
    respond_with(@teacher_answer)
  end

  private
    def set_teacher_answer
      @teacher_answer = TeacherAnswer.find(params[:id])
    end
end
