# frozen_string_literal: true

module RedSands
  module Events
    # at the moment I don't feel like checking arguments for events
    class GatherResources < RedSands::Events::GameEvent; end
    class AfterGatherResources < RedSands::Events::GameEvent; end

    class PayLocationCost < RedSands::Events::GameEvent; end

    class BeforeAvatarMove < RedSands::Events::GameEvent; end

    class AfterAvatarMove < RedSands::Events::GameEvent; end
  end
end
