#
# Unit tests for magnum::oslo_middlware
#
require 'spec_helper'

describe 'magnum::oslo_middleware' do

  let :params do
    {}
  end

  shared_examples_for 'magnum-oslo-middleware' do
    context 'when setting oslo_middleware parameters' do
      before :each do
        params.merge!(
          :params => { 'enable_proxy_headers_parsing' => true }
        )
      end

      it 'configures oslo_middleware section' do
        is_expected.to contain_magnum_config('oslo_middleware/enable_proxy_headers_parsing').with_value('true')
      end
    end
  end

  on_supported_os({
    :supported_os   => OSDefaults.get_supported_os
  }).each do |os,facts|
    context "on #{os}" do
      let (:facts) do
        facts.merge!(OSDefaults.get_facts())
      end

      it_configures 'magnum-oslo-middleware'
    end

  end

end
