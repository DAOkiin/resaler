class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :query
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end

    add_index :searches, :user_id
  end
end
