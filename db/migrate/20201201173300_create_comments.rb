class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.references :vuln, foreign_key: true
      t.boolean :edited, null: false, default: false

      t.timestamps
    end
  end
end
