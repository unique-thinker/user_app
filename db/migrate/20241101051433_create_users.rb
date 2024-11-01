class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 80, null: false
      t.string :last_name, limit: 80, default: ''
      t.string :email, limit: 50, null: false
      t.string :gender, limit: 10, null: false
      t.string :country_code, limit: 8, null: false
      t.bigint :phone_number, null: false

      t.timestamps
    end
    # Add indexes
    add_index :users, :email, unique: true
    add_index :users, [:country_code, :phone_number], unique: true
  end
end
