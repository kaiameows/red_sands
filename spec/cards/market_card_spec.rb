# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Cards::MarketCard do
  let(:subject) { build(:market_card) }

  its(:name) { should eq('Test Card') }
  its(:power_cost) { should eq(1) }
  its(:factions) { should eq([RedSands::Faction::Empire]) }
  its(:sectors) { should eq(['Uninhabited Sector']) }
  its(:buy_effect) { should be_nil }
  its(:location) { should eq('market') }

  describe '#buy' do
    its(:buy_to_hand?) { should be_falsey }
    its(:buy_to_play?) { should be_falsey }

    context 'normal buy' do
      it "changes the card's location to 'discard'" do
        subject.buy
        expect(subject.location).to eq('discard')
      end
    end

    context 'buy to hand' do
      before { subject.buy_to_hand = true }
      it "changes the card's location to 'hand'" do
        subject.buy
        expect(subject.location).to eq('hand')
      end
    end

    context 'buy to play' do
      before { subject.buy_to_play = true }
      it "changes the card's location to 'play'" do
        subject.buy
        expect(subject.location).to eq('play')
      end
    end
  end
end


