class AddSourceToItems < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE source_type AS ENUM ('youla', 'avito');
    SQL
    add_column :items, :source, :source_type, index: true
  end

  def down
    remove_column :items, :source

    execute <<-SQL
      DROP TYPE source_type;
    SQL
  end
end
