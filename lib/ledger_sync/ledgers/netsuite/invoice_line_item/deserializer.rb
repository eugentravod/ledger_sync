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
          attribute :item_type, hash_attribute: :itemType
          attribute :subtype
          attribute :cost_estimate, hash_attribute: :costEstimate

          references_one :item, hash_attribute: 'item', deserializer: LedgerSync::Ledgers::NetSuite::Item::Deserializer
          references_one :tax_code, hash_attribute: 'taxCode', deserializer: LedgerSync::Ledgers::NetSuite::TaxCode::Deserializer

          references_one :source_language, hash_attribute: 'custcolcustline_from_lang_field', deserializer: LedgerSync::Ledgers::NetSuite::Item::Deserializer
          references_one :target_language, hash_attribute: 'custcolcustline_to_lang_field', deserializer: LedgerSync::Ledgers::NetSuite::Item::Deserializer

        end
      end
    end
  end
end
