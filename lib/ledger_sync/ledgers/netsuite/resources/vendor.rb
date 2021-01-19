# frozen_string_literal: true

require_relative 'subsidiary'
require_relative 'currency_list_item'


module LedgerSync
  module Ledgers
    module NetSuite
      class Vendor < NetSuite::Resource
        attribute :email, type: Type::String
        attribute :ref_name, type: Type::String
        references_one :subsidiary, to: Subsidiary
        references_many :currency_list, to: CurrencyListItem

        attribute :company_name, type: Type::String
        attribute :first_name, type: Type::String
        attribute :last_name, type: Type::String
        attribute :is_person, type: Type::Boolean

        references_one :tax_code, to: TaxCode

        attribute :vatregnumber, type: Type::String
        attribute :country, type: Type::String
        attribute :address, type: Type::String
      end
    end
  end
end
