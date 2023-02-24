# frozen_string_literal: true

module RedSands
  module Events
    # GemMerchantListener is a listener for the 'Gem Merchant' card
    class GemMerchantListener < RedSands::Events::BaseListener
      on(AfterWorkerMove) do |event|
        if event.card.name == 'Gem Merchant' && event.sector.name == 'Uninhabited Sector'
          # player gains double the gems from the tile they just moved to
          broadcast(
            RedSands::Events::PlayerGainResources.new(player: event.player, resources: event.location.resources)
          )
        end
      end
    end
  end
end
