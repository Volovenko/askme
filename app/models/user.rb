require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new
  VALID_USERNAME_REGEX = /\A\w+\z/
  VALID_CUSTOM_HEADER = /\A#\h{6}\z/

  attr_accessor :password

  has_many :questions, dependent: :destroy
  before_save :encrypt_password
  before_validation :normalize_name 
  validates :email, :username, presence: true, uniqueness: true
  validates :username, length: { maximum: 40 }, format: { with: VALID_USERNAME_REGEX }
  validates :password, presence: true, on: :create, confirmation: true
  validates :custom_header, format: { with: VALID_CUSTOM_HEADER }, allow_blank: true

  def encrypt_password
    if self.password.present?

      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    return nil unless user.present?
    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )
    return user if user.password_hash == hashed_password
    nil
  end

  private

  def normalize_name
    self.username = username.downcase
  end
end
