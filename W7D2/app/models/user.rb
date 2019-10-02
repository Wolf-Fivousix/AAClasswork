# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 1}, allow_nil: true

  after_initialize :ensure_session_token

  attr_reader :password

  def find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user
      return user if user.is_password?(password)
    end
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.update!(session_token: User.generate_session_token)
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
