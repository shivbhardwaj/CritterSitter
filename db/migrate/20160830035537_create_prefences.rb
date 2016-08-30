class CreatePrefences < ActiveRecord::Migration
  def change
    create_table :prefences do |t|
      t.references :animal, index: true
      t.references :sitter, index: true

      t.timestamps
    end
  end
end
