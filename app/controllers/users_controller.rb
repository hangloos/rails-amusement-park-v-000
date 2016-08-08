class UsersController < ApplicationController


  def index
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to new_user_path
      end
  end

  def show
   @user = current_user
   @ride_information = params[:ride_info] if params[:ride_info]
   @ride_information ||= false
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end


  def destroy
    
  end


  private


  def user_params
    params.require(:user).permit(:id, :name, :password, :password_confirmation, :height, :happiness, :nausea, :tickets, :admin)
  end
end
