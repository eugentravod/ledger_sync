# frozen_string_literal: true
require_relative 'fiscal_calendar'

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class TaxPeriod < NetSuiteSOAP::Resource
        attribute :all_locked, type: Type::Boolean
        attribute :closed, type: Type::Boolean

        attribute :start_date, type: LedgerSync::Type::String
        attribute :end_date, type: LedgerSync::Type::String
        attribute :period_name, type: LedgerSync::Type::String

        attribute :is_adjust, type: Type::Boolean
        attribute :is_inactive, type: Type::Boolean
        attribute :is_posting, type: Type::Boolean
        attribute :is_quarter, type: Type::Boolean
        attribute :is_year, type: Type::Boolean
        references_one :fiscal_calendar, to: FiscalCalendar
      end
    end
  end
end
