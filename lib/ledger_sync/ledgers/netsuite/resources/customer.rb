# frozen_string_literal: true

require_relative 'subsidiary'
require_relative 'customer_currency_list_item'

module LedgerSync
  module Ledgers
    module NetSuite
      class Customer < NetSuite::Resource
        attribute :email, type: LedgerSync::Type::String
        attribute :companyName, type: LedgerSync::Type::String
        attribute :firstName, type: LedgerSync::Type::String
        attribute :lastName, type: LedgerSync::Type::String
        attribute :phone, type: LedgerSync::Type::String

        attribute :ref_name, type: LedgerSync::Type::String
        references_one :subsidiary, to: Subsidiary
        references_many :currency_list, to: CustomerCurrencyListItem
      end
    end
  end
end
