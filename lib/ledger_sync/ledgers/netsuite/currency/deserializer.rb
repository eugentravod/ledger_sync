# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Currency
        class Deserializer < NetSuite::Deserializer
          id

          attribute :name

          attribute :external_id,
                    hash_attribute: :externalid

          attribute :symbol

          attribute :exchange_rate,
                    hash_attribute: :exchangerate

          attribute :ref_name,
                    hash_attribute: :refName
        end
      end
    end
  end
end
