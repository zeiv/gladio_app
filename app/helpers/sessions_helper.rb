module SessionsHelper

  def sign_in(user)
  	# Creates a new token.
    remember_token = User.new_remember_token
    # Places the unencrypted token in the browser cookies.
    cookies.permanent[:remember_token] = remember_token
    # Saves the encrypted token to the database.
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    # Sets the current user equal to the given user.
    self.current_user = user
  end

  # Checks if the user is signed in by checking to see if "current_user" exists.
  def signed_in?
    !current_user.nil?
  end

  # Allows "self.current_user" above to work by defining the method.
  def current_user=(user)
    @current_user = user
  end

  # Finds the current user using the remember_token.
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # Empties the current_user variable and deletes the cookie.
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
