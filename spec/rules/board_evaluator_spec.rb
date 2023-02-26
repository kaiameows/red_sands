# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Rules::BoardEvaluator do
  let(:dsl) do
    -> (_) {
      sector 'Meow' do
        location 'Meowville' do
          cost gems: 6
          gain troops: 3, food: 2
          combat_zone
        end
        alliance_bonus troops: 2
        location 'Dogtown' do
          gain secret_power: 1, money: 5, troops: 2
        end
      end
    }
  end

  before { subject.instance_eval(&dsl) }

  it 'uses the sector evaluator' do
    expect(subject.sectors.size).to eq(1)
  end

  it 'processes sectors into sector objects' do
    expect(subject.sectors.first).to be_a(RedSands::Sector)
  end

  context 'creating diplomatic sectors' do
    let(:dsl) do
      -> (_) {
        diplomatic_sector 'Meow' do
          location 'Meowville' do
            cost gems: 6
            gain troops: 3, food: 2
            combat_zone
          end
          alliance_bonus troops: 2
          location 'Dogtown' do
            gain secret_power: 1, money: 5, troops: 2
          end
        end
      }
    end

    it 'sets the diplomatic flag' do
      expect(subject.sectors.first.diplomatic?).to be true
    end
  end

  context 'creating planetary sectors' do
    let(:dsl) do
      -> (_) {
        planet_sector 'Meow' do
          location 'Meowville' do
            cost gems: 6
            gain troops: 3, food: 2
            combat_zone
          end
          alliance_bonus troops: 2
          location 'Dogtown' do
            gain secret_power: 1, money: 5, troops: 2
          end
        end
      }
    end

    it 'sets the planetary flag' do
      expect(subject.sectors.first.planet?).to be true
    end
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
