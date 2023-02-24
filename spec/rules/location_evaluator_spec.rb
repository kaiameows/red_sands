# frozen_string_literal: true

RSpec.describe RedSands::Rules::LocationEvaluator do
  let(:dsl) do
    -> (_) {
      name 'Meowville'
      cost gems: 6
      resources 3, 2
      combat_zone
      effect do
        meow
      end
    }
  end
  let(:subject) { described_class.new('Warrior') }

  before do
    subject.instance_eval(&dsl)
  end

  it 'interprets single-value attributes' do
    expect(subject.attributes[:cost]).to eq(gems: 6)
  end

  it 'interprets multi-value attributes' do
    expect(subject.attributes[:resources]).to eq([3,2])
  end

  it 'interprets boolean attributes' do
    expect(subject.attributes[:combat_zone]).to be true
  end

  it 'saves effects as blocks' do
    expect(subject.attributes[:effect]).to be_a(Proc)
  end
  context 'building location objects' do
    let(:location) { subject.build }
    it 'sets the cost' do
      expect(location.cost).to eq(gems: 6)
    end

    it 'sets the resources' do
      expect(location.resources).to eq([3,2])
    end

    it 'sets the combat zone flag' do
      expect(location.combat_zone?).to be true
    end

    it 'sets the effect' do
      expect(location.effect).to be_a(Proc)
    end
  end
end
