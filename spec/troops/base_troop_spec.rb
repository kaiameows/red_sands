# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Troops::BaseTroop do
  it 'has a type' do
    expect(described_class.new.type).to eq(:normal)
  end

  it 'has a power' do
    expect(described_class.new.power).to eq(2)
  end

  its 'power can be changed' do
    expect { subject.power = 3 }.to change { subject.power }.from(2).to(3)
  end

  describe 'state machine' do
    it 'has a deployment state machine' do
      expect(subject).to respond_to(:deployment_state)
      expect(subject).to respond_to(:deployment_state=)
      expect(subject).to respond_to(:deployment_state?)
      expect(subject).to respond_to(:deployment_state_events)
    end

    it 'has an activate event' do
      expect(subject).to respond_to(:activate)
      expect(subject).to respond_to(:activate!)
      expect(subject).to respond_to(:can_activate?)
    end

    it 'has a reserve event' do
      expect(subject).to respond_to(:reserve)
      expect(subject).to respond_to(:reserve!)
      expect(subject).to respond_to(:can_reserve?)
    end

    it 'has a default deployment state of :spawned' do
      expect(subject.spawned?).to be(true)
      expect(subject.deployment_state).to eq('spawned')
    end
  end
end
