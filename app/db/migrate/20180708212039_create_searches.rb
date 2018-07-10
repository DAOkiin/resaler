class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :query
      t.integer :min_price, null: false, default: 0
      t.integer :max_price, null: false, default: 0

      t.timestamps
    end

    add_index :searches, :user_id
  end
end
