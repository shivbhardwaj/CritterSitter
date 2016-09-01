class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.references :owner, index: true
      t.string :name
      t.integer :age
      t.references :animal, index: true
      t.string :image

      t.timestamps
    end
  end
end
