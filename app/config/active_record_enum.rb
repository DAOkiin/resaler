require 'active_record/connection_adapters/postgresql_adapter'

module ActiveRecord
  module ConnectionAdapters
    if const_defined?(:PostgreSQLAdapter)
      PostgreSQLAdapter::NATIVE_DATABASE_TYPES.merge!(
        source_type: { name: 'character varying' }
      )
    end
  end
end
