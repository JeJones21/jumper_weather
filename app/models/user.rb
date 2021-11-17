class User < ApplicationRecord
  before_create :set_access_token

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  private

  def set_access_token
    self.access_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)

      break token unless User.where(access_token: token).exists?
    end
  end
end
