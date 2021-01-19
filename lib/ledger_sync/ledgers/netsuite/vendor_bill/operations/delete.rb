# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorBill
        module Operations
          class Delete < NetSuite::Operation::Delete
            class Contract < LedgerSync::Ledgers::Contract
              params do
                optional(:external_id).maybe(:string)
                required(:ledger_id).filled(:string)
              end
            end
          end
        end
      end
    end
  end
end
