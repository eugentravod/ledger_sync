# frozen_string_literal: true

require 'oauth2'

module LedgerSync
  module Ledgers
    module NetSuiteSOAP
      class Client < Ledgers::Client
        DEFAULT_API_VERSION = '2016_2'

        attr_reader :account_id,
                    :api_version,
                    :consumer_key,
                    :consumer_secret,
                    :token_id,
                    :token_secret

        def initialize(args = {})
          @account_id      = args.fetch(:account_id)
          @api_version     = args.fetch(:api_version, DEFAULT_API_VERSION)
          @consumer_key    = args.fetch(:consumer_key)
          @consumer_secret = args.fetch(:consumer_secret)
          @token_id        = args.fetch(:token_id)
          @token_secret    = args.fetch(:token_secret)
        end

        #
        # Converts an account_id for use by the NetSuite gem
        #
        # @return [String] Converted account_id
        #
        def account_id_for_gem
          account_id.downcase.split('-sb').join('_SB')
        end

        #
        # Converts an account_id for use in the API URL
        #
        # @return [String] API URL compliant account_id
        #
        def account_id_for_url
          account_id.downcase.split('_SB').join('-sb')
        end

        def setup
          setup_account_id_for_gem = account_id_for_gem
          setup_account_id_for_url = account_id_for_url
          setup_api_version        = api_version
          setup_consumer_key       = consumer_key
          setup_consumer_secret    = consumer_secret
          setup_token_id           = token_id
          setup_token_secret       = token_secret

          ::NetSuite.configure do
            reset!

            account setup_account_id_for_gem
            consumer_key setup_consumer_key
            consumer_secret setup_consumer_secret
            token_id setup_token_id
            token_secret setup_token_secret
            api_version setup_api_version
            wsdl_domain "#{setup_account_id_for_url}.suitetalk.api.netsuite.com"
          end
        end

        def teardown
          ::NetSuite.configure do
            reset!
          end
        end

        def wrap_perform
          setup
          yield
        ensure
          teardown
        end

        def self.ledger_attributes_to_save
          []
        end

        def self.new_from_env(**override)
          new(
            {
              account_id: ENV.fetch('NETSUITE_ACCOUNT_ID', nil),
              consumer_key: ENV.fetch('NETSUITE_CONSUMER_KEY', nil),
              consumer_secret: ENV.fetch('NETSUITE_CONSUMER_SECRET', nil),
              token_id: ENV.fetch('NETSUITE_TOKEN_ID', nil),
              token_secret: ENV.fetch('NETSUITE_TOKEN_SECRET', nil)
            }.merge(override)
          )
        end
      end
    end
  end
end
