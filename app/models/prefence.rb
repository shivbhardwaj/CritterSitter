class Prefence < ActiveRecord::Base
  belongs_to :animal
  belongs_to :sitter
end
