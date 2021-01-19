# frozen_string_literal: true

require_relative '../reference/serializer'
require_relative '../vendor/serializer'
require_relative '../currency/serializer'
require_relative '../account/serializer'
require_relative '../vendor_bill_line_item/serializer'
require_relative '../location/serializer'
require_relative '../accounting_period/serializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorBill
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :externalid, resource_attribute: :external_id
          attribute :createdDate, resource_attribute: :created_date
          attribute :memo
          attribute :exchangeRate, resource_attribute: :exchange_rate
          attribute :status
          attribute :billingaddress_text, resource_attribute: 'billing_address_text'
          attribute :total
          attribute :tranId, resource_attribute: :transaction_id 
          attribute :trandate, resource_attribute: :transaction_date
          attribute :duedate, resource_attribute: :due_date
          attribute :duedays, resource_attribute: :due_days
          references_one :currency
          references_one :account
          references_one :entity, resource_attribute: :vendor,
                                  serializer: LedgerSync::Ledgers::NetSuite::Vendor::Serializer
          references_one :postingperiod, resource_attribute: :posting_period,
                                         serializer: LedgerSync::Ledgers::NetSuite::AccountingPeriod::Serializer
          references_many 'item.items', resource_attribute: 'line_items',
                                        serializer: LedgerSync::Ledgers::NetSuite::VendorBillLineItem::Serializer

        end
      end
    end
  end
end
