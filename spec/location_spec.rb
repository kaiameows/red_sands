# frozen_string_literal: true

RSpec.describe RedSands::Location do
  let(:location) { RedSands::Location.new(name: 'name', sector_name: 'Warrior') }

  it 'has a name' do
    expect(location.name).to eq('name')
  end

  it 'has a sector' do
    expect(location.sector_name).to eq('Warrior')
  end

  it 'has resources' do
    expect(location.resources).to eq({})
  end

  it 'has a cost' do
    expect(location.cost).to eq({})
  end

  it 'has agents' do
    expect(location.agents).to eq([])
  end

  it 'can be occupied' do
    expect(location.occupied?).to be false
  end
end
