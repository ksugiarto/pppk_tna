class TeacherVocationalsController < ApplicationController
  def get_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def get_vocational
    @vocationals = Vocational
    .where("curicculum_id = ?", @teacher.school.try(:curicculum_id))
    .where("id NOT IN (SELECT vocational_id FROM teacher_vocationals tv WHERE teacher_id=#{@teacher.id})")
    .order(:name)
  end

  def show
    get_teacher
    @teacher_vocational = @teacher.vocationals.find(params[:id])
  end

  # GET /teacher_vocationals/new
  # GET /teacher_vocationals/new.json
  def new
    get_teacher
    get_vocational
    @teacher_vocational = @teacher.vocationals.new
  end

  # GET /teacher_vocationals/1/edit
  def edit
    get_teacher
    get_vocational
    @teacher_vocational = @teacher.vocationals.find(params[:id])
  end

  # POST /teacher_vocationals
  # POST /teacher_vocationals.json
  def create
    get_teacher
    @teacher_vocational = @teacher.vocationals.create(params[:teacher_vocational])

    vocational = Vocational.find(@teacher_vocational.vocational_id)
    vocational.core_competencies.each do |core_competency|
      core_competency.basic_competencies.each do |basic_competency|
        teacher_subject = @teacher_vocational.subjects.create(:teacher_id => @teacher.id, :basic_competency_id => basic_competency.id, :is_competent => 0)
        basic_competency.subjects.each do |subject|
          teacher_subject.details.create(:subject_id => subject.id, :is_competent => 0)
        end
      end
    end
  end

  # PUT /teacher_vocationals/1
  # PUT /teacher_vocationals/1.json
  def update
    get_teacher
    @teacher_vocational = @teacher.vocationals.find(params[:id])
    @teacher_vocational.update_attributes(params[:teacher_vocational])
  end

  # DELETE /teacher_vocationals/1
  # DELETE /teacher_vocationals/1.json
  def destroy
    get_teacher
    @teacher_vocational = @teacher.vocationals.find(params[:id])
    @teacher_vocational.destroy
  end
end
