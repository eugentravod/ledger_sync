# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class FiscalCalendar < NetSuiteSOAP::Resource
        attribute :refName, type: LedgerSync::Type::String
      end
    end
  end
end
