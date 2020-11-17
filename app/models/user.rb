class User < ActiveRecord::Base

  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def self.authenticate_with_credentials(email, password)
    if password.length >= 6 && email
      email = email.strip.downcase
      user = User.find_by_email(email)
    end
  end
end
