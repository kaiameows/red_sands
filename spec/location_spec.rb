# frozen_string_literal: true

RSpec.describe RedSands::Location do
  let(:location) { RedSands::Location.new('name', 'sector') }

  it 'has a name' do
    expect(location.name).to eq('name')
  end

  it 'has a sector' do
    expect(location.sector).to eq('sector')
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

  it 'can gather resources' do
    player = double('player')
    expect(player).to receive(:add_resources).with({})
    location.gather_resources(player)
  end

  it 'can pay cost' do
    player = double('player')
    expect(player).to receive(:remove_resources).with({})
    location.pay_cost(player)
  end

  it 'can be occupied' do
    expect(location).not_to be_occupied
  end
end
