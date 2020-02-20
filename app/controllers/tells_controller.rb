class TellsController < ApplicationController
  before_action :set_tell, only: [:show, :edit, :update, :destroy]

  # GET /tells
  # GET /tells.json
  def index
    @tells = Tell.all
  end

  # GET /tells/1
  # GET /tells/1.json
  def show
  end

  # GET /tells/new
  def new
    @tell = Tell.new
  end

  # GET /tells/1/edit
  def edit
  end

  # POST /tells
  # POST /tells.json
  def create
    @tell = Tell.new(tell_params)

    respond_to do |format|
      if @tell.save
        format.html { redirect_to controller: 'publisher', action: 'publish_tell', id: @tell.id }
      else
        format.html { render :new }
        format.json { render json: @tell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tells/1
  # PATCH/PUT /tells/1.json
  def update
    respond_to do |format|
      if @tell.update(tell_params)
        format.html { redirect_to @tell, notice: 'Tell was successfully updated.' }
        format.json { render :show, status: :ok, location: @tell }
      else
        format.html { render :edit }
        format.json { render json: @tell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tells/1
  # DELETE /tells/1.json
  def destroy
    @tell.destroy
    respond_to do |format|
      format.html { redirect_to tells_url, notice: 'Tell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tell
      @tell = Tell.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tell_params
      params.require(:tell).permit(:title, :tellerName, :keyword)
    end
end
