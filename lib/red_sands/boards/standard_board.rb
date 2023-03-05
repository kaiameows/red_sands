# typed: false
# frozen_string_literal: true

module RedSands
  # rubocop:disable Metrics/ModuleLength
  module Boards
    # NOTE: this is a constant, not a class
    StandardBoard = RedSands::Rules::BoardEvaluator.new.tap do |evaluator|
      evaluator.instance_eval do
        diplomatic_sector 'Empire' do
          alliance_bonus troops: 2
          location 'Diplomatic Coup' do
            cost gems: 4
            resources treasure: 1, money: 5, troops: 2
          end
          location 'Diplomatic Mission' do
            resources money: 2
          end
        end
        diplomatic_sector 'Guild' do
          alliance_bonus money: 2
          location 'Guild Hall' do
            cost gems: 6
            resources troops: 5, food: 2
            combat_zone
          end
          location 'Guild Meeting' do
            resources travel_pass: 1
          end
        end
        diplomatic_sector 'Magic' do
          alliance_bonus treasure: 1
          location 'Magic Academy' do
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
          location 'Magic Shop' do
            resources treasure: 1
            effect 'Take a treasure from an opponent who has four or more treasures' do
              four_or_more = opponents.select { |p| p.treasures.count >= 4 }
              if four_or_more.any?
                choice do
                  four_or_more.each do |opponent|
                    option "Take 1 treasure from #{opponent.name}" do
                      opponent.treasures.shuffle.take 1
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
          location 'Warrior Barracks' do
            cost food: 1
            resources troops: 2
            combat_zone
          end
          location 'Warrior Training' do
            resources food: 1
            combat_zone
          end
        end
        sector 'Hall of Heroes' do
          location 'High Council' do
            cost money: 5
            resources :high_council_seat
          end
          location 'Assassin' do
            cost money: 8
            resources :assassin
          end
          location 'Hired Gun' do
            cost money: 2
            resources :hired_gun
            draw 1, from: :main_deck
          end
          location 'Hire Mercenaries' do
            cost money: 4
            resources troops: 4
          end
          location 'Public Square' do
            resources troops: 1, power: 1
          end
        end
        sector 'Smugglers' do
          location 'Extortion' do
            resources money: 3
          end
          location 'Sell Gems' do
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
          location 'Farmlands' do
            requirement { player.diplomatic_progress['Warriors'] >= 2 }
            resources food: 1, troops: 1
          end
          location 'Tech Center' do
            cost food: 2
            effect { player.draw 3, from: :main_deck }
          end
          location 'Mystic Ruins' do
            resources troops: 1, treasure: 1
          end
          location 'Trading Post' do
            resources troops: 1
            effect { player.draw 1, from: :main_deck }
          end
        end
        planet_sector 'Uninhabited' do
          location 'Anvil of the Gods' do
            cost food: 2
            effect { player.resources[:gems] += 3 + board.location('Anvil of the Gods').accumulated_gems }
            gem_accumulator
          end
          location 'Crystal Caves' do
            cost food: 1
            effect { player.resources[:gems] += 2 + board.location('Crystal Caves').accumulated_gems }
            gem_accumulator
          end
          location 'Dark Forest' do
            effect { player.resources[:gems] += 1 + board.location('Dark Forest').accumulated_gems }
            gem_accumulator
          end
        end
      end
    end.build
  end
  # rubocop:enable Metrics/ModuleLength
end
