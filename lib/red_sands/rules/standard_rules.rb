# frozen_string_literal: true

RedSands::Rules::RuleSet.define 'Standard' do
  board 'StandardBoard' do
    diplomatic_sector 'Empire' do
      alliance_bonus troops: 2
      location 'Diplomatic Coup' do
        cost gems: 4
        gain secret_power: 1, money: 5, troops: 2
      end
      location('Diplomatic Mission') { gain money: 2 }
    end
    diplomatic_sector 'Guild' do
      alliance_bonus money: 2
      location 'Guild Hall' do
        cost gems: 6
        gain troops: 5, food: 2
        combat_zone
      end
      location 'Guild Meeting' do
        gain travel_pass: 1
      end
    end
    diplomatic_sector 'Magic' do
      alliance_bonus secret_power: 1
      location 'Magic Academy' do
        cost gems: 2
        unless player.hand.empty?
          choice do
            option 'Discard 1 card to draw 2 cards' do
              discard 1
              draw 2, from: :main_deck
            end
            option do_nothing
          end
        end
      end
      location 'Magic Shop' do
        gain secret_power: 1
        four_or_more = opponents.select { |p| p.secret_powers.count >= 4 }
        if four_or_more.any?
          choice do
            four_or_more.each do |opponent|
              option "Take 1 secret power from #{opponent.name}" do
                opponent.secret_powers.shuffle.take 1 
              end
            end
            option do_nothing
          end
        end
      end
    end
    diplomatic_sector 'Warrior' do
      alliance_bonus food: 2
      location 'Warrior Barracks' do
        cost food: 1
        gain troops: 2
        combat_zone
      end
      location 'Warrior Training' do
        gain food: 1
        combat_zone
      end
    end
    sector 'Hall of Heroes' do
      location 'High Council' do
        cost money: 5
        gain :high_council_seat
      end
      location 'Assassin' do
        cost money: 8
        gain :assassin
      end
      location 'Hired Gun' do
        cost money: 2
        gain :hired_gun
        draw 1, from: :main_deck
      end
      location 'Hire Mercenaries' do
        cost money: 4
        gain troops: 4
      end
      location 'Public Square' do
        gain troops: 1, power: 1
      end
    end
    sector 'Smugglers' do
      location 'Extortion' do
        effect { money 3 }
      end
      location 'Sell Gems' do
        cost { gems 2 }
        effect "sell 2 or more gems for money" do
          [6,8,10,12].each_with_index do |profit, additional_gems|
            option "Sell #{2 + additional_gems} gems for #{profit} money" do
              cost { gems 2 + additional_gems }
              effect { money profit }
            end
          end
        end
      end
    end
    planet_sector 'Inhabited' do
      location 'Farmlands' do
        requirement { faction_influence 'Warrior', 2 }
        effect { food 1; troops 1 }
      end
      location 'Tech Center' do
        cost { food 2 }
        effect { draw 3, from: :main_deck }
      end
      location 'Mystic Ruins' do
        effect { troops 1; secret_power 1 }
      end
      location 'Trading Post' do
        effect { troops 1; draw 1, from: :main_deck }
      end
    end
    planet_sector 'Uninhabited' do
      location 'Anvil of the Gods' do
        cost { food 2 }
        effect { gems 3 + accumulated_gems }
        gem_accumulator
      end
      location 'Crystal Caves' do
        cost { food 1 }
        effect { gems 2 + accumulated_gems }
        gem_accumulator
      end
      location 'Dark Forest' do
        effect { gems 1 + accumulated_gems }
        gem_accumulator
      end
    end
  end
  standard_cards
end
