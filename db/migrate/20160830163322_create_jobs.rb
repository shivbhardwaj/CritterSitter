class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :zip
      t.integer :owner_rating
      t.integer :sitter_rating
      t.references :owner, index: true
      t.references :sitter, index: true

      t.timestamps
    end
  end
end
