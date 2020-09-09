# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Account
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :name,
                    ledger_attribute: :acctname

          mapping :accttype,
                  resource_attribute: :account_type,
                  hash: Account::TYPES

          attribute :number,
                    ledger_attribute: :acctnumber
        end
      end
    end
  end
end
