# frozen_string_literal: true

# I should actually document the DSL files
# leaders have names, active powers, and passive powers
# active powers are triggered by the player's unique power card
# the passive power block is just evaluated in the context of the player instance when the leader is chosen
# it's not a particularly clean way to do things, but it enables arbitrary changes to the player class when the leader is chosen

module RedSands
  # rubocop:disable Metrics/ModuleLength
  module Rules
    StandardLeaders = LeaderCollectionEvaluator.new.tap do |evaluator|
      evaluator.instance_eval do
        leader 'Emperor Alrazar' do
          active_power 'Pay 1 money to gain 1 secret power' do
            cost money: 1
            effect { player.draw 1, from: :secret_powers }
          end
          passive_power 'Secret alliance with two factions' do
            def on_before_game_start
              super
              choice 'Pick two factions to ally with' do
                game_state.board.diplomatic_sectors.each do |sector|
                  option(sector.name) { sector.flag(:emperor_ally) }
                end
              end
            end
          end
        end

        leader 'The Guildmaster' do
          active_power 'Gain one troop. If you have any alliances, gain 2 troops instead' do
            effect do
              player.add_resources player.alliances.any? ? { troops: 1 } : { troops: 2 }
            end
          end
          passive_power 'Start the game with 1 extra gem and 1 extra money' do
            on(RedSands::Events::BeforeGameStart) { gain gems: 1, money: 1 }
          end
        end

        leader 'Lord Kharadros' do
          active_power 'Gain 1 influence with a faction where an opponent has more influence' do # action, needs unique power card in hand
            precondition do # is this actually a precondition or does it just noop if it's not true?
              zeroes = board.sectors.map(&:name).product([0]).to_h
              maximums = opponents.map(&:diplomatic_progress).reduce(zeroes) do |memo, progress|
                memo.merge(progress) { |_, a, b| [a, b].max }
              end
              player.diplomatic_progress.select { |k, v| v < maximums[k] }.any?
            end
            cost gems: 1
            effect do
              # one wonders if all of these active powers should be events
              # they need to be evaluated in the game context anyway
              # are events actions?
              choice 'Choose a faction to increase your diplomatic progress with' do
                zeroes = board.sectors.map(&:name).product([0]).to_h
                maximums = opponents.map(&:diplomatic_progress).reduce(zeroes) do |memo, progress|
                  memo.merge(progress) { |_, a, b| [a, b].max }
                end
                player.diplomatic_progress.select { |k, v| v < maximums[k] }.each do |sector, _|
                  option sector do
                    player.diplomatic_progress[sector] += 1
                  end
                end
              end
            end
          end
          passive_power 'Locations in the Hall of Heroes cost 1 less money' do
            def available_moves
              super.dup.tap do |moves|
                moves['Hall of Heroes'].map! { |move| move.dup.tap { |m| m.cost.money -= 1 } }
              end
            end
          end
        end

        leader 'Prophet Bulus' do
          active_power('draw a card') { effect { draw 1 } }
          passive_power 'look at the top card of your deck at any time' do
            def available_actions
              super << RedSands::Actions::LookAtTopCard.new(player: self)
            end
          end
        end

        leader 'General Kael' do
          active_power('gain 1 gems') { effect { gain gems: 1 } }
          passive_power 'when you gain a Council seat, choose a faction to increase your diplomatic progress with' do
            on(RedSands::Events::GainCouncilSeat) do
              choice 'Choose a faction to increase your diplomatic progress with' do
                board.sectors.each do |sector|
                  option sector.name do
                    broadcast(RedSands::Events::GainDiplomaticProgress.new(player:, sector:, amount: 1))
                  end
                end
              end
            end
          end
        end

        leader 'Estrella Marcos' do
          active_power('Gain 1 food') { effect { gain food: 1 } }
          passive_power 'If you gather gems from any Uninhabited Sector location, gain 1 fewer and draw a card' do
            on(RedSands::Events::AfterWorkerMove) do
              if player == self && event.move.sector == 'Uninhabited Sector'
                cost gems: 1
                draw 1
              end
            end
          end
        end

        leader 'Enigmatron' do
          active_power 'Choose a purchaseable card and set it aside. ' \
                       'You may purchase in the Buy Phase for 1 less money' do
            effect do
              choice 'Choose a purchaseable card and set it aside. ' \
                     'You may purchase in the Buy Phase for 1 less money' do
                market.each do |card|
                  option card.name do
                    reserve_market_card(card.dup.tap { |c| c.cost.power -= 1 })
                    market.delete(card)
                    game_state.market.push(game_state.decks[:market].draw)
                    # probably shouldn't broadcast this?
                    # it's not technically buying the card, so I don't know that there's any other events that would be triggered
                  end
                end
              end
            end
          end
          passive_power 'Enemy workers do not block your movement in the Hall of Heroes or Inhabited Sector' do
            def available_moves
              super.tap do |moves|
                ['Hall of Heroes', 'Inhabited Sector'].each do |sector|
                  moves[sector] = board.sectors.find { |s| s.name == sector }
                end
              end
            end

            def actions
              super.tap do |actions|
                actions << buy_reserved_card if buy_phase? && reserved_market_card?
              end
            end

            def buy_reserved_card
              RedSands::Actions::BuyReservedCard.new(player: self)
            end

            def reserved_market_card? = @reserved_market_card.present?

            def reserved_market_card = @reserved_market_card
          end
        end
        leader 'Spymaster Vex' do
          active_power 'Gain 1 money' do
            effect { gain money: 1 }
          end
          passive_power 'Whenever you pay money to move to a location, draw a card' do
            on(RedSands::Events::AfterWorkerMove) do
              draw 1 if player == self && event.move.cost.money.positive?
            end
          end
        end
      end
    end.build
  end
  # rubocop:enable Metrics/ModuleLength
end
