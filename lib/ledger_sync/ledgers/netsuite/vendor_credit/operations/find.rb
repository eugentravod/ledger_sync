# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class VendorCredit
        module Operations
          class Find <  NetSuite::Operation::Find
            class Contract < LedgerSync::Ledgers::Contract
              schema do
                required(:ledger_id).filled(:string)
              end
            end
          end
        end
      end
    end
  end
end
