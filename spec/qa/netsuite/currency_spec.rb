# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LedgerSync::Ledgers::NetSuite::Currency, qa: true, connection: :netsuite do
  let(:connection) { netsuite_connection }
  let(:attribute_updates) do
    {
      name: "QA UPDATE #{test_run_id}"
    }
  end
  let(:record) { :currency }
  let(:resource) do
    FactoryBot.create(:currency)
  end

  it_behaves_like 'a full netsuite resource'
end
