# frozen_string_literal: true

require_relative '../currency/deserializer'
require_relative '../account/deserializer'
require_relative '../customer/deserializer'
require_relative '../invoice_line_item/deserializer'
require_relative '../accounting_period/deserializer'
require_relative '../invoice_status/deserializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class Invoice
        class Deserializer < NetSuite::Deserializer
          id
         
          attribute :external_id, hash_attribute: :externalid
          attribute :created_date, hash_attribute: 'createdDate'
          attribute :amount_paid, hash_attribute: 'amountpaid'
          attribute :amount_remaining, hash_attribute: 'amountremaining'
          attribute :memo
          attribute :deposit
          attribute :due_date, hash_attribute: 'dueDate'
          attribute :estimated_gross_profit_percent, hash_attribute: 'estGrossProfitPercent'
          attribute :sales_effective_date, hash_attribute: 'saleseffectivedate'
          attribute :ship_address, hash_attribute: 'shipAddress'
          attribute :ship_date, hash_attribute: 'shipDate'
          attribute :start_date, hash_attribute: 'startDate'
          attribute :end_date, hash_attribute: 'endDate'
          attribute :exchange_rate, hash_attribute: 'exchangeRate'
          
          references_one :status, hash_attribute: 'status', 
                                  deserializer: LedgerSync::Ledgers::NetSuite::InvoiceStatus::Deserializer

          attribute :total
          attribute :transaction_id, hash_attribute: 'tranId'
          attribute :transaction_date, hash_attribute: 'trandate'

          references_one :currency
          references_one :account
          references_one :customer, hash_attribute: 'entity',
                                    deserializer: LedgerSync::Ledgers::NetSuite::Customer::Deserializer
          references_one :posting_period, hash_attribute: 'postingperiod',
                                          deserializer: LedgerSync::Ledgers::NetSuite::AccountingPeriod::Deserializer

          references_many :line_items,
                          hash_attribute: 'item.items',
                          deserializer: LedgerSync::Ledgers::NetSuite::InvoiceLineItem::Deserializer
        end
      end
    end
  end
end
