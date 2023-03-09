# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Cards::MarketCardEvaluator do
  let(:dsl) do
    -> (_) {
      card 'Test Card', count: 2 do
        power_cost 3
        factions [RedSands::Faction::Empire, RedSands::Faction::Magic]
        sectors [RedSands::Sector::Uninhabited, RedSands::Sector::Alchemist]
        buy_effect { draw 1 }
        reveal_effect { draw 1 }
        action_effect { draw 1 }
      end
    }
  end

  describe '#build' do
    let(:evaluator) do
      RedSands::Cards::MarketCardEvaluator.new.tap { |e| e.instance_eval(&dsl) }
    end
    let(:subject) { evaluator.cards.first }

    its(:class) { is_expected.to eq(RedSands::Cards::MarketCard) }
    its(:name) { is_expected.to eq('Test Card') }
    its(:power_cost) { is_expected.to eq(3) }
    its(:factions) { is_expected.to eq([RedSands::Faction::Empire, RedSands::Faction::Magic]) }
    its(:sectors) { is_expected.to eq([RedSands::Sector::Uninhabited, RedSands::Sector::Alchemist]) }
    its(:buy_effect) { is_expected.to be_a(RedSands::Effect) }
    its(:reveal_effect) { is_expected.to be_a(RedSands::Effect) }
    its(:action_effect) { is_expected.to be_a(RedSands::Effect) }
  end
end
