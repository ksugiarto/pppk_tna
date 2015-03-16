class SubjectsController < ApplicationController
  def get_basic_competency
    @curicculum = Curicculum.find(params[:curicculum_id])
    @vocational = @curicculum.vocationals.find(params[:vocational_id])
    @core_competency = @vocational.core_competencies.find(params[:core_competency_id])
    @basic_competency = @core_competency.basic_competencies.find(params[:basic_competency_id])
  end

  def new
    get_basic_competency
    @subject = @basic_competency.subjects.new
    @subject.seq_num = @basic_competency.subjects.order(:id).last.try(:seq_num).to_i+1
  end

  def edit
    get_basic_competency
    @subject = @basic_competency.subjects.find(params[:id])
  end

  def create
    get_basic_competency
    @subject = @basic_competency.subjects.create(params[:subject])
  end

  def update
    get_basic_competency
    @subject = @basic_competency.subjects.find(params[:id])
    @subject.update_attributes(params[:subject])
  end

  def destroy
    get_basic_competency
    @subject = @basic_competency.subjects.find(params[:id])
    @subject.destroy
  end
end
