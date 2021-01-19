# frozen_string_literal: true

require_relative 'currency'

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class CurrencyListItem < NetSuiteSOAP::Resource
        attribute :balance, type: LedgerSync::Type::Float
        attribute :deposit_balance, type: LedgerSync::Type::Float
        attribute :overdue_balance, type: LedgerSync::Type::Float
        attribute :display_symbol, type: LedgerSync::Type::String
        references_one :currency, to: Currency
      end
    end
  end
end
