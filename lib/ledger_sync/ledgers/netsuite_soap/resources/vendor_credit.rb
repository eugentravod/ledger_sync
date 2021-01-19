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
    module NetSuiteSOAP
      class VendorCredit < NetSuiteSOAP::Resource
        attribute :created_date, type: Type::DateTime
        attribute :amount, type: Type::Float
        attribute :exchange_rate, type: Type::Float
        attribute :total, type: Type::Float
        attribute :transaction_id, type: Type::String
        attribute :transaction_date, type: Type::Date
        attribute :memo, type: Type::String

        references_one :currency, to: Currency
        references_one :account, to: Account
        references_one :vendor, to: Vendor
        references_one :posting_period, to: AccountingPeriod
        references_one :tax_period, to: TaxPeriod
        references_one :subsidiary, to: Subsidiary
        references_many :line_items, to: VendorBillLineItem
        references_one :approval_status, to: VendorBillApprovalStatus
      end
    end
  end
end
