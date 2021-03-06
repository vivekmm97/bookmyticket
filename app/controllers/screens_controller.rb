class ScreensController < ApplicationController
  before_action :set_screen, only: %i[ show edit update destroy ]
  # GET /screens or /screens.json
  def index
    @screens = Screen.all
  end

  # GET /screens/1 or /screens/1.json
  def show
  end

  # GET /screens/new
  def new
    @theatre = Theatre.find(params[:theatre_id])
    @screen = Screen.new
  end

  # GET /screens/1/edit
  def edit
  end

  # POST /screens or /screens.json
  def create

   @theatre = Theatre.find(params[:theatre_id])
   @screen = @theatre.screens.create(screen_params)

      if @screen.save
        redirect_to screens_path
      else
        
      end
    
  end

  # PATCH/PUT /screens/1 or /screens/1.json
  def update
    respond_to do |format|
      if @screen.update(screen_params)
        format.html { redirect_to @screen, notice: "Screen was successfully updated." }
        format.json { render :show, status: :ok, location: @screen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screens/1 or /screens/1.json
  def destroy
    @screen.destroy
    respond_to do |format|
      format.html { redirect_to screens_url, notice: "Screen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screen
      @screen = Screen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def screen_params
      params.require(:screen).permit(:date, :fee, :seat_id, :timing_id)
    end
end
