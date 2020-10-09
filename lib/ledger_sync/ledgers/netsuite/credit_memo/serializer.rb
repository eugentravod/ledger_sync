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
      class CreditMemo
        class Serializer < NetSuite::Serializer
          ledger_id

          # attribute :external_id
          attribute :createdDate, resource_attribute: :created_date
          attribute :amountpaid, resource_attribute: :amount_paid
          attribute :amountremaining, resource_attribute: :amount_remaining
          attribute :saleseffectivedate, resource_attribute: :sales_effective_date
          attribute :shipAddress, resource_attribute: :ship_address
          attribute :shipDate, resource_attribute: :ship_date
          attribute :status
          attribute :total
          attribute :applied
          attribute :balance
          attribute :exchangeRate, resource_attribute: :exchange_rate
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

# attribute :created_date, type: Type::DateTime
# #amountremaining
# attribute :amount_remaining, type: Type::Float
# attribute :amount_paid, type: Type::Float
# attribute :applied, type: Type::Float
# attribute :balance, type: Type::Float
# attribute :exchange_rate, type: Type::Float
# attribute :estimated_gross_profit, type: Type::Float
# attribute :estimated_gross_profit_percent, type: Type::Float
# #saleseffectivedate
# attribute :sales_effective_date, type: Type::Date
# # shipAddress
# attribute :ship_address, type: Type::String
# attribute :status, type: Type::String
# attribute :total, type: Type::Float
# # "tranId": "CM01",
# attribute :transaction_id, type: Type::String
# # "trandate": "2020-09-30",
# attribute :transaction_date, type: Type::Date

# references_one :location, to: Location
# references_one :currency, to: Currency
# references_one :account, to: Account
# references_one :customer, to: Customer

# references_many :line_items, to: InvoiceLineItem