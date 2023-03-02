# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Cards::BaseCard do
  let(:card) { RedSands::Cards::BaseCard.new(name: 'Test Card') }

  it 'has a name' do
    expect(card.name).to eq('Test Card')
  end
end
