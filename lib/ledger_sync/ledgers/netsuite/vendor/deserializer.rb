# frozen_string_literal: true

require_relative '../currency_list_item/deserializer'
require_relative '../tax_code/deserializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class Vendor
        class Deserializer < NetSuite::Deserializer
          id

          attribute :external_id, hash_attribute: :externalId
          # attribute :ref_name, hash_attribute: :refName
          attribute :subsidiary, type: Type::DeserializerSubsidiaryType.new(subsidiary_class: Subsidiary)
          attribute :email

          attribute :company_name, hash_attribute: :companyName

          attribute :first_name, hash_attribute: :firstName
          attribute :last_name,  hash_attribute: :lastName
          attribute :is_person,  hash_attribute: :isPerson

          attribute :vatregnumber, hash_attribute: :vatregnumber
          attribute :country, hash_attribute: :shipCountry
          attribute :address, hash_attribute: :shipAddressee

          references_one :tax_code, hash_attribute: :taxItem, serializer: LedgerSync::Ledgers::NetSuite::TaxCode::Serializer
          references_many :currency_list, 
                    hash_attribute: 'currencylist.items',
                    deserializer: LedgerSync::Ledgers::NetSuite::CurrencyListItem::Deserializer
        end
      end
    end
  end
end
