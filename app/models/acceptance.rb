class Acceptance < ActiveRecord::Base
  belongs_to :sitter
  belongs_to :proposal
end
