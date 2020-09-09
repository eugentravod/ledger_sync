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
          references_one :item, resource_attribute: :item,
                                serializer: LedgerSync::Ledgers::NetSuite::Item::Serializer
          references_one :taxCode, resource_attribute: :tax_code,
                                   serializer: LedgerSync::Ledgers::NetSuite::TaxCode::Serializer
        end
      end
    end
  end
end
