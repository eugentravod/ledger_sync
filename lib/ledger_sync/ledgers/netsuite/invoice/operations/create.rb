# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class Invoice
        module Operations
          class Create < NetSuite::Operation::Create
            class Contract < LedgerSync::Ledgers::Contract
              params do
                required(:external_id).maybe(:string)
                optional(:account).hash(Types::Reference)
                required(:currency).filled(:hash, Types::Reference)
                required(:customer).hash(Types::Reference)
                optional(:deposit).maybe(:integer)
                required(:ledger_id).value(:nil)
                required(:line_items).array(Types::Reference)
                optional(:memo).filled(:string)
                optional(:transaction_date).filled(:date?)
              end
            end
          end
        end
      end
    end
  end
end
