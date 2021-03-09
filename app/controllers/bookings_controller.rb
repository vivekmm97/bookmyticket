class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.order(id: :desc)
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @movie = Movie.find(params[:movie_id])

  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @movie = Movie.find(params[:movie_id])
    @booking = @movie.bookings.create(booking_params)
    @booking.user_id = current_user.id
    @coupon = @booking.coupon_code
    @seat_count = @booking.seat_count
    @match = Coupon.find_by(code: @coupon)
    @screen_fee = @booking.movie.screen.fee
    @fee = @seat_count * @screen_fee
    if @match
      @percentage = @match.percentage
      @fee = @fee - ((@fee * @percentage)/100)      
    end
    @booking.total_fee = @fee
      if @booking.save
        redirect_to root_path
      else
        # redirect_to root_path
      end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
      redirect_to root_path
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:coupon_code, :user_id, :movie_id, :total_fee, :seat_count)
    end
    
end
