require 'active_record/connection_adapters/postgresql_adapter'

module ActiveRecord
  module ConnectionAdapters
    if const_defined?(:PostgreSQLAdapter)
      PostgreSQLAdapter::NATIVE_DATABASE_TYPES.merge!(
        source_type: { name: 'character varying' }
      )
    end
  end

  module Enum
    class EnumType < Type::Value
      def assert_valid_value(value)
        unless value.blank? || mapping.key?(value) || mapping.key?(value)
          nil
        end
      end
    end
  end
end
