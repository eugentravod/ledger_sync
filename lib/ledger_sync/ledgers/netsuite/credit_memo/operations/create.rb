# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class CreditMemo
        module Operations
          class Create < NetSuite::Operation::Create
            class Contract < LedgerSync::Ledgers::Contract
              params do
                # required(:external_id).maybe(:string)
                optional(:account).hash(Types::Reference)
                required(:currency).filled(:hash, Types::Reference)
                required(:customer).hash(Types::Reference)
                required(:ledger_id).value(:nil)
                # required(:line_items).array(Types::Reference)
                optional(:transaction_date).filled(:date?)
              end
            end
          end
        end
      end
    end
  end
end
