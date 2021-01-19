# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorCredit
        class Searcher < Searcher
          def query_table
            "transaction WHERE type = 'VendCred'"
          end
        end
      end
    end
  end
end
