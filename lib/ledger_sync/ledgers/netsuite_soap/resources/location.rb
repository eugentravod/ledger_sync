# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class Location < NetSuiteSOAP::Resource
        attribute :name, type: Type::String
      end
    end
  end
end
