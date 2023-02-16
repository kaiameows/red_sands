# frozen_string_literal: true

module RedSands
  module Events
    class GatherResources < Ma::Event
      attr_reader :player, :location, :resources

      def initialize(player:, location:, resources:)
        @player = player
        @location = location
        @resources = resources
      end
    end

    class PayLocationCost < Ma::Event
      attr_reader :player, :location, :cost
      def initialize(player:, location:, cost:)
        @player = player
        @location = location
        @cost = cost
      end
    end

    class BeforeAvatarMove < Ma::Event
      attr_reader :player, :location, :avatar
      def initialize(player:, location:, avatar:)
        @player = player
        @location = location
        @avatar = avatar
      end
    end

    class AfterAvatarMove < Ma::Event
      attr_reader :player, :location, :avatar
      def initialize(player:, location:, avatar:)
        @player = player
        @location = location
        @avatar = avatar
      end
    end

    class AfterGatherResources < Ma::Event
      attr_reader :player, :location, :resources
      def initialize(player:, location:, resources:)
        @player = player
        @location = location
        @resources = resources
      end
    end
  end
end
