class Owner < ActiveRecord::Base
  has_secure_password

  has_many :pets, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :jobs
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :city, :address, :presence => true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :password, confirmation: true
  validates :password_confirmation, presence:true

end
