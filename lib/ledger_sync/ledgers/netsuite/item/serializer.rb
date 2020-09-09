# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Item
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :name

          attribute :refName,
                    resource_attribute: :ref_name
        end
      end
    end
  end
end
