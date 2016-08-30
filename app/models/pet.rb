class Pet < ActiveRecord::Base
  belongs_to :animal
  belongs_to :owner
  has_many :watches

end
