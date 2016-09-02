class Proposal < ActiveRecord::Base
  belongs_to :owner
  has_many :acceptances, dependent: :destroy
  has_many :pets , through: :watch
  has_many :watches, as: :watchable

  validates :start_date, :end_date, :zip, presence: true
  validates :end_date, date: {after_or_equal_to: :start_date}, on: [:create, :update]
  validates :start_date, date: {after_or_equal_to: Time.now.to_date}, on: [:create, :update]
end
