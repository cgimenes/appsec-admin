class CreateVulns < ActiveRecord::Migration[5.2]
  def change
    create_table :vulns do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.string :risk, null: false
      t.date :reported_at, null: false
      t.string :status, null: false
      t.date :fixed_at
      t.references :reporter, foreign_key: { to_table: :users }
      t.references :team, foreign_key: true
      t.references :affected_asset, foreign_key: { to_table: :assets }

      t.timestamps
    end
  end
end
