# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Events::Publisher do
  let(:subject) do
    Class.new do
      include Ma.publisher
      include RedSands::Events::Publisher
    end.new
  end

  before do
    stub_const('RedSands::Events::TestEvent', Class.new)
    stub_const('RedSands::Events::BeforeTestEvent', Class.new)
    stub_const('RedSands::Events::AfterTestEvent', Class.new)
  end

  describe '#publish' do
    it 'broadcasts before and after events' do
      expect(subject).to receive(:broadcast).with(an_instance_of(RedSands::Events::BeforeTestEvent))
      expect(subject).to receive(:broadcast).with(an_instance_of(RedSands::Events::TestEvent))
      expect(subject).to receive(:broadcast).with(an_instance_of(RedSands::Events::AfterTestEvent))
      subject.publish(RedSands::Events::TestEvent, **{})
    end
  end

  describe '#with_hooks' do
    let(:blk) { double(call: 0) }

    it 'broadcasts a before event, the original event, runs the block, then broadcasts an after event' do
      expect(subject).to receive(:broadcast).with(an_instance_of(RedSands::Events::BeforeTestEvent))
      expect(subject).to receive(:broadcast).with(an_instance_of(RedSands::Events::TestEvent))
      expect(subject).to receive(:broadcast).with(an_instance_of(RedSands::Events::AfterTestEvent))
      expect(blk).to receive(:call).with(0)
      subject.with_hooks(RedSands::Events::TestEvent) { blk.call(0) }
    end
  end
end
