# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class InvoiceStatus < NetSuite::Resource
        attribute :id, type: Type::String
        attribute :ref_name, type: Type::String
      end
    end
  end
end
