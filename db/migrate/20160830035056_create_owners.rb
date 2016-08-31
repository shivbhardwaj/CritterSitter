class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :zip
      t.string :phone
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
