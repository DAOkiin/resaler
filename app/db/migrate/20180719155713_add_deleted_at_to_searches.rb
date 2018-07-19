class AddDeletedAtToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :deleted_at, :datetime
  end
end
