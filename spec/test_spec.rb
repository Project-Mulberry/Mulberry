require 'spec_helper'
require 'application_controller'

describe ApplicationController do
  describe 'demo' do
    context 'correctly' do
      before :each do
        puts 'test'
      end
      it 'test demo' do
        expect('a').to eq('a')
      end
    end
  end
end