# frozen_string_literal: true

require_relative '../reference/serializer'
require_relative '../customer/serializer'
require_relative '../currency/serializer'
require_relative '../account/serializer'
require_relative '../invoice_line_item/serializer'
require_relative '../location/serializer'
require_relative '../accounting_period/serializer'
require_relative '../invoice_status/serializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class Invoice
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :externalid, resource_attribute: :external_id
          attribute :createdDate, resource_attribute: :created_date
          attribute :amountpaid, resource_attribute: :amount_paid
          attribute :amountremaining, resource_attribute: :amount_remaining
          attribute :memo
          attribute :deposit
          attribute :saleseffectivedate, resource_attribute: :sales_effective_date
          attribute :shipAddress, resource_attribute: :ship_address
          attribute :shipDate, resource_attribute: :ship_date
          attribute :dueDate, resource_attribute: :due_date
          attribute :startDate, resource_attribute: :start_date
          attribute :endDate, resource_attribute: :end_date
          attribute :exchangeRate, resource_attribute: :exchange_rate
          references_one :status, resource_attribute: :status, 
                                  serializer: LedgerSync::Ledgers::NetSuite::InvoiceStatus::Serializer

          attribute :total
          attribute :tranId, resource_attribute: :transaction_id 
          attribute :trandate, resource_attribute: :transaction_date

          references_one :location
          references_one :currency
          references_one :account
          references_one :entity, resource_attribute: :customer,
                                    serializer: LedgerSync::Ledgers::NetSuite::Customer::Serializer
          references_one :postingperiod, resource_attribute: :posting_period,
                                    serializer: LedgerSync::Ledgers::NetSuite::AccountingPeriod::Serializer

          references_many 'item.items', resource_attribute: 'line_items',
                                        serializer: LedgerSync::Ledgers::NetSuite::InvoiceLineItem::Serializer
        end
      end
    end
  end
end
