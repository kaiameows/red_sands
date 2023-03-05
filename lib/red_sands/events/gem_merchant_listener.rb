# typed: false
# frozen_string_literal: true

module RedSands
  module Events
    # GemMerchantListener is a listener for the 'Gem Merchant' card
    class GemMerchantListener < RedSands::Events::BaseListener
      def after_worker_move(player:, _worker:, location:, card:)
        return unless card.name == 'Gem Merchant' && location.sector.name == 'Uninhabited Sector'

        # player gains double the gems from the tile they just moved to
        broadcast(:gain_resources, player:, resources: location.resources)
      end
    end
  end
end
