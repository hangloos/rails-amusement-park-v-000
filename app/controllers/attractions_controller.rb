class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to @attraction
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to @attraction
    end
  end


  def destroy
    @attraction = Attraction.find(params[:format])
    @attraction.delete
    redirect_to attractions_path
  end




  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
