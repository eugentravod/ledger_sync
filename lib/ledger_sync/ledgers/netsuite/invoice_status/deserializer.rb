# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class InvoiceStatus
        class Deserializer < NetSuite::Deserializer
          id
          attribute :ref_name, hash_attribute: :refName
        end
      end
    end
  end
end
