# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Invoice
        class Searcher < Searcher
          def query_table
            "transaction WHERE type = 'CustInvc'"
          end
        end
      end
    end
  end
end
