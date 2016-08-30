class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :kind

      t.timestamps
    end
  end
end
