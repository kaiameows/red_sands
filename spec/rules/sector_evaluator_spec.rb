# frozen_string_literal: true

RSpec.describe RedSands::Rules::SectorEvaluator do
  let(:dsl) do
    -> (_) {
      location 'Meowville' do
        cost gems: 6
        gain troops: 3, food: 2
        combat_zone
      end
      alliance_bonus troops: 2
      location 'Dogtown' do
        gain secret_power: 1, money: 5, troops: 2
      end
    }
  end

  before { subject.instance_eval(&dsl) }

  it 'uses the location evaluator' do
    expect(subject.locations.size).to eq(2)
  end

  it 'contains attributes from the child evaluator' do
    expect(subject.locations['Meowville'][:cost]).to eq([gems: 6])
  end
end