# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CustomListItem
        class Deserializer < NetSuite::Deserializer
          id

          attribute :name
          attribute :is_inactive,
                    hash_attribute: :isInactive
        end
      end
    end
  end
end
