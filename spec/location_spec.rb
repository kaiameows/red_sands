# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Location do
  let(:location) { RedSands::Location.new(name: 'name', sector: RedSands::Sector::Warrior) }

  it 'has a name' do
    expect(location.name).to eq('name')
  end

  it 'has a sector' do
    expect(location.sector).to eq(RedSands::Sector::Warrior)
  end

  it 'has resources' do
    expect(location.resources).to eq(nil)
  end

  it 'has a cost' do
    expect(location.cost).to eq(RedSands::Resources.none)
  end

  it 'has an effect' do
    expect(location.effect).to eq(nil)
  end
end
