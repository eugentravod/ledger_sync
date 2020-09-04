# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class InvoiceLineItem
        class Deserializer < NetSuite::Deserializer
          id
         
          attribute :amount
          attribute :description
          attribute :quantity
          attribute :rate
          references_one :tax_code, hash_attribute: 'taxCode'
        end
      end
    end
  end
end
