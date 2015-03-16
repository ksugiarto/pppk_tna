class TeacherSubjectDetailsController < ApplicationController
  before_filter :set_teacher_subject_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def get_basic_competency
    @teacher = Teacher.find(params[:teacher_id])
    @teacher_subject = @teacher.subjects.find(params[:teacher_subject_id])
  end

  def index
    @teacher_subject_details = TeacherSubjectDetail.all
    respond_with(@teacher_subject_details)
  end

  def show
    respond_with(@teacher_subject_detail)
  end

  def new
    @teacher_subject_detail = TeacherSubjectDetail.new
    respond_with(@teacher_subject_detail)
  end

  def edit
    get_basic_competency
    @teacher_subject_detail = @teacher_subject.details.find(params[:id])
  end

  def create
    @teacher_subject_detail = TeacherSubjectDetail.new(params[:teacher_subject_detail])
    @teacher_subject_detail.save
    respond_with(@teacher_subject_detail)
  end

  def update
    get_basic_competency
    @teacher_subject_detail = @teacher_subject.details.find(params[:id])
    @teacher_subject_detail.update_attributes(params[:teacher_subject_detail])

    check = 1
    @teacher.subjects.each do |subject|
      subject.details.each do |subject_detail|
        check = check * subject_detail.is_competent.to_i
      end
    end

    teacher_vocational = TeacherVocational.find(@teacher_subject.teacher_vocational_id)
    if check==1
      teacher_vocational.update_attributes(:is_competent => 1)
    else
      teacher_vocational.update_attributes(:is_competent => 0)
    end

    respond_to do |format|
      format.json { respond_with_bip(@teacher_subject_detail) }
    end
  end

  def destroy
    @teacher_subject_detail.destroy
    respond_with(@teacher_subject_detail)
  end

  private
    def set_teacher_subject_detail
      @teacher_subject_detail = TeacherSubjectDetail.find(params[:id])
    end
end
