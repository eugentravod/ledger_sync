# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class VendorCredit
        module Operations
          class Find < NetSuiteSOAP::Operation::Find
            class Contract < LedgerSync::Ledgers::Contract
              params do
                optional(:external_id).maybe(:string)
                required(:ledger_id).filled(:string)
                # optional(:email).maybe(:string)
                # optional(:name).maybe(:string)
                # optional(:phone_number).maybe(:string)
                # required(:subsidiary).maybe(:hash, Types::Reference)
              end
            end

            private

            def operate
              vendor_bill = ::NetSuite::Records::VendorCredit.get(
                internal_id: resource.ledger_id
              )
              resource.ledger_id = vendor_bill.internal_id
              resource.external_id = vendor_bill.external_id

              success(
                resource: resource,
                response: vendor_bill
              )
            end
          end
        end
      end
    end
  end
end
