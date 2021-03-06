class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :street_address
      t.string :city
      t.string :zip_code
      t.string :state
      t.references :organization

      t.timestamps null: false
    end
  end
end
