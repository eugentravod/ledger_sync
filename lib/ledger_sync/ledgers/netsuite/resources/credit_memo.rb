# frozen_string_literal: true

require_relative 'account'
require_relative 'currency'
require_relative 'customer'
require_relative 'invoice_line_item'
require_relative 'location'

module LedgerSync
  module Ledgers
    module NetSuite
      class CreditMemo < NetSuite::Resource
        attribute :created_date, type: Type::DateTime
        #amountremaining
        attribute :amount_remaining, type: Type::Float
        attribute :amount_paid, type: Type::Float
        attribute :applied, type: Type::Float
        attribute :balance, type: Type::Float
        attribute :exchange_rate, type: Type::Float
        attribute :estimated_gross_profit, type: Type::Float
        attribute :estimated_gross_profit_percent, type: Type::Float
        #saleseffectivedate
        attribute :sales_effective_date, type: Type::Date
        # shipAddress
        attribute :ship_address, type: Type::String
        attribute :ship_date, type: Type::Date
        attribute :status, type: Type::String
        attribute :total, type: Type::Float
        # "tranId": "CM01",
        attribute :transaction_id, type: Type::String
        # "trandate": "2020-09-30",
        attribute :transaction_date, type: Type::Date

        references_one :location, to: Location
        references_one :currency, to: Currency
        references_one :account, to: Account
        references_one :customer, to: Customer

        references_many :line_items, to: InvoiceLineItem

        def name
          "CreditNote: #{transaction_date}"
        end
      end
    end
  end
end
