class BasicCompetenciesController < ApplicationController
  def get_core_competency
    @curicculum = Curicculum.find(params[:curicculum_id])
    @vocational = @curicculum.vocationals.find(params[:vocational_id])
    @core_competency = @vocational.core_competencies.find(params[:core_competency_id])
  end

  # GET /basic_competencies/new
  # GET /basic_competencies/new.json
  def new
    get_core_competency
    @basic_competency = @core_competency.basic_competencies.new
    @basic_competency.seq_num = @core_competency.basic_competencies.order(:id).last.try(:seq_num).to_i+1
  end

  # GET /basic_competencies/1/edit
  def edit
    get_core_competency
    @basic_competency = @core_competency.basic_competencies.find(params[:id])
  end

  # POST /basic_competencies
  # POST /basic_competencies.json
  def create
    get_core_competency
    @basic_competency = @core_competency.basic_competencies.create(params[:basic_competency])
  end

  # PUT /basic_competencies/1
  # PUT /basic_competencies/1.json
  def update
    get_core_competency
    @basic_competency = @core_competency.basic_competencies.find(params[:id])
    @basic_competency.update_attributes(params[:basic_competency])
  end

  # DELETE /basic_competencies/1
  # DELETE /basic_competencies/1.json
  def destroy
    get_core_competency
    @basic_competency = @core_competency.basic_competencies.find(params[:id])
    @basic_competency.destroy
  end
end
