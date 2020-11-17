class User < ActiveRecord::Base

  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
