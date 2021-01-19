# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Item
        class Deserializer < NetSuite::Deserializer
          id
          attribute :ref_name, hash_attribute: :refName
          attribute :item_id, hash_attribute: :itemid
        end
      end
    end
  end
end
