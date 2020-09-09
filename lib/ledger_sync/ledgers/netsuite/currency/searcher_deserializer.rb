# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Currency
        class SearcherDeserializer < NetSuite::Deserializer
          id

          attribute :name
          attribute :symbol
          attribute :exchange_rate, hash_attribute: :exchangerate
        end
      end
    end
  end
end
