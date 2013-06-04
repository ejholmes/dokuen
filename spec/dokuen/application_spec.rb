require 'spec_helper'

describe Dokuen::Application do
  let(:name) { double('name') }
  let(:config) { double('config') }
  subject(:application) { described_class.new(name, config) }

  describe '#new' do
    its(:name) { should eq name }
    its(:config) { should eq config }
  end

  describe '#create' do
    pending 'creates an application and returns a new instance'
  end

  describe '.env' do
    pending 'is an instance of Application::Environment'
  end

  describe '.deploy' do
    pending 'deploys the application'
  end

  describe '.scale' do
    pending 'scales the application processes'
  end

  describe '.shutdown' do
    pending 'kills all process and shuts the application down'
  end

  describe '.restart' do
    pending 'restarts all process'
  end

  describe '.run' do
    pending 'runs the command with environment variables set'
  end

  describe '.write_nginx_config' do
    pending 'writes a config for nginx'
  end

  describe '.clean' do
    pending 'removes all pid files'
  end
end
