# frozen_string_literal: true

require_relative '../currency/deserializer'
require_relative '../account/deserializer'
require_relative '../vendor/deserializer'
require_relative '../location/deserializer'
require_relative '../vendor_bill_line_item/deserializer'
require_relative '../accounting_period/deserializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorCredit
        class Deserializer < NetSuite::Deserializer
          id

          attribute :external_id, hash_attribute: :externalid
          attribute :created_date, hash_attribute: 'createdDate'
          attribute :memo
          attribute :exchange_rate, hash_attribute: 'exchangeRate'
          attribute :total
          # Not clear how to populate this field
          # attribute :billing_address_text, hash_attribute: 'billingaddress_text'
          attribute :transaction_id, hash_attribute: 'tranId'
          attribute :transaction_date, hash_attribute: 'trandate'
          # Not clear how to populate this field
          # references_one :tax_period, to: UNKNOWN TYPE
          references_one :subsidiary
          references_one :currency
          references_one :account
          references_one :location
          references_one :vendor, hash_attribute: 'entity',
                                  deserializer: LedgerSync::Ledgers::NetSuite::Vendor::Deserializer
          references_one :posting_period, hash_attribute: 'postingPeriod',
                                          deserializer: LedgerSync::Ledgers::NetSuite::AccountingPeriod::Deserializer

          references_many :line_items,
                          hash_attribute: 'expense.items',
                          deserializer: LedgerSync::Ledgers::NetSuite::VendorBillLineItem::Deserializer
        end
      end
    end
  end
end
