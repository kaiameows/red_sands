# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Cards::CardEvaluator do
  let(:dsl) do
    -> (_) {
      card('Test Card') { }
      card('Test Card 2', count: 2) { }
    }
  end

  describe '#build' do
    let(:evaluator) do
      RedSands::Rules::RuleFactory.new.tap { |e| e.name 'Test Card' }
    end

    it 'creates a base card' do
      expect(subject.build(evaluator)).to be_a(RedSands::Cards::BaseCard)
    end

    it 'sets the name' do
      expect(subject.build(evaluator).name).to eq('Test Card')
    end
  end

  describe '#card' do
    it 'adds a card to the deck' do
      expect(subject.tap { |s| s.instance_eval(&dsl) }.cards.count).to eq(3)
    end

    it 'sets the name' do
      expect(subject.tap { |s| s.instance_eval(&dsl) }.cards.first.name).to eq('Test Card')
    end
  end
end
