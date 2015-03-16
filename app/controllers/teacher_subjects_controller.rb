class TeacherSubjectsController < ApplicationController
  def get_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def index
    @teacher_subjects = TeacherSubject.all
    respond_with(@teacher_subjects)
  end

  def show
    respond_with(@teacher_subject)
  end

  def new
    @teacher_subject = TeacherSubject.new
    respond_with(@teacher_subject)
  end

  def edit
    get_teacher
    @teacher_subject = @teacher.subjects.find(params[:id])
  end

  def create
    @teacher_subject = TeacherSubject.new(params[:teacher_subject])
    @teacher_subject.save
    respond_with(@teacher_subject)
  end

  def update
    get_teacher
    @teacher_subject = @teacher.subjects.find(params[:id])
    @teacher_subject.update_attributes(params[:teacher_subject])

    respond_to do |format|
      format.json { respond_with_bip(@teacher_subject) }
    end
  end

  def destroy
    @teacher_subject.destroy
    respond_with(@teacher_subject)
  end

  private
    def set_teacher_subject
      @teacher_subject = TeacherSubject.find(params[:id])
    end
end
