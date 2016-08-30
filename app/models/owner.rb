class Owner < ActiveRecord::Base
  has_secure_password

  has_many :pets, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :jobs
end
