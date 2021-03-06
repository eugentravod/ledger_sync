# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Account
        class Deserializer < NetSuite::Deserializer
          id

          attribute :name,
                    hash_attribute: :acctname

          mapping :account_type,
                  hash_attribute: :accttype,
                  hash: Account::TYPES.invert

          attribute :number,
                    hash_attribute: :acctnumber
          attribute :ref_name,
                  hash_attribute: :refName
        end
      end
    end
  end
end
