# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class Currency < NetSuiteSOAP::Resource
        # attribute :exchange_rate, type: Type::Float
        # Replaced type with String because the error with deserialization
        attribute :exchange_rate, type: Type::String
        attribute :name, type: Type::String
        attribute :symbol, type: Type::String
        attribute :ref_name, type: Type::String
      end
    end
  end
end
