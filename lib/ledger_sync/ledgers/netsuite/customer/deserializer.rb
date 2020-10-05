# frozen_string_literal: true

require_relative '../customer_currency_list_item/deserializer'
require_relative '../tax_code/deserializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class Customer
        class Deserializer < NetSuite::Deserializer
          id

          attribute :companyName
          attribute :firstName
          attribute :lastName
          attribute :email
          attribute :phone

          attribute :subsidiary,
                    type: Type::DeserializerSubsidiaryType.new(subsidiary_class: Subsidiary)

          attribute :ref_name, hash_attribute: :refName

          attribute :is_person, hash_attribute: :isPerson
          attribute :vatregnumber
          attribute :country, hash_attribute: :Address1_country
          attribute :address, hash_attribute: :Address1_defaultBilling
          references_one :tax_code, hash_attribute: :taxItem, serializer: LedgerSync::Ledgers::NetSuite::TaxCode::Serializer

          references_many :currency_list, 
                    hash_attribute: 'currencyList.items',
                    deserializer: LedgerSync::Ledgers::NetSuite::CustomerCurrencyListItem::Deserializer
        end
      end
    end
  end
end
