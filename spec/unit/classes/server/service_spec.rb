
# frozen_string_literal: true

require 'spec_helper'

describe 'postgresql::server::service', type: :class do

  let :pre_condition do
    'include postgresql::server'
  end

  let :node_params do
    {
      'lsbmajdistrelease' => '18.04',
    }
  end

  let :facts do
    {
      os: {
        family: 'Debian',
        name: 'Ubuntu',
        release: { 'full' => '18.04', 'major' => '18.04' },
      },
    }
  end

  it {
    is_expected.to contain_class('postgresql::server::service')
    is_expected.to contain_service('postgresqld').with_name('postgresql')
  }
end
