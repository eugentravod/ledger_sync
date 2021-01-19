# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorBill
        class Searcher < Searcher
          def query_table
            "transaction WHERE type = 'VendBill'"
          end
        end
      end
    end
  end
end
