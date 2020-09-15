# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Item < NetSuite::Resource
        attribute :item_type, type: Type::String
        attribute :subtype, type: Type::String
        attribute :item_id, type: Type::String
      end
    end
  end
end
