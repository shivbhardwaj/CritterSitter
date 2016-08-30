class Pet < ActiveRecord::Base
  belongs_to :animal
  belongs_to :owner
  has_many :watches
  validates :name, :age, :animal_id, :presence => true

end
