class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 5}

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by("lower(email) = ?", email.squish.downcase).try(:authenticate, password)
    @user
  end
end
