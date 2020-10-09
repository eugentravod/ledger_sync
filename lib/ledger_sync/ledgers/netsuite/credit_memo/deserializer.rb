# frozen_string_literal: true

require_relative '../currency/deserializer'
require_relative '../account/deserializer'
require_relative '../customer/deserializer'
require_relative '../invoice_line_item/deserializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class CreditMemo
        class Deserializer < NetSuite::Deserializer
          id
         
          attribute :external_id, hash_attribute: :externalid
          attribute :created_date, hash_attribute: 'createdDate'
          attribute :amount_paid, hash_attribute: 'amountpaid'
          attribute :amount_remaining, hash_attribute: 'amountremaining'
          attribute :estimated_gross_profit, hash_attribute: 'estGrossProfit'
          attribute :estimated_gross_profit_percent, hash_attribute: 'estGrossProfitPercent'
          attribute :sales_effective_date, hash_attribute: 'saleseffectivedate'
          attribute :ship_address, hash_attribute: 'shipAddress'
          attribute :status
          attribute :total
          attribute :applied
          attribute :balance
          attribute :exchange_rate, hash_attribute: 'exchangeRate'
          attribute :transaction_id, hash_attribute: 'tranId'
          attribute :transaction_date, hash_attribute: 'trandate'

          references_one :currency
          references_one :account
          references_one :customer, hash_attribute: 'entity',
                                    deserializer: LedgerSync::Ledgers::NetSuite::Customer::Deserializer

          references_many :line_items,
                          hash_attribute: 'item.items',
                          deserializer: LedgerSync::Ledgers::NetSuite::InvoiceLineItem::Deserializer
        end
      end
    end
  end
end