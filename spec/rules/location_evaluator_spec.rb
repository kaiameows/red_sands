# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Rules::LocationEvaluator do
  let(:dsl) do
    -> (_) {
      name 'Meowville'
      cost gems: 6
      squiggle 3, 2
      combat_zone
      effect 'meow!' do
        meow
      end
    }
  end
  let(:subject) { described_class.new(sector: RedSands::Sector::Warrior) }

  before do
    subject.instance_eval(&dsl)
  end

  it 'interprets single-value attributes' do
    expect(subject.attributes[:cost]).to eq(RedSands::Resources.new(gems: 6))
  end

  it 'interprets multi-value attributes' do
    expect(subject.attributes[:squiggle]).to eq([3, 2])
  end

  it 'interprets boolean attributes' do
    expect(subject.attributes[:combat_zone]).to be true
  end

  it 'saves effects as Effects' do
    expect(subject.attributes[:effect]).to be_a(RedSands::Effect)
  end
  context 'building location objects' do
    let(:dsl) do
      -> (_) {
        name 'Meowville'
        cost gems: 6
        resources money: 3, food: 2
        combat_zone
        effect 'draw 2 cards' do
          choice do
            option 'draw 2 cards' do
              draw 2
            end
            option do_nothing
          end
        end
      }
    end
    let(:location) { subject.build }
    it 'sets the cost' do
      expect(location.cost).to eq(RedSands::Resources.new(gems: 6))
    end

    it 'sets the resources' do
      expect(location.resources).to be_a(RedSands::Effect)
    end

    it 'sets the combat zone flag' do
      expect(location.combat_zone?).to be true
    end

    it 'sets the effect' do
      expect(location.effect).to be_a(RedSands::Effect)
    end
  end
end
