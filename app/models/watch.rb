class Watch < ActiveRecord::Base
  belongs_to :pet
  belongs_to :watchable, polymorphic: true
end
