class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :item_id, null: false
      t.integer :value
      t.timestamps
    end
    add_index :prices, :item_id
  end
end
