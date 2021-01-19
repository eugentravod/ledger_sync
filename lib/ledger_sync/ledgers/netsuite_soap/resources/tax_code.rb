# frozen_string_literal: true

require_relative 'currency'

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class TaxCode < NetSuiteSOAP::Resource
        attribute :ref_name, type: Type::String
      end
    end
  end
end
