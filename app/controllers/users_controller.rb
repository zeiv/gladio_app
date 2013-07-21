class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    # User variable is equal to the attempted created user with submitted parameters.
    @user = User.new(user_params)
    # If user successfully saves, sign in the user, flash success, and redirect to their personal user page. Else just send them back.
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Gladio!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
