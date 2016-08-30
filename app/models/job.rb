class Job < ActiveRecord::Base
  belongs_to :owner
  belongs_to :sitter
  has_many :watches, as: :watchable
  has_many :pets , through: :watch
end
