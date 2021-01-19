# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CurrencyListItem
        class Deserializer < NetSuite::Deserializer
          attribute :balance
          attribute :display_symbol, hash_attribute: 'displaySymbol'
          attribute :deposit_balance, hash_attribute: 'depositBalance'
          attribute :overdue_balance, hash_attribute: 'overdueBalance'

          references_one :currency
        end
      end
    end
  end
end
