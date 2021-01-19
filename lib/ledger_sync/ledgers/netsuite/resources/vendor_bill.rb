# frozen_string_literal: true

require_relative 'account'
require_relative 'currency'
require_relative 'vendor'
require_relative 'vendor_bill_line_item'
require_relative 'location'
require_relative 'accounting_period'

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorBill < NetSuite::Resource
        attribute :memo, type: Type::String
        attribute :created_date, type: Type::DateTime
        attribute :due_date, type: Type::Date
        attribute :due_days, type: Type::Integer

        attribute :exchange_rate, type: Type::Float
        attribute :status, type: Type::String
        attribute :total, type: Type::Float
        attribute :transaction_id, type: Type::String
        attribute :transaction_date, type: Type::Date
        attribute :billing_address_text, type: Type::String
        references_one :currency, to: Currency
        references_one :account, to: Account
        references_one :vendor, to: Vendor
        references_one :posting_period, to: AccountingPeriod

        references_many :line_items, to: VendorBillLineItem
        references_one :subsidiary, to: Subsidiary

      end
    end
  end
end
