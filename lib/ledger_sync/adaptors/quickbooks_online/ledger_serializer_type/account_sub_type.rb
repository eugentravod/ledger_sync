# frozen_string_literal: true

module LedgerSync
  module Adaptors
    module QuickBooksOnline
      module LedgerSerializerType
        class AccountSubType < Adaptors::LedgerSerializerType::MappingType
          MAPPING = {
            # Bank
            'cash_and_cash_equivalents' => 'CashAndCashEquivalents',
            'cash_on_hand' => 'CashOnHand',
            'checking' => 'Checking',
            'money_market' => 'MoneyMarket',
            'other_ear_marked_bank_accounts' => 'OtherEarMarkedBankAccounts',
            'rents_held_in_trust' => 'RentsHeldInTrust',
            'savings' => 'Savings',
            'trust_accounts' => 'TrustAccounts',
            # Other Current Asset
            'allowance_for_bad_debts' => 'AllowanceForBadDebts',
            'assets_available_for_sale' => 'AssetsAvailableForSale',
            'bal_with_govt_authorities' => 'BalWithGovtAuthorities',
            'called_up_share_capital_not_paid' => 'CalledUpShareCapitalNotPaid',
            'development_costs' => 'DevelopmentCosts',
            'employee_cash_advances' => 'EmployeeCashAdvances',
            'expenditure_authorisations_and_letters_of_credit' => 'ExpenditureAuthorisationsAndLettersOfCredit',
            'global_tax_deferred' => 'GlobalTaxDeferred',
            'global_tax_refund' => 'GlobalTaxRefund',
            'internal_transfers' => 'InternalTransfers',
            'inventory' => 'Inventory',
            'investment_mortgage_real_estate_loans' => 'Investment_MortgageRealEstateLoans',
            'investment_other' => 'Investment_Other',
            'investment_tax_exempt_securities' => 'Investment_TaxExemptSecurities',
            'investment_us_government_obligations' => 'Investment_USGovernmentObligations',
            'loans_to_officers' => 'LoansToOfficers',
            'loans_to_others' => 'LoansToOthers',
            'loans_to_stockholders' => 'LoansToStockholders',
            'other_consumables' => 'OtherConsumables',
            'other_current_assets' => 'OtherCurrentAssets',
            'prepaid_expenses' => 'PrepaidExpenses',
            'provisions_current_assets' => 'ProvisionsCurrentAssets',
            'retainage' => 'Retainage',
            'short_term_investments_in_related_parties' => 'ShortTermInvestmentsInRelatedParties',
            'short_term_loans_and_advances_to_related_parties' => 'ShortTermLoansAndAdvancesToRelatedParties',
            'trade_and_other_receivables' => 'TradeAndOtherReceivables',
            'undeposited_funds' => 'UndepositedFunds',
            # Fixed Asset
            'accumulated_amortization' => 'AccumulatedAmortization',
            'accumulated_depletion' => 'AccumulatedDepletion',
            'accumulated_depreciation' => 'AccumulatedDepreciation',
            'assets_in_course_of_construction' => 'AssetsInCourseOfConstruction',
            'buildings' => 'Buildings',
            'capital_wip' => 'CapitalWip',
            'cumulative_depreciation_on_intangible_assets' => 'CumulativeDepreciationOnIntangibleAssets',
            'depletable_assets' => 'DepletableAssets',
            'fixed_asset_computers' => 'FixedAssetComputers',
            'fixed_asset_copiers' => 'FixedAssetCopiers',
            'fixed_asset_furniture' => 'FixedAssetFurniture',
            'fixed_asset_other_tools_equipment' => 'FixedAssetOtherToolsEquipment',
            'fixed_asset_phone' => 'FixedAssetPhone',
            'fixed_asset_photo_video' => 'FixedAssetPhotoVideo',
            'fixed_asset_software' => 'FixedAssetSoftware',
            'furniture_and_fixtures' => 'FurnitureAndFixtures',
            'intangible_assets_under_development' => 'IntangibleAssetsUnderDevelopment',
            'intangible_assets' => 'IntangibleAssets',
            'land_asset' => 'LandAsset',
            'land' => 'Land',
            'leasehold_improvements' => 'LeaseholdImprovements',
            'machinery_and_equipment' => 'MachineryAndEquipment',
            'non_current_assets' => 'NonCurrentAssets',
            'other_fixed_assets' => 'OtherFixedAssets',
            'participating_interests' => 'ParticipatingInterests',
            'provisions_fixed_assets' => 'ProvisionsFixedAssets',
            'vehicles' => 'Vehicles',
            # Other Asset
            'accumulated_amortization_of_other_assets' => 'AccumulatedAmortizationOfOtherAssets',
            'assets_held_for_sale' => 'AssetsHeldForSale',
            'available_for_sale_financial_assets' => 'AvailableForSaleFinancialAssets',
            'deferred_tax' => 'DeferredTax',
            'goodwill' => 'Goodwill',
            'investments' => 'Investments',
            'lease_buyout' => 'LeaseBuyout',
            'licenses' => 'Licenses',
            'long_term_investments' => 'LongTermInvestments',
            'long_term_loans_and_advances_to_related_parties' => 'LongTermLoansAndAdvancesToRelatedParties',
            'organizational_costs' => 'OrganizationalCosts',
            'other_intangible_assets' => 'OtherIntangibleAssets',
            'other_long_term_assets' => 'OtherLongTermAssets',
            'other_long_term_investments' => 'OtherLongTermInvestments',
            'other_long_term_loans_and_advances' => 'OtherLongTermLoansAndAdvances',
            'prepayments_and_accrued_income' => 'PrepaymentsAndAccruedIncome',
            'provisions_non_current_assets' => 'ProvisionsNonCurrentAssets',
            'accounts_receivable' => 'AccountsReceivable',
            'security_deposits' => 'SecurityDeposits',
            # Equity
            'accumulated_adjustment' => 'AccumulatedAdjustment',
            'accumulated_other_comprehensive_income' => 'AccumulatedOtherComprehensiveIncome',
            'called_up_share_capital' => 'CalledUpShareCapital',
            'capital_reserves' => 'CapitalReserves',
            'common_stock' => 'CommonStock',
            'dividend_disbursed' => 'DividendDisbursed',
            'equity_in_earnings_of_subsiduaries' => 'EquityInEarningsOfSubsiduaries',
            'estimated_taxes' => 'EstimatedTaxes',
            'funds' => 'Funds',
            'healthcare' => 'Healthcare',
            'investment_grants' => 'InvestmentGrants',
            'money_received_against_share_warrants' => 'MoneyReceivedAgainstShareWarrants',
            'opening_balance_equity' => 'OpeningBalanceEquity',
            'other_free_reserves' => 'OtherFreeReserves',
            'owners_equity' => 'OwnersEquity',
            'paid_in_capital_or_surplus' => 'PaidInCapitalOrSurplus',
            'partner_contributions' => 'PartnerContributions',
            'partner_distributions' => 'PartnerDistributions',
            'partners_equity' => 'PartnersEquity',
            'personal_expense' => 'PersonalExpense',
            'personal_income' => 'PersonalIncome',
            'preferred_stock' => 'PreferredStock',
            'retained_earnings' => 'RetainedEarnings',
            'share_application_money_pending_allotment' => 'ShareApplicationMoneyPendingAllotment',
            'share_capital' => 'ShareCapital',
            'treasury_stock' => 'TreasuryStock',
            # Expense
            'advertising_promotional' => 'AdvertisingPromotional',
            'amortization_expense' => 'AmortizationExpense',
            'appropriations_to_depreciation' => 'AppropriationsToDepreciation',
            'auto' => 'Auto',
            'bad_debts' => 'BadDebts',
            'bank_charges' => 'BankCharges',
            'borrowing_cost' => 'BorrowingCost',
            'charitable_contributions' => 'CharitableContributions',
            'commissions_and_fees' => 'CommissionsAndFees',
            'cost_of_labor' => 'CostOfLabor',
            'distribution_costs' => 'DistributionCosts',
            'dues_subscriptions' => 'DuesSubscriptions',
            'entertainment_meals' => 'EntertainmentMeals',
            'entertainment' => 'Entertainment',
            'equipment_rental' => 'EquipmentRental',
            'external_services' => 'ExternalServices',
            'extraordinary_charges' => 'ExtraordinaryCharges',
            'finance_costs' => 'FinanceCosts',
            'global_tax_expense' => 'GlobalTaxExpense',
            'income_tax_expense' => 'IncomeTaxExpense',
            'insurance' => 'Insurance',
            'interest_paid' => 'InterestPaid',
            'legal_professional_fees' => 'LegalProfessionalFees',
            'loss_on_discontinued_operations_net_of_tax' => 'LossOnDiscontinuedOperationsNetOfTax',
            'management_compensation' => 'ManagementCompensation',
            'office_expenses' => 'OfficeExpenses',
            'office_general_administrative_expenses' => 'OfficeGeneralAdministrativeExpenses',
            'other_business_expenses' => 'OtherBusinessExpenses',
            'other_current_operating_charges' => 'OtherCurrentOperatingCharges',
            'other_external_services' => 'OtherExternalServices',
            'other_miscellaneous_service_cost' => 'OtherMiscellaneousServiceCost',
            'other_rental_costs' => 'OtherRentalCosts',
            'other_selling_expenses' => 'OtherSellingExpenses',
            'payroll_expenses' => 'PayrollExpenses',
            'project_studies_surveys_assessments' => 'ProjectStudiesSurveysAssessments',
            'promotional_meals' => 'PromotionalMeals',
            'purchases_rebates' => 'PurchasesRebates',
            'rent_or_lease_of_buildings' => 'RentOrLeaseOfBuildings',
            'repair_maintenance' => 'RepairMaintenance',
            'shipping_and_delivery_expense' => 'ShippingAndDeliveryExpense',
            'shipping_freight_delivery' => 'ShippingFreightDelivery',
            'staff_costs' => 'StaffCosts',
            'sundry' => 'Sundry',
            'supplies_materials' => 'SuppliesMaterials',
            'taxes_paid' => 'TaxesPaid',
            'travel_expenses_general_and_admin_expenses' => 'TravelExpensesGeneralAndAdminExpenses',
            'travel_expenses_selling_expense' => 'TravelExpensesSellingExpense',
            'travel_meals' => 'TravelMeals',
            'travel' => 'Travel',
            'unapplied_cash_bill_payment_expense' => 'UnappliedCashBillPaymentExpense',
            # Other Expense
            'amortization' => 'Amortization',
            'deferred_tax_expense' => 'DeferredTaxExpense',
            'depletion' => 'Depletion',
            'depreciation' => 'Depreciation',
            'exceptional_items' => 'ExceptionalItems',
            'exchange_gain_or_loss' => 'ExchangeGainOrLoss',
            'extraordinary_items' => 'ExtraordinaryItems',
            'gas_and_fuel' => 'GasAndFuel',
            'home_office' => 'HomeOffice',
            'home_owner_rental_insurance' => 'HomeOwnerRentalInsurance',
            'income_tax_other_expense' => 'IncomeTaxOtherExpense',
            'mat_credit' => 'MatCredit',
            'mortgage_interest' => 'MortgageInterest',
            'other_home_office_expenses' => 'OtherHomeOfficeExpenses',
            'other_miscellaneous_expense' => 'OtherMiscellaneousExpense',
            'other_vehicle_expenses' => 'OtherVehicleExpenses',
            'parking_and_tolls' => 'ParkingAndTolls',
            'penalties_settlements' => 'PenaltiesSettlements',
            'prior_period_items' => 'PriorPeriodItems',
            'rent_and_lease' => 'RentAndLease',
            'repairs_and_maintenance' => 'RepairsAndMaintenance',
            'tax_roundoff_gain_or_loss' => 'TaxRoundoffGainOrLoss',
            'utilities' => 'Utilities',
            'vehicle_insurance' => 'VehicleInsurance',
            'vehicle_lease' => 'VehicleLease',
            'vehicle_loan_interest' => 'VehicleLoanInterest',
            'vehicle_loan' => 'VehicleLoan',
            'vehicle_registration' => 'VehicleRegistration',
            'vehicle_repairs' => 'VehicleRepairs',
            'vehicle' => 'Vehicle',
            'wash_and_road_services' => 'WashAndRoadServices',
            # Cost of Goods Sold
            'cost_of_labor_cos' => 'CostOfLaborCos',
            'cost_of_sales' => 'CostOfSales',
            'equipment_rental_cos' => 'EquipmentRentalCos',
            'freight_and_delivery_cost' => 'FreightAndDeliveryCost',
            'other_costs_of_service_cos' => 'OtherCostsOfServiceCos',
            'shipping_freight_delivery_cos' => 'ShippingFreightDeliveryCos',
            'supplies_materials_cogs' => 'SuppliesMaterialsCogs',
            # Accounts Payable
            'accounts_payable' => 'AccountsPayable',
            'outstanding_dues_micro_small_enterprise' => 'OutstandingDuesMicroSmallEnterprise',
            'outstanding_dues_other_than_micro_small_enterprise' => 'OutstandingDuesOtherThanMicroSmallEnterprise',
            # Credit Card
            'credit_card' => 'CreditCard',
            # Long Term Liability
            'accruals_and_deferred_income' => 'AccrualsAndDeferredIncome',
            'accrued_long_lerm_liabilities' => 'AccruedLongLermLiabilities',
            'accrued_vacation_payable' => 'AccruedVacationPayable',
            'bank_loans' => 'BankLoans',
            'debts_related_to_participating_interests' => 'DebtsRelatedToParticipatingInterests',
            'deferred_tax_liabilities' => 'DeferredTaxLiabilities',
            'government_and_other_public_authorities' => 'GovernmentAndOtherPublicAuthorities',
            'group_and_associates' => 'GroupAndAssociates',
            'liabilities_related_to_assets_held_for_sale' => 'LiabilitiesRelatedToAssetsHeldForSale',
            'long_term_borrowings' => 'LongTermBorrowings',
            'long_term_debit' => 'LongTermDebit',
            'long_term_employee_benefit_obligations' => 'LongTermEmployeeBenefitObligations',
            'notes_payable' => 'NotesPayable',
            'obligations_under_finance_leases' => 'ObligationsUnderFinanceLeases',
            'other_long_term_liabilities' => 'OtherLongTermLiabilities',
            'other_long_term_provisions' => 'OtherLongTermProvisions',
            'provision_for_liabilities' => 'ProvisionForLiabilities',
            'provisions_non_current_liabilities' => 'ProvisionsNonCurrentLiabilities',
            'shareholder_notes_payable' => 'ShareholderNotesPayable',
            'staff_and_related_long_term_liability_accounts' => 'StaffAndRelatedLongTermLiabilityAccounts',
            # Other Current Liability
            'accrued_liabilities' => 'AccruedLiabilities',
            'current_liabilities' => 'CurrentLiabilities',
            'current_portion_employee_benefits_obligations' => 'CurrentPortionEmployeeBenefitsObligations',
            'current_portion_of_obligations_under_finance_leases' => 'CurrentPortionOfObligationsUnderFinanceLeases',
            'current_tax_liability' => 'CurrentTaxLiability',
            'direct_deposit_payable' => 'DirectDepositPayable',
            'dividends_payable' => 'DividendsPayable',
            'duties_and_taxes' => 'DutiesAndTaxes',
            'federal_income_tax_payable' => 'FederalIncomeTaxPayable',
            'global_tax_payable' => 'GlobalTaxPayable',
            'global_tax_suspense' => 'GlobalTaxSuspense',
            'insurance_payable' => 'InsurancePayable',
            'interest_payables' => 'InterestPayables',
            'line_of_credit' => 'LineOfCredit',
            'loan_payable' => 'LoanPayable',
            'other_current_liabilities' => 'OtherCurrentLiabilities',
            'payroll_clearing' => 'PayrollClearing',
            'payroll_tax_payable' => 'PayrollTaxPayable',
            'prepaid_expenses_payable' => 'PrepaidExpensesPayable',
            'provision_for_warranty_obligations' => 'ProvisionForWarrantyObligations',
            'provisions_current_liabilities' => 'ProvisionsCurrentLiabilities',
            'rents_in_trust_liability' => 'RentsInTrustLiability',
            'sales_tax_payable' => 'SalesTaxPayable',
            'short_term_borrowings' => 'ShortTermBorrowings',
            'social_security_agencies' => 'SocialSecurityAgencies',
            'staff_and_related_liability_accounts' => 'StaffAndRelatedLiabilityAccounts',
            'state_local_income_tax_payable' => 'StateLocalIncomeTaxPayable',
            'sundry_debtors_and_creditors' => 'SundryDebtorsAndCreditors',
            'trade_and_other_payables' => 'TradeAndOtherPayables',
            'trust_accounts_liabilities' => 'TrustAccountsLiabilities',
            # Income
            'cash_receipt_income' => 'CashReceiptIncome',
            'discounts_refunds_given' => 'DiscountsRefundsGiven',
            'non_profit_income' => 'NonProfitIncome',
            'operating_grants' => 'OperatingGrants',
            'other_current_operating_income' => 'OtherCurrentOperatingIncome',
            'other_primary_income' => 'OtherPrimaryIncome',
            'own_work_capitalized' => 'OwnWorkCapitalized',
            'revenue_general' => 'RevenueGeneral',
            'sales_of_product_income' => 'SalesOfProductIncome',
            'sales_retail' => 'SalesRetail',
            'sales_wholesale' => 'SalesWholesale',
            'savings_by_tax_scheme' => 'SavingsByTaxScheme',
            'service_fee_income' => 'ServiceFeeIncome',
            'unapplied_cash_payment_income' => 'UnappliedCashPaymentIncome',
            # Other Income
            'dividend_income' => 'DividendIncome',
            'gain_loss_on_sale_of_fixed_assets' => 'GainLossOnSaleOfFixedAssets',
            'gain_loss_on_sale_of_investments' => 'GainLossOnSaleOfInvestments',
            'interest_earned' => 'InterestEarned',
            'loss_on_disposal_of_assets' => 'LossOnDisposalOfAssets',
            'other_investment_income' => 'OtherInvestmentIncome',
            'other_miscellaneous_income' => 'OtherMiscellaneousIncome',
            'other_operating_income' => 'OtherOperatingIncome',
            'tax_exempt_interest' => 'TaxExemptInterest',
            'unrealised_loss_on_securities_net_of_tax' => 'UnrealisedLossOnSecuritiesNetOfTax'
          }.freeze

          def self.mapping
            @mapping ||= MAPPING
          end
        end
      end
    end
  end
end