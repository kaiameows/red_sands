# typed: false
# frozen_string_literal: true

module RedSands
  # Events is a module that contains all game events
  module Events
    def self.event(name, *args, hooks: true)
      if hooks
        ["Before#{name}", "After#{name}"].each do |klass|
          const_set(klass, Data.define(*args))
        end
      end
      const_set(name, Data.define(*args))
    end
    %w[GameStart GameEnd Turn
       DrawPhase ActionPhase TournamentPhase ResolutionPhase EndgamePhase].each(&method(:event))
    event 'WorkerMove', *%i[player worker location card]
    event 'GainResouces', *%i[player resources]
    event 'GainCouncilSeat', :player, hooks: false
    event 'GainSecretPower', *%i[player count], hooks: false
    event 'GainInfluence', *%i[player faction count]
    event 'DrawCard', *%i[player count], hooks: false
    event 'DiscardCard', *%i[player count], hooks: false
    event 'ExileCard', *%i[player card], hooks: false
    event 'WinGame', :player, hooks: false
    event 'ChooseLeader', :player
  end
end
