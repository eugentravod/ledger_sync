# frozen_string_literal: true

require_relative '../fiscal_calendar/serializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class AccountingPeriod
        class Serializer < NetSuite::Serializer
          ledger_id

          attribute :allLocked, resource_attribute: :all_locked
          attribute :allowNonGLChanges, resource_attribute: :allow_non_gl_changes
          attribute :apLocked, resource_attribute: :ap_locked
          attribute :arLocked, resource_attribute: :ar_locked
          attribute :closed, resource_attribute: :closed
          attribute :startDate, resource_attribute: :start_date
          attribute :endDate, resource_attribute: :end_date
          attribute :periodName, resource_attribute: :period_name
          attribute :isinactive, resource_attribute: :is_inactive
          attribute :isPosting, resource_attribute: :is_posting
          attribute :isQuarter, resource_attribute: :is_quarter
          attribute :isYear, resource_attribute: :is_year
          attribute :parent, resource_attribute: :parent,
                             serializer: LedgerSync::Ledgers::NetSuite::AccountingPeriod::Serializer
          references_one :fiscal_calendar, resource_attribute: :fiscal_calendar,
                                           serializer: LedgerSync::Ledgers::NetSuite::FiscalCalendar::Serializer
        end
      end
    end
  end
end
