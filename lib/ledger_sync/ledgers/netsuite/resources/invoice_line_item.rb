# frozen_string_literal: true

require_relative 'account'
require_relative 'tax_code'

module LedgerSync
  module Ledgers
    module NetSuite
      class InvoiceLineItem < NetSuite::Resource
        references_one :account, to: Account
        # references_one :ledger_class, to: LedgerClass
        attribute :amount, type: Type::Float
        attribute :quantity, type: Type::Float
        attribute :rate, type: Type::Float
        references_one :tax_code, to: TaxCode
        attribute :description, type: Type::String

        def name
          # description
        end
      end
    end
  end
end
