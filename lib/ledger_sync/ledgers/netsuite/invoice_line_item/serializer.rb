# frozen_string_literal: true
require_relative '../tax_code/serializer'
require_relative '../item/serializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class InvoiceLineItem
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :amount
          attribute :description
          attribute :quantity
          attribute :rate
          attribute :subtype
          attribute :itemType, resource_attribute: :item_type
          attribute :costEstimate, resource_attribute: :cost_estimate

          references_one :item, resource_attribute: :item,
                                serializer: LedgerSync::Ledgers::NetSuite::Item::Serializer
        
          references_one :custcolcustline_from_lang_field, resource_attribute: :source_language,
                                                                 serializer: LedgerSync::Ledgers::NetSuite::Item::Serializer
          references_one :custcolcustline_to_lang_field, resource_attribute: :target_language,
                                                                  serializer: LedgerSync::Ledgers::NetSuite::Item::Serializer
        end
      end
    end
  end
end
