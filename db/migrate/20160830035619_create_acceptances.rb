class CreateAcceptances < ActiveRecord::Migration
  def change
    create_table :acceptances do |t|
      t.references :sitter, index: true
      t.references :proposal, index: true

      t.timestamps
    end
  end
end
