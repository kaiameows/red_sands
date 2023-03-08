# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Rules::BoardEvaluator do
  let(:dsl) do
    -> (_) {
      sector RedSands::Sector::Alchemist do
        location 'Meowville' do
          cost gems: 6
          gain troops: 3, food: 2
          combat_zone
        end
        alliance_bonus troops: 2
        location 'Dogtown' do
          gain treasure: 1, money: 5, troops: 2
        end
      end
    }
  end

  before { subject.instance_eval(&dsl) }

  it 'sets all of the locations sectors appropriately' do
    expect(subject.locations.map(&:sector)).to all(eq(RedSands::Sector::Alchemist))
  end

  context 'building board objects' do
    let(:board) do
      subject.attributes[:name] = 'Bored'
      subject.build
    end
    it 'sets the sectors' do
      expect(board.sectors.size).to eq(1)
    end
  end
end
