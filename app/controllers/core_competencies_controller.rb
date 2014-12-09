class CoreCompetenciesController < ApplicationController
  def get_vocational
    @curicculum = Curicculum.find(params[:curicculum_id])
    @vocational = @curicculum.vocationals.find(params[:vocational_id])
  end
  # GET /core_competencies
  # GET /core_competencies.json
  def index
    @core_competencies = CoreCompetency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @core_competencies }
    end
  end

  # GET /core_competencies/1
  # GET /core_competencies/1.json
  def show
    @core_competency = CoreCompetency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @core_competency }
    end
  end

  # GET /core_competencies/new
  # GET /core_competencies/new.json
  def new
    get_vocational
    @core_competency = @vocational.core_competencies.new
    @core_competency.seq_num = @vocational.core_competencies.order(:id).last.try(:seq_num).to_i+1
  end

  # GET /core_competencies/1/edit
  def edit
    get_vocational
    @core_competency = @vocational.core_competencies.find(params[:id])
  end

  # POST /core_competencies
  # POST /core_competencies.json
  def create
    get_vocational
    @core_competency = @vocational.core_competencies.create(params[:core_competency])
  end

  # PUT /core_competencies/1
  # PUT /core_competencies/1.json
  def update
    get_vocational
    @core_competency = @vocational.core_competencies.find(params[:id])
    @core_competency.update_attributes(params[:core_competency])
  end

  # DELETE /core_competencies/1
  # DELETE /core_competencies/1.json
  def destroy
    get_vocational
    @core_competency = @vocational.core_competencies.find(params[:id])
    @core_competency.destroy
  end
end
