class UsersController < ApplicationController
  # You must be signed in to even vist the edit page or perform an update request.
  before_action :signed_in_user, only: [:edit, :update]
  # You must be the correct user in order to edit or update anything.
  before_action :correct_user,   only: [:edit, :update]

  # User variable is the one associated with the current id.
  def show
    @user = User.find(params[:id])
  end

  # User variable is the newly created user.
  def new
  	@user = User.new
  end

  def create
    # User variable is equal to the attempted created user with submitted parameters.
    @user = User.new(user_params)
    # If user successfully saves, sign in the user, flash success, and redirect to
    # their personal user page.
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Gladio!"
      redirect_to @user
    else #Else just send them back.
      render 'new'
    end
  end

  def edit
  end

  # If user successfully updates, flash success, sign in the user, and redirect to
  # their personal user page.
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    # Returns the version of the params hash with only the permitted attributes and
    # raises an error if the :user attribute is missing.
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Stores the attempted location and takes the non signed in user to the sign in page.
    # "store_location" is found in the sessions_helper.
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # Ensures the user is looking at their personal information when editing or updating,
    # or else they get sent back home. The "current_user?" method is in the sessions_helper.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
