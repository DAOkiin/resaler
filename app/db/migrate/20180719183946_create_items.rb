class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :search_id, null: false
      t.string  :title
      t.string  :url
      t.string  :product_id

      t.timestamps
    end

    add_index :items, :product_id, unique: true
  end
end
