# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Rules::LeaderEvaluator do
  let(:dsl) do
    -> (_) do
      active_power 'gain 1 secret power for 1 money' do
        cost money: 1
        effect { player.draw 1, from: :secret_powers }
      end
      passive_power 'when you gain gems, gain 1 fewer and draw a card' do
        def after_worker_move(player:, _worker:, location:, _card:)
          if player == self && location.sector == 'Uninhabited Sector'
            cost gems: 1
            draw 1
          end
        end
      end
    end
  end

  it 'assigns attributes' do
    subject.instance_eval(&dsl)
    expect(subject.attributes).to include(
      active_power: an_instance_of(RedSands::LeaderPower),
      passive_power: an_instance_of(Proc)
    )
  end

  describe '#build' do
    subject do
      described_class.new.tap do |evaluator|
        evaluator.instance_eval(&dsl)
        evaluator.name 'Leader'
      end.build
    end

    it 'builds a leader' do
      expect(subject).to be_a(RedSands::Leader)
    end

    it 'assigns attributes' do
      expect(subject.name).to eq('Leader')
      expect(subject.active_power).to be_a(RedSands::LeaderPower)
      expect(subject.passive_power_description).to eq('when you gain gems, gain 1 fewer and draw a card')
    end

    it "evaluates the passive power in the player's eigenclass" do
      expect(subject.singleton_class.instance_methods).to include(:after_worker_move)
    end
  end
end
