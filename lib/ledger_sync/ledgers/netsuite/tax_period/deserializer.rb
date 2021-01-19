# frozen_string_literal: true

require_relative '../fiscal_calendar/deserializer'

module LedgerSync
  module Ledgers
    module NetSuite
      class TaxPeriod
        class Deserializer < NetSuite::Deserializer
          id

          attribute :closed, hash_attribute: :closed
          attribute :start_date, hash_attribute: :startDate
          attribute :end_date, hash_attribute: :endDate
          attribute :period_name, hash_attribute: :periodName
          attribute :is_inactive, hash_attribute: :isinactive
          attribute :is_posting, hash_attribute: :isPosting
          attribute :is_quarter, hash_attribute: :isQuarter
          attribute :is_year, hash_attribute: :isYear
          references_one :fiscal_calendar, hash_attribute: :fiscalCalendar,
                                           serializer: LedgerSync::Ledgers::NetSuite::FiscalCalendar::Deserializer
        end
      end
    end
  end
end
