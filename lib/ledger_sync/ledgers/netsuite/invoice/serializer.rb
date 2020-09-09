# frozen_string_literal: true

require_relative '../reference/serializer'
require_relative '../customer/serializer'
require_relative '../currency/serializer'
require_relative '../account/serializer'
require_relative '../invoice_line_item/serializer'
require_relative '../location/serializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class Invoice
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :external_id
          attribute :createdDate, resource_attribute: :created_date
          attribute :amountpaid, resource_attribute: :amount_paid
          attribute :amountremaining, resource_attribute: :amount_remaining
          attribute :memo
          attribute :deposit
          attribute :duedate, resource_attribute: :due_date 
          attribute :estGrossProfitPercent, resource_attribute: :estimated_gross_profit_percent
          attribute :saleseffectivedate, resource_attribute: :sales_effective_date
          attribute :shipAddress, resource_attribute: :ship_address
          attribute :shipDate, resource_attribute: :ship_date
          attribute :startDate, resource_attribute: :start_date
          attribute :status
          attribute :total
          attribute :tranId, resource_attribute: :transaction_id 
          attribute :trandate, resource_attribute: :transaction_date

          references_one :location
          references_one :currency
          references_one :account
          references_one :entity, resource_attribute: :customer,
                                    serializer: LedgerSync::Ledgers::NetSuite::Customer::Serializer

          references_many 'item.items', resource_attribute: 'line_items',
                                        serializer: LedgerSync::Ledgers::NetSuite::InvoiceLineItem::Serializer
        end
      end
    end
  end
end
