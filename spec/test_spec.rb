require 'spec_helper'
require 'application_controller'

describe ApplicationController do
  describe 'demo' do
    context 'correctly' do
      it 'test demo' do
        expect('test').to eq('test')
      end
    end
  end
end