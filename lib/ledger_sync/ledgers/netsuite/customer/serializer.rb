# frozen_string_literal: true

require_relative '../reference/serializer'
require_relative '../customer_currency_list_item/serializer'

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

          attribute :externalId,
                    resource_attribute: :external_id

          attribute :refName,
                    resource_attribute: :ref_name

          references_one :subsidiary,
                         serializer: Reference::Serializer

          references_many 'currencyList.items', 
                          resource_attribute: :currency_list,
                          serializer: LedgerSync::Ledgers::NetSuite::CustomerCurrencyListItem::Serializer
        end
      end
    end
  end
end
