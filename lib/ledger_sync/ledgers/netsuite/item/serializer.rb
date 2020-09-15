# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Item
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :external_id
          attribute :subtype
          attribute :item_id
          attribute :itemType,
                    resource_attribute: :item_type
        end
      end
    end
  end
end
