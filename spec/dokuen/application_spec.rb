require 'spec_helper'

describe Dokuen::Application do
  let(:config) { double(Dokuen::Config) }
  let(:name) { double('name') }
  subject(:application) { described_class.new(name) }

  before do
    described_class.stub config: config
  end

  describe '#new' do
    its(:name) { should eq name }
  end

  describe '#create' do
    subject { -> { described_class.create(name) } }

    context 'when the application already exists' do
      before do
        described_class.stub exists?: true
      end

      it { should raise_error Dokuen::ApplicationExistsError }
    end

    context 'when the application does not exist' do
      before do
        described_class.stub :exists? => false
        Dokuen::Application::Creator.should_receive(:create).with(name)
      end

      it { should_not raise_error }
    end
  end

  describe '.env' do
    subject(:env) { -> { application.env } }

    before do
      config.stub :env_dir => double('env_dir')
      Dokuen::Application::Environment.should_receive(:new).with(config.env_dir)
    end

    it { should_not raise_error }
  end

  describe '.deploy' do
    subject(:deploy) { -> { application.deploy } }

    before do
      Dokuen::Application::Deploy.should_receive(:deploy).with(application)
    end

    it { should_not raise_error }
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
