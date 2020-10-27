
require 'spec_helper'

describe 'magnum::quota' do
  let :default_params do
    {
      :quota_clusters   => '<SERVICE DEFAULT>',
    }
  end

  let :params do
    {}
  end

  shared_examples 'magnum quota' do

    let :p do
      default_params.merge(params)
    end

    it 'contains default values' do
      is_expected.to contain_magnum_config('quotas/max_clusters_per_project').with_value(p[:quota_clusters])
    end

    context 'configure quota with parameters' do
      before :each do
        params.merge!({ :quota_clusters => 10 })
      end

      it 'contains overrided values' do
        is_expected.to contain_magnum_config('quotas/max_clusters_per_project').with_value(p[:quota_clusters])
      end
    end
  end

  on_supported_os({
    :supported_os   => OSDefaults.get_supported_os
  }).each do |os,facts|
    context "on #{os}" do
      let (:facts) do
        facts.merge(OSDefaults.get_facts({:os_workers => 8}))
      end

      it_behaves_like 'magnum quota'
    end
  end
end
