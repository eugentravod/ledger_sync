# frozen_string_literal: true

require_relative '../fiscal_calendar/deserializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class AccountingPeriod
        class Deserializer < NetSuite::Deserializer
          id

          attribute :all_locked, hash_attribute: :allLocked
          attribute :allow_non_gl_changes, hash_attribute: :allowNonGLChanges
          attribute :ap_locked, hash_attribute: :apLocked
          attribute :ar_locked, hash_attribute: :arLocked
          attribute :closed, hash_attribute: :closed
          attribute :start_date, hash_attribute: :startDate
          attribute :end_date, hash_attribute: :endDate
          attribute :period_name, hash_attribute: :periodName
          attribute :is_inactive, hash_attribute: :isinactive
          attribute :is_posting, hash_attribute: :isPosting
          attribute :is_quarter, hash_attribute: :isQuarter
          attribute :is_year, hash_attribute: :isYear
          references_one :parent, hash_attribute: :parent,
                                  serializer: LedgerSync::Ledgers::NetSuite::AccountingPeriod::Deserializer
          references_one :fiscal_calendar, hash_attribute: :fiscalCalendar,
                                           serializer: LedgerSync::Ledgers::NetSuite::FiscalCalendar::Deserializer
        end
      end
    end
  end
end
