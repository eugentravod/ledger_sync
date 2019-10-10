require 'spec_helper'

support :input_helpers
support :adaptor_helpers
support :quickbooks_helpers

RSpec.describe 'quickbooks_online/payments/find', type: :feature do
  include InputHelpers
  include AdaptorHelpers
  include QuickbooksHelpers

  before {
    stub_find_payment
  }

  let(:customer) do
    LedgerSync::Customer.new(customer_resource({ledger_id: '123'}))
  end

  let(:resource) do
    LedgerSync::Payment.new(payment_resource({ledger_id: '123', customer: customer}))
  end

  let(:input) do
    {
      adaptor: quickbooks_adaptor,
      resource: resource
    }
  end

  context '#perform' do
    subject { LedgerSync::Adaptors::QuickBooksOnline::Payment::Operations::Find.new(**input).perform }
    it { expect(subject).to be_success }
    it { expect(subject).to be_a(LedgerSync::OperationResult::Success)}
  end
end
