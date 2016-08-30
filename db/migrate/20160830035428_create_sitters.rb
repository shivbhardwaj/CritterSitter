class CreateSitters < ActiveRecord::Migration
  def change
    create_table :sitters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :zip
      t.integer :phone
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
