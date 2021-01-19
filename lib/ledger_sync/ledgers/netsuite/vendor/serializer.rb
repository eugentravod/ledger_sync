# frozen_string_literal: true

require_relative '../reference/serializer'
require_relative '../currency_list_item/serializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class Vendor
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :externalId, resource_attribute: :external_id
          attribute :companyName, resource_attribute: :company_name
          attribute :email
          attribute :firstName, resource_attribute: :first_name
          attribute :lastName, resource_attribute: :last_name

          references_one :subsidiary, serializer: Reference::Serializer

          # attribute :ref_name, resource_attribute: :refName
          attribute :isPerson,  resource_attribute: :is_person

          attribute :vatregnumber, resource_attribute: :vatregnumber
          attribute :shipCountry, resource_attribute: :country
          attribute :shipAddressee, resource_attribute: :address
          references_one :taxItem, resource_attribute: :tax_code, serializer: LedgerSync::Ledgers::NetSuite::TaxCode::Serializer

          references_many 'currencylist.items', 
                    resource_attribute: :currency_list,
                    serializer: LedgerSync::Ledgers::NetSuite::CurrencyListItem::Serializer

        end
      end
    end
  end
end
