class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.string :url
      t.integer :category_id, null: false

      t.timestamps(null: false)
    end
  end
end
