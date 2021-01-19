# frozen_string_literal: true

require_relative 'account'
require_relative 'currency'
require_relative 'vendor'
require_relative 'vendor_bill_line_item'
require_relative 'location'
require_relative 'accounting_period'
require_relative 'tax_period'

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorCredit < NetSuite::Resource
        attribute :created_date, type: Type::DateTime
        attribute :amount, type: Type::Float
        attribute :exchange_rate, type: Type::Float
        attribute :total, type: Type::Float
        attribute :transaction_id, type: Type::String
        attribute :transaction_date, type: Type::Date
        attribute :memo, type: Type::String
        # Not clear how to populate this field
        #attribute :billing_address_text, type: Type::String
        references_one :location, to: Location
        references_one :currency, to: Currency
        references_one :account, to: Account
        references_one :vendor, to: Vendor
        references_one :posting_period, to: AccountingPeriod
        # Not clear how to populate this field
        references_one :tax_period, to: TaxPeriod
        references_one :subsidiary, to: Subsidiary
        references_many :line_items, to: VendorBillLineItem
      end
    end
  end
end
