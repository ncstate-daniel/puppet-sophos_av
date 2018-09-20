require 'spec_helper'
describe 'sophos_av' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { { 'source_package' => 'http://example.org/sav-linux-free-9.tgz' } }

      it { is_expected.to compile }
    end
  end
end
