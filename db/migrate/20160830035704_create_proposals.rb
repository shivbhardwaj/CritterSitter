class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :zip
      t.references :owner, index: true

      t.timestamps
    end
  end
end
