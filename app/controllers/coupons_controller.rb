class CouponsController < ApplicationController
  before_action :set_coupon, only: %i[ show edit update destroy ]

  # GET /coupons or /coupons.json
  def index
    @coupons = Coupon.all
  end

  # GET /coupons/1 or /coupons/1.json
  def show
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
    @movie = Movie.find(params[:movie_id])
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons or /coupons.json
  def create
    @movie = Movie.find(params[:movie_id])
    @coupon = @movie.coupons.create(coupon_params)
      if @coupon.save
        redirect_to coupons_path
      else
        # redirect_to root_path
      end
    
  end

  # PATCH/PUT /coupons/1 or /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: "Coupon was successfully updated." }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1 or /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: "Coupon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coupon_params
      params.require(:coupon).permit(:code, :coupon_count, :percentage)
    end
end
