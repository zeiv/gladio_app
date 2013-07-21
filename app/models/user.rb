class User < ActiveRecord::Base
  # Makes sure email information enters the database uniformly before saving.
  before_save { self.email = email.downcase }
  # Creates a remember token before saving the user.
  before_create :create_remember_token
  # Adds the password and password_confirmation attributes, requires the presence of the password,
  # requires that they match, adds an authenticate method to compare an encrypted password to the
  # password_digest to authenticate users.
  has_secure_password
  # All users must have a name and it must be less than 50 characters in length.
  validates :name, presence: true, length: { maximum: 50 }
  # Checks whether the submitted email's syntax is a legitimate email syntax.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # All users must have a unique and correct email address.
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  # Password must be at least 6 characters long.
  validates :password, length: { minimum: 6 }

  # Returns a random string of length 16.
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # SHA1 encryption, this is run on every page so it is faster than BCrypt.
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  	# Privately encrypts a newly generated remember token using the encrypt method above.
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
