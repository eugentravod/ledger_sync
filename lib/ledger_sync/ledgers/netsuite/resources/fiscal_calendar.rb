# frozen_string_literal: true

module LedgerSync
  module Ledgers
    module NetSuite
      class FiscalCalendar < NetSuite::Resource
        attribute :refName, type: LedgerSync::Type::String
      end
    end
  end
end
