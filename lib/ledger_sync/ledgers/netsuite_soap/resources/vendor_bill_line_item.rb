# frozen_string_literal: true

require_relative 'account'
require_relative 'tax_code'
require_relative 'item'
require_relative 'location'

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class VendorBillLineItem < NetSuiteSOAP::Resource
        references_one :account, to: Account
        attribute :gross_amount, type: Type::Float
        attribute :quantity, type: Type::Float
        attribute :rate, type: Type::Float
        references_one :tax_code, to: TaxCode
        attribute :item_type, type: Type::String
        attribute :subtype, type: Type::String
        references_one :item, to: Item
        attribute :description, type: Type::String

        # Optionally fields specific for our sync needs
        references_one :location, to: Location
        references_one :source_language, to: Item
        references_one :target_language, to: Item
      end
    end
  end
end
