module LedgerSync
  module Adaptors
    module QuickBooksOnline
      module Bill
        module Operations
          class Find < QuickBooksOnline::Operation::Find
            class Contract < LedgerSync::Adaptors::Contract
              schema do
                required(:ledger_id).filled(:string)
                required(:vendor).hash(Types::Reference)
                required(:account).hash(Types::Reference)
                required(:currency).maybe(:string)
                required(:memo).maybe(:string)
                required(:transaction_date).maybe(:date?)
                required(:due_date).maybe(:date?)
                required(:line_items).array(Types::Reference)
              end
            end
          end
        end
      end
    end
  end
end
