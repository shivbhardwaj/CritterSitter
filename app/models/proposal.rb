class Proposal < ActiveRecord::Base
  belongs_to :owner
  has_many :acceptances, dependent: :destroy
  has_many :pets , through: :watch
  has_many :watches, as: :watchable
end
