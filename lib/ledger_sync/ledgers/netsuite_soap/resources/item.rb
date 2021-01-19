# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class Item < NetSuiteSOAP::Resource
        attribute :ref_name, type: Type::String
        attribute :item_id, type: Type::String
      end
    end
  end
end
