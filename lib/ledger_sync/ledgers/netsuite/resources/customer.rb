# frozen_string_literal: true

require_relative 'subsidiary'
require_relative 'currency_list_item'
require_relative 'tax_code'

module LedgerSync
  module Ledgers
    module NetSuite
      class Customer < NetSuite::Resource
        attribute :email, type: LedgerSync::Type::String
        attribute :companyName, type: LedgerSync::Type::String
        attribute :firstName, type: LedgerSync::Type::String
        attribute :lastName, type: LedgerSync::Type::String
        attribute :phone, type: LedgerSync::Type::String
        attribute :is_person, type: LedgerSync::Type::Boolean
        attribute :vatregnumber, type: LedgerSync::Type::String
        attribute :country, type: LedgerSync::Type::String
        attribute :address, type: LedgerSync::Type::String

        references_one :tax_code, to: TaxCode

        attribute :ref_name, type: LedgerSync::Type::String
        references_one :subsidiary, to: Subsidiary
        references_many :currency_list, to: CurrencyListItem
      end
    end
  end
end
