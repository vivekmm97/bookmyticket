require 'date'
class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :checkStatus
  # GET /movies or /movies.json
  def index
    @movies = Movie.order(screen_id: :desc)
    # @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @screen = Screen.find(params[:screen_id])
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @screen = Screen.find(params[:screen_id])
    @movie = @screen.movies.create(movie_params)

      if @movie.save
        redirect_to movies_path
      else
        
      end
    
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:name, :language, :duration, :image)
    end

    def checkStatus
      @today = Time.now.strftime("%d-%m-%Y").to_s
      @time = Time.now
      @now = @time.hour.to_s + ":" + @time.min.to_s
      # @today = "16-03-2021"
      # @now = "11:30"
    end
end
