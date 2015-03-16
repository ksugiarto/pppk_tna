class TeacherAnswerDetailsController < ApplicationController
  before_filter :set_teacher_answer_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @teacher_answer_details = TeacherAnswerDetail.all
    respond_with(@teacher_answer_details)
  end

  def show
    respond_with(@teacher_answer_detail)
  end

  def new
    @teacher_answer_detail = TeacherAnswerDetail.new
    respond_with(@teacher_answer_detail)
  end

  def edit
  end

  def create
    @teacher_answer_detail = TeacherAnswerDetail.new(params[:teacher_answer_detail])
    @teacher_answer_detail.save
    respond_with(@teacher_answer_detail)
  end

  def update
    @teacher_answer_detail.update_attributes(params[:teacher_answer_detail])
    respond_with(@teacher_answer_detail)
  end

  def destroy
    @teacher_answer_detail.destroy
    respond_with(@teacher_answer_detail)
  end

  private
    def set_teacher_answer_detail
      @teacher_answer_detail = TeacherAnswerDetail.find(params[:id])
    end
end
