class Acceptance < ActiveRecord::Base
  belongs_to :sitter
  belongs_to :proposal
  belongs_to :owner
end
