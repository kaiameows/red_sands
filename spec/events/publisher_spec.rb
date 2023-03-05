# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Events::Publisher do
  let(:subject) do
    Class.new do
      include Wisper::Publisher
      include RedSands::Events::Publisher
    end.new
  end

  describe '#publish' do
    it 'broadcasts before and after events' do
      %w[before_test test after_test].each do |event_name|
        expect(subject).to receive(:broadcast).with(event_name.to_sym, **{})
      end
      subject.publish(:test, **{})
    end
  end

  describe '#with_hooks' do
    let(:blk) { double(call: 0) }

    it 'broadcasts a before event, the original event, runs the block, then broadcasts an after event' do
      %w[before_test test after_test].each do |event_name|
        expect(subject).to receive(:broadcast).with(event_name.to_sym, **{})
      end
      expect(blk).to receive(:call).with(0)
      subject.with_hooks(:test) { blk.call(0) }
    end
  end
end
