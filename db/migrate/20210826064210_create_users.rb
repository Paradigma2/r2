class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :full_name, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
