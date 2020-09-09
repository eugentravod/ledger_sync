# frozen_string_literal: true
# frozen_string_literal: true
require_relative '../tax_code/deserializer'
require_relative '../item/deserializer'

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
          references_one :item, hash_attribute: 'item', deserializer: LedgerSync::Ledgers::NetSuite::Item::Deserializer 
          references_one :tax_code, hash_attribute: 'taxCode', deserializer: LedgerSync::Ledgers::NetSuite::TaxCode::Deserializer
        end
      end
    end
  end
end
