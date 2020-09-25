# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CustomListItem
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :name
          attribute :isInactive,
                    resource_attribute: :is_inactive
        end
      end
    end
  end
end
