class HomeController < ApplicationController
    before_action :userkind
  def index
    @bookings = Booking.order(id: :desc)
  end

  private
  def name
   @name = current_user.name
  end

  def userkind
    if current_user
    @user_type = current_user.type
    end
  end
end
