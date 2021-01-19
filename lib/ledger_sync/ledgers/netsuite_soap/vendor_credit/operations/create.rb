# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class VendorCredit
        module Operations
          class Create < NetSuiteSOAP::Operation::Create
            class Contract < LedgerSync::Ledgers::Contract
              params do
                required(:external_id).maybe(:string)
                optional(:account).hash(Types::Reference)
                required(:currency).filled(:hash, Types::Reference)
                required(:vendor).hash(Types::Reference)
                required(:ledger_id).value(:nil)
                required(:line_items).array(Types::Reference)
                optional(:memo).filled(:string)
                optional(:transaction_date).filled(:date?)
              end
            end

            private

            def operate
              netsuite_resource = ::NetSuite::Records::VendorCredit.new(
                memo: resource.memo,
                external_id: resource.external_id,
                exchange_rate: resource.exchange_rate,
                tran_date: resource.transaction_date.to_datetime,
                currency: { internal_id: resource.currency.ledger_id },
                item_list: netsuite_item_list,
                account: { internal_id: resource.account.ledger_id },
                entity: { internal_id: resource.vendor.ledger_id },
                posting_period: { internal_id: resource.posting_period.ledger_id },
              )
              return netsuite_failure(netsuite_resource: netsuite_resource) unless netsuite_resource.add

              resource.ledger_id = netsuite_resource.internal_id
              success(
                resource: resource,
                response: netsuite_resource
              )
            end

            def netsuite_item_list
              item_list = ::NetSuite::Records::VendorCreditItemList.new
              resource.line_items.each do |line_item|
                data = { custcolcustline_from_lang_field: line_item.source_language, custcolcustline_to_lang_field: line_item.target_language }.map do |field_key, field_value|
                  ::NetSuite::Records::CustomField.new(script_id: field_key, value: ::NetSuite::Records::CustomRecordRef.new({ internal_id: field_value.ledger_id }), type: "platformCore:SelectCustomFieldRef")
                end
                custom_field_list = ::NetSuite::Records::CustomFieldList.new(custom_field: data)
                item_list << ::NetSuite::Records::VendorCreditItem.new(
                  item: { internal_id: line_item.item.ledger_id },
                  location: { internal_id: line_item.location.ledger_id },
                  tax_code: { internal_id: line_item.tax_code.ledger_id },
                  gross_amt: line_item.gross_amount,
                  quantity: line_item.quantity,
                  rate: line_item.gross_amount,
                  custom_field_list: custom_field_list
                )
              end
              item_list
            end
          end
        end
      end
    end
  end
end
