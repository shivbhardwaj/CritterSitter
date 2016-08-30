class CreateWatches < ActiveRecord::Migration
  def change
    create_table :watches do |t|
      t.references :pet, index: true
      t.references :watchable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
