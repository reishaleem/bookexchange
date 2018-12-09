class User < ApplicationRecord

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 40 }
  VALID_OSU_EMAIL_REGEX = /\A[a-zA-Z]+\.[1-9]\d*@osu\.edu/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_OSU_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  VALID_PHONE_REGEX = /\A\d{10}\z/
  validates :phone, length: { maximum: 10 }, format: { with: VALID_PHONE_REGEX }, :allow_nil => true
  validates :age, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }, :allow_nil => true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
