class User < ApplicationRecord
  enum gender: { male: 'male', female: 'female', other: 'other' }, _suffix: true
  validates :gender, :country_code, :phone_number, presence: true
  validates :first_name, length: { maximum: 80 }, presence: true
  validates :email, presence: true, length: { maximum: 50 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :gender, presence: true
  validates :country_code, length: { maximum: 5 }
  validates :phone_number, numericality: { only_integer: true }, length: { maximum: 15 }, uniqueness: { scope: :country_code }
end
