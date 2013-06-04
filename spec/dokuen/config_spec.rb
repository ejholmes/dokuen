require 'spec_helper'

describe Dokuen::Config do
  let(:path) { double('path') }
  subject(:config) { described_class.new(path) }

  before do
    File.should_receive(:read)
      .with(path)
      .and_return(YAML.dump('foo' => 'bar'))
  end

  describe '.method_missing' do
    it 'provides access to configuration' do
      expect(config.foo).to eq 'bar'
    end
  end
end
