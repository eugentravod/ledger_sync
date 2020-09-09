# frozen_string_literal: true

require_relative 'account'
require_relative 'currency'
require_relative 'customer'
require_relative 'invoice_line_item'
require_relative 'location'

module LedgerSync
  module Ledgers
    module NetSuite
      class Invoice < NetSuite::Resource
        attribute :memo, type: Type::String
        attribute :created_date, type: Type::Date
        attribute :amount_remaining, type: Type::Float
        attribute :amount_paid, type: Type::Float
        attribute :deposit, type: Type::Float
        attribute :due_date, type: Type::Date
        attribute :estimated_gross_profit_percent, type: Type::Float
        attribute :sales_effective_date, type: Type::Date
        attribute :ship_address, type: Type::String
        attribute :ship_date, type: Type::Date
        attribute :start_date, type: Type::Date
        attribute :status, type: Type::String
        attribute :total, type: Type::Float
        attribute :transaction_id, type: Type::String
        attribute :transaction_date, type: Type::Date

        references_one :location, to: Location
        references_one :currency, to: Currency
        references_one :account, to: Account
        references_one :customer, to: Customer

        references_many :line_items, to: InvoiceLineItem

        def name
          "Invoice: #{transaction_date}"
        end
      end
    end
  end
end
