class CuricculumsController < ApplicationController
  # GET /curicculums
  # GET /curicculums.json
  def index
    @curicculums = Curicculum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @curicculums }
    end
  end

  # GET /curicculums/1
  # GET /curicculums/1.json
  def show
    @curicculum = Curicculum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @curicculum }
    end
  end

  # GET /curicculums/new
  # GET /curicculums/new.json
  def new
    @curicculum = Curicculum.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @curicculum }
    # end
  end

  # GET /curicculums/1/edit
  def edit
    @curicculum = Curicculum.find(params[:id])
  end

  # POST /curicculums
  # POST /curicculums.json
  def create
    @curicculum = Curicculum.new(params[:curicculum])

    respond_to do |format|
      if @curicculum.save
        format.html { redirect_to @curicculum, notice: 'Curicculum was successfully created.' }
        format.json { render json: @curicculum, status: :created, location: @curicculum }
      else
        format.html { render action: "new" }
        format.json { render json: @curicculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /curicculums/1
  # PUT /curicculums/1.json
  def update
    @curicculum = Curicculum.find(params[:id])

    respond_to do |format|
      if @curicculum.update_attributes(params[:curicculum])
        format.html { redirect_to @curicculum, notice: 'Curicculum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @curicculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curicculums/1
  # DELETE /curicculums/1.json
  def destroy
    @curicculum = Curicculum.find(params[:id])
    @curicculum.destroy

    respond_to do |format|
      format.html { redirect_to curicculums_url }
      format.json { head :no_content }
    end
  end
end
