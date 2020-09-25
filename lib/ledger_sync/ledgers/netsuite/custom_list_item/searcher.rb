# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CustomListItem
        class Searcher < Searcher
          attr_accessor :custom_list_id

          def query_table
            if @custom_list_id.blank?
              raise ArgumentError, 'CustomListItem Searcher incorrectly initialized. Set custom_list_id value with the ID of custom list you want to search '
            end
            "#{@custom_list_id}"
          end

          private

          def paginate(**keywords)
            seacher = self.class.new(
              client: client,
              query: query,
              criteria: criteria,
              pagination: keywords
            )
            seacher.custom_list_id = @custom_list_id
            seacher
          end
        end
      end
    end
  end
end
