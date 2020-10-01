# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CreditMemo
        class Searcher < Searcher
          def query_table
            "transaction WHERE type = 'CustCred'"
          end
        end
      end
    end
  end
end
