# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Item
        class Searcher < Searcher
          def query_table
            "item WHERE itemType='NonInvtPart'"
          end
        end
      end
    end
  end
end
