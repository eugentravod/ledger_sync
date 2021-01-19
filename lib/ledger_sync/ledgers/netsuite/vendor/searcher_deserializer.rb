# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Vendor
        class SearcherDeserializer < NetSuite::Deserializer
          id

          attribute :external_id, hash_attribute: :externalId
        end
      end
    end
  end
end
