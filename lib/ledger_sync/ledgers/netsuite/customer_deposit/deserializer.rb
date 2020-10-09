# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CustomerDeposit
        class Deserializer < NetSuite::Deserializer
          id

          attribute :external_id, hash_attribute: :externalid
          references_one :account

          references_one :customer

          attribute :payment
          attribute :undepFunds
        end
      end
    end
  end
end
