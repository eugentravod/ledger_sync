# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Item
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :refName, resource_attribute: :ref_name
          attribute :itemid, resource_attribute: :item_id

        end
      end
    end
  end
end
