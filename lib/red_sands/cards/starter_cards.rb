# frozen_string_literal: true

module RedSands
  module Cards
    # StarterCards are the cards that are dealt to players at the start of the game
    StarterCards = CardEvaluator.new.tap do |evaluator|
      evaluator.instance_eval do
        card 'Stroke of Fortune' do
          action_effect { exile this_card }
          sectors %w[Empire Magic Guild Warrior]
        end

        card 'Emissary' do
          sectors %w[Empire Magic Guild Warrior]
        end

        card 'Trigger' do
          sectors ['Hall of Heroes', 'Inhabited Sector', 'Uninhabited Sector']
          action_effect { trigger_leader_power }
        end

        card 'Friends in Low Places' do
          sectors ['Uninhabited Sector']
          reveal_effect { gain power: 1 }
        end

        card 'Undue Influence', count: 2 do
          reveal_effect { gain power: 2 }
        end

        card 'Assault', count: 2 do
          sectors ['Hall of Heroes']
          reveal_effect { gain combat_power: 1 }
        end

        card 'Into the Wild', count: 2 do
          sectors ['Uninhabited Sector']
          reveal_effect { gain power: 1 }
        end
      end
    end.build
  end
end
