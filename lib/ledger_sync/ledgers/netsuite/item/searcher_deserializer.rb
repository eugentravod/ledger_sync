# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Item
        class SearcherDeserializer < NetSuite::Deserializer
          id

          attribute :subtype
          attribute :item_type, hash_attribute: :itemType
          attribute :item_id, hash_attribute: :itemid
        end
      end
    end
  end
end
