class UsersController < ApplicationController

  def static
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account successfully created!"
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
