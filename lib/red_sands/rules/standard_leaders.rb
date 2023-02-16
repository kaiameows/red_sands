# frozen_string_literal: true

ruleset = RedSands::Rules::RuleSet['Standard']
ruleset.define_leader 'Emperor Alrazar' do
  active_power do
    cost money: 1
    gain secret_power: 1
  end
  passive_power do
    on(BeforeGameStart) do
      choice 'Pick two factions to ally with' do
        ruleset.board.diplomatic_sectors.each do |sector|
          option(sector.name) { sector.flag(:emperor_ally) }
        end
      end
    end
  end
end

ruleset.define_leader 'The Guildmaster' do
  active_power { gain player.alliances.any? ? { troops: 1 } : { troops: 2 } }
  on(BeforeGameStart) { gain gems: 1, money: 1 }
end

ruleset.define_leader 'Lord Kharadros' do
  active_power do # action, needs unique power card in hand
    precondition do
      zeroes = board.sectors.map(&:name).product([0]).to_h
      maximums = opponents.map(&:diplomatic_progress).reduce(zeroes) do |memo, progress|
        memo.merge(progress) { |_, a, b| [a, b].max }
      end
      player.diplomatic_progress.select { |k, v| v < maximums[k] }.any?
    end
    cost gems: 1
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
  passive_power do
    define_method(:available_moves) do
      super.map do |move|
        if move.sector == 'Hall of Heroes' && move.cost.money.positive?
          move.dup.tap { |m| m.cost.money -= 1 }
        else
          move
        end
      end
    end
  end
end

ruleset.define_leader 'Prophet Bulus' do
  active_power { draw 1 }
  passive_power do
    define_method(:actions) do
      super << look_at_top_of_deck
    end
  end
end

ruleset.define_leader 'General Kael' do
  active_power { gain gems: 1 }
  passive_power do
    on(GainCouncilSeat) do |event|
      choice 'Choose a faction to increase your diplomatic progress with' do
        ruleset.board.sectors.each do |sector|
          option sector.name do
            event.game_state.player.diplomatic_progress[sector.name] += 1
          end
        end
      end
    end
  end
end

ruleset.define_leader 'Estrella Marcos' do
  active_power { gain food: 1 }
  passive_power do
    on(AfterAvatarMove) do |event|
      if event.avatar.player == self && event.move.sector == 'Uninhabited Sector'
        cost gems: 1
        draw 1
      end
    end
  end
end

ruleset.define_leader 'Enigmatron' do
  active_power do
    choice 'Choose a purchaseable card and set it aside. You may purchase in the Buy Phase for 1 less money' do
      game_state.market.each do |card|
        option card.name do
          reserve_market_card(card.dup.tap { |c| c.cost.power -= 1 })
          game_state.market.delete(card)
        end
      end
    end
  end
  passive_power do
    define_method(:available_moves) do
      super & board.sectors.select { |s| ['Hall of Heroes', 'Inhabited Sector'].include?(s.name) }.flat_map(&:locations)
    end

    define_method(:actions) do
      super.tap do |actions|
        actions << buy_reserved_card if reserved_market_card?
      end
    end

    define_method(:buy_reserved_card) do
      RedSands::Actions::BuyReservedCard.new(player: self)
    end

    define_method(:reserved_market_card?) do
      !reserved_market_card.nil?
    end

    define_method(:reserved_market_card) do
      @reserved_market_card
    end
  end
end
