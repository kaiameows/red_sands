# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Concerns::Buyable do
  let(:subject) do
    Class.new do
      include RedSands::Concerns::Flaggable
      include RedSands::Concerns::Buyable
    end.new
  end

  it 'should have a buy_to_hand flag' do
    expect(subject).to respond_to(:buy_to_hand)
    expect(subject).to respond_to(:buy_to_hand?)
    expect(subject).to respond_to(:buy_to_hand=)
  end

  it 'should have a buy_to_play flag' do
    expect(subject).to respond_to(:buy_to_play)
    expect(subject).to respond_to(:buy_to_play?)
    expect(subject).to respond_to(:buy_to_play=)
  end

  describe 'state machine' do
    it 'should have a location state machine' do
      expect(subject).to respond_to(:location)
      expect(subject).to respond_to(:location=)
      expect(subject).to respond_to(:location?)
      expect(subject).to respond_to(:location_events)
    end

    it 'should have a buy event' do
      expect(subject).to respond_to(:buy)
      expect(subject).to respond_to(:buy!)
      expect(subject).to respond_to(:can_buy?)
    end

    it 'should not have a default location' do
      expect(subject.location).to be_nil
    end
  end
end
