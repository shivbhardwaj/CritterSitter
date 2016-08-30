class Sitter < ActiveRecord::Base
  has_secure_password

  has_many :jobs
  has_many :acceptances, dependent: :destroy
  has_many :prefences
  has_many :animals , through: :prefence
end
