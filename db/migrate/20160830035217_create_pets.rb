class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :picture
      t.references :animal, index: true
      t.references :owner, index: true

      t.timestamps
    end
  end
end
