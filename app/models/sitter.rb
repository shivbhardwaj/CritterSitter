class Sitter < ActiveRecord::Base
  has_secure_password

  has_many :jobs
  has_many :acceptances, dependent: :destroy
  has_many :prefences
  has_many :animals , through: :prefence

  validates :first_name, :last_name, :zip, :phone, :start_date, :end_date, :address, :city, presence: :true
  validates_length_of :first_name, :last_name, minimum: 3
  validates :password, :password_confirmation, presence: true, on: [:create]
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, :uniqueness => {case_sensitive: false}, :format => { :with => email_regex }
  validates :password_digest, confirmation: true
  validates :end_date, date: {after_or_equal_to: :start_date}, on: [:create]
  validates :start_date, date: {after_or_equal_to: Time.now}, on: [:create]
  # validates_date  :end_date, :on_or_after => :start_date,
  #                 :on_or_after_message => 'must be after start date'
  # validates_date :start_date, :on_or_after=> Date.today, on: [:create]
end
