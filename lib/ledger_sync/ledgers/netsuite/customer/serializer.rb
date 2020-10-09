# frozen_string_literal: true

require_relative '../reference/serializer'
require_relative '../customer_currency_list_item/serializer'
require_relative '../tax_code/serializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class Customer
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :companyName
          attribute :firstName
          attribute :lastName
          attribute :email
          attribute :phone

          attribute :externalid, resource_attribute: :external_id
          attribute :refName,
                    resource_attribute: :ref_name

          references_one :subsidiary,
                         serializer: Reference::Serializer

          attribute :isPerson,resource_attribute: :is_person
          attribute :vatregnumber
          attribute :Address1_country, resource_attribute: :country
          attribute :Address1_defaultBilling, resource_attribute: :address
          references_one :taxItem, resource_attribute: :tax_code, serializer: LedgerSync::Ledgers::NetSuite::TaxCode::Serializer

          references_many 'currencyList.items', 
                          resource_attribute: :currency_list,
                          serializer: LedgerSync::Ledgers::NetSuite::CustomerCurrencyListItem::Serializer
        end
      end
    end
  end
end
