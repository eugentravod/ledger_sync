# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CustomListItem < NetSuite::Resource
        attribute :name, type: Type::String
        attribute :is_inactive, type: Type::Boolean
      end
    end
  end
end
