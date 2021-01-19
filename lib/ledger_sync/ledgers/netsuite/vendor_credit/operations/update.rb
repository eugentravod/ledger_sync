# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorCredit
        module Operations
          class Update < NetSuite::Operation::Update
            class Contract < LedgerSync::Ledgers::Contract
              schema do
                required(:ledger_id).filled(:string)
                required(:external_id).maybe(:string)
              end
            end
          end
        end
      end
    end
  end
end
