class SessionsController < ApplicationController

  def new
  end

  def create
  	# Search the database for a user with this email and password.
  	user = User.find_by(email: params[:session][:email].downcase)
  	# If the user exists and the information is correct, signin.
    if user && user.authenticate(params[:session][:password])
      # Located in the app's helpers folder.
      sign_in user
      # After a successful login, the user is taken to their page.
      redirect_to user
    else
      # Flashes the error message on only this page.
      flash.now[:error] = 'Invalid email/password combination'
      # Re-renders the signin page.
      render 'new'
    end
  end

  # Sign out and redirect to home page. The sign_out method is in the sessions_helper.
  def destroy
    sign_out
    redirect_to root_url
  end
end
