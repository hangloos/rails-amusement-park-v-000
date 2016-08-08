class RidesController < ApplicationController
  

  def create
    @ride = Ride.new(:attraction_id => params[:attraction_id], :user_id => params[:user_id])
    @ride_information = @ride.take_ride
    redirect_to user_path(@ride.user, :ride_info => @ride_information)
  end
end
