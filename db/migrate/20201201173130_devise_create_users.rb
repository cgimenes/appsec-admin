# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :fullname, null: false
      t.string :role, null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
