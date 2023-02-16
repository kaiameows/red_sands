# frozen_string_literal: true

module RedSands
  # rubocop:disable Metrics/ModuleLength
  module Boards
    StandardBoard = RedSands::Rules::BoardEvaluator.new.instance_eval do
      diplomatic_sector 'Empire' do
        alliance_bonus troops: 2
        location do
          name 'Diplomatic Coup'
          cost gems: 4
          resources secret_power: 1, money: 5, troops: 2
        end
        location do
          name 'Diplomatic Mission'
          resources money: 2
        end
      end
      diplomatic_sector 'Guild' do
        alliance_bonus money: 2
        location do
          name 'Guild Hall'
          cost gems: 6
          resources troops: 5, food: 2
          combat_zone
        end
        location do
          name 'Guild Meeting'
          resources travel_pass: 1
        end
      end
      diplomatic_sector 'Magic' do
        alliance_bonus secret_power: 1
        location do
          name 'Magic Academy'
          cost gems: 2
          effect 'Discard 1 card to draw 2 cards' do
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
        end
        location do
          name 'Magic Shop'
          resources secret_power: 1
          effect 'Take a secret power from an opponent who has four or more secret powers' do
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
      end
      diplomatic_sector 'Warrior' do
        alliance_bonus food: 2
        location do
          name 'Warrior Barracks'
          cost food: 1
          resources troops: 2
          combat_zone
        end
        location do
          name 'Warrior Training'
          resources food: 1
          combat_zone
        end
      end
      sector 'Hall of Heroes' do
        location do
          name 'High Council'
          cost money: 5
          resources :high_council_seat
        end
        location do
          name 'Assassin'
          cost money: 8
          resources :assassin
        end
        location do
          name 'Hired Gun'
          cost money: 2
          resources :hired_gun
          draw 1, from: :main_deck
        end
        location do
          name 'Hire Mercenaries'
          cost money: 4
          resources troops: 4
        end
        location do
          name 'Public Square'
          resources troops: 1, power: 1
        end
      end
      sector 'Smugglers' do
        location do
          name 'Extortion'
          resources money: 3
        end
        location do
          name 'Sell Gems'
          cost gems: 2
          effect 'sell 2 or more gems for money' do
            [6, 8, 10, 12].each_with_index do |profit, additional_gems|
              option "Sell #{2 + additional_gems} gems for #{profit} money" do
                cost gems: 2 + additional_gems
                effect { player.resources[:money] += profit }
              end
            end
          end
        end
      end
      planet_sector 'Inhabited' do
        location do
          name 'Farmlands'
          requirement { player.diplomatic_progress['Warriors'] >= 2 }
          resources food: 1, troops: 1
        end
        location do
          name 'Tech Center'
          cost food: 2
          effect { player.draw 3, from: :main_deck }
        end
        location do
          name 'Mystic Ruins'
          resources troops: 1, secret_power: 1
        end
        location do
          name 'Trading Post'
          resources troops: 1
          effect { player.draw 1, from: :main_deck }
        end
      end
      planet_sector 'Uninhabited' do
        location do
          name 'Anvil of the Gods'
          cost food: 2
          effect { player.resources[:gems] += 3 + board.location('Anvil of the Gods').accumulated_gems }
          gem_accumulator
        end
        location do
          name 'Crystal Caves'
          cost food: 1
          effect { player.resources[:gems] += 2 + board.location('Crystal Caves').accumulated_gems }
          gem_accumulator
        end
        location do
          name 'Dark Forest'
          effect { player.resources[:gems] += 1 + board.location('Dark Forest').accumulated_gems }
          gem_accumulator
        end
      end
    end
  end
  # rubocop:enable Metrics/ModuleLength
end
