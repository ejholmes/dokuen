require 'spec_helper'

describe Dokuen::Application::Environment do
  subject(:environment) { described_class.new(File.expand_path('../../../fixtures/dokuen/env', __FILE__)) }

  describe '.[]' do
    it 'returns the value of the config var' do
      expect(environment['RACK_ENV']).to eq 'production'
    end
  end

  describe '.[]=' do
    pending 'sets the value of the config var' do
      File.any_instance.stub(:write) { |value| value }
      environment['RACK_ENV'] = 'staging'
    end
  end

  describe '.delete' do
    pending 'deletes the config var' do
      File.any_instance.stub(:unlink)
      environment.delete('RACK_ENV')
      expect(environment).to_not have_key 'RACK_ENV'
    end
  end
end
