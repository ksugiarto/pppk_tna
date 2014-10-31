class VocationalsController < ApplicationController
  def get_curicculum
    @curicculum = Curicculum.find(params[:curicculum_id])
  end

  # GET /vocationals/1
  def show
    @vocational = Vocational.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vocational }
    end
  end

  # GET /vocationals/new
  def new
    get_curicculum
    @vocational = @curicculum.vocationals.new
  end

  # GET /vocationals/1/edit
  def edit
    get_curicculum
    @vocational = @curicculum.vocationals.find(params[:id])
  end

  # POST /vocationals
  def create
    get_curicculum
    @vocational = @curicculum.vocationals.create(params[:vocational])
  end

  # PUT /vocationals/1
  def update
    get_curicculum
    @vocational = @curicculum.vocationals.find(params[:id])
    @vocational.update_attributes(params[:vocational])
  end

  # DELETE /vocationals/1
  def destroy
    get_curicculum
    @vocational = Vocational.find(params[:id])
    @vocational.destroy
  end
end
