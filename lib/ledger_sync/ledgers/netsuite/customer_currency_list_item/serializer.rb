# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CustomerCurrencyListItem
        class Serializer < NetSuite::Serializer
          attribute :balance
          attribute :displaySymbol, resource_attribute: :display_symbol
          attribute :depositBalance, resource_attribute: :deposit_balance
          attribute :overdueBalance, resource_attribute: :overdue_balance
          references_one :currency
        end
      end
    end
  end
end
