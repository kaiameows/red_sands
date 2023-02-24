# frozen_string_literal: true

module RedSands
  module Cards
    StandardBuyableCards = RedSands::Cards::CardEvaluator.new.tap do |evaluator|
      evaluator.instance_eval do
        card 'Lady DeLys' do
          power_cost 7
          faction 'Magic'
          sectors ['Magic', 'Inhabited Sector', 'Uninhabited Sector', 'Hall of Heroes']
          action_effect('draw 2') { draw 2 }
          reveal_effect('gain 3 power and 1 combat power') { gain power: 3, combat_power: 1 }
          buy_effect('gain 1 influence') { gain influence: 1 }
        end

        card 'Janissary Corps', count: 2 do
          power_cost 2
          sectors ['Inhabited Sector']
          action_effect { gain troops: 1 }
          reveal_effect { gain power: 1, combat_power: 1 }
        end

        card 'Hidden Cache', count: 2 do
          power_cost 2
          reveal_effect { gain money: 1, combat_power: 1 }
        end

        card 'Sorcerer\'s Apprentice', count: 2 do
          power_cost 3
          faction 'Magic'
          sectors ['Inhabited Sector', 'Uninhabited Sector', 'Hall of Heroes']
          action_effect { draw 1 }
          reveal_effect { gain power: 1 }
        end

        card 'Sorceress', count: 3 do
          power_cost 3
          faction 'Magic'
          sectors ['Magic', 'Hall of Heroes']
          reveal_effect do
            choice 'Choose one: gain 2 power or gain 2 combat power' do
              %i[power combat_power].each do |type|
                option("Gain 2 #{type}") { gain type => 2 }
              end
            end
          end
        end

        card 'Gem Merchant' do
          power_cost 5
          sectors ['Uninhabited Sector']
          # action effect: see events/gem_merchant_listener.rb
          reveal_effect { gain power: 1, gems: 1 }
        end

        card 'Disciple of the Flame' do
          power_cost 5
          buy_effect { gain food: 1 }
          faction 'Warrior'
          sectors ['Warrior', 'Inhabited Sector', 'Uninhabited Sector']
          reveal_effect do
            choice 'Retreat any number of troops' do
              player.active_troops.times do |i|
                option("Retreat #{i + 1} troops") do
                  broadcast(RedSands::Events::RetreatTroops.new(player:, troops: i + 1))
                end
              end
            end
          end
        end

        card 'Lord Commander' do
          power_cost 8
          buy_effect do
            %w[Empire Guild Magic Warrior].each do |faction|
              gain influence: 1, faction: faction
            end
          end
          reveal_effect { gain money: 3 }
        end
      end
    end.build
  end
end
