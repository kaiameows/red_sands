# frozen_string_literal: true

RSpec.describe RedSands::Events do
  describe 'event classes' do
    it 'has a lot of event classes' do
      classes = %w[
        BeforeGameStart
        GameStart
        AfterGameStart
        BeforeGameEnd
        GameEnd
        AfterGameEnd
        BeforeTurn
        Turn
        AfterTurn
        BeforeDrawPhase
        DrawPhase
        AfterDrawPhase
        BeforeActionPhase
        ActionPhase
        AfterActionPhase
        BeforeTournamentPhase
        TournamentPhase
        AfterTournamentPhase
        BeforeResolutionPhase
        ResolutionPhase
        AfterResolutionPhase
        BeforeEndgamePhase
        EndgamePhase
        AfterEndgamePhase
        BeforeWorkerMove
        WorkerMove
        AfterWorkerMove
        BeforeGainResouces
        GainResouces
        AfterGainResouces
        GainCouncilSeat
        GainSecretPower
        BeforeGainInfluence
        GainInfluence
        AfterGainInfluence
        DrawCard
        DiscardCard
        ExileCard
        WinGame
      ]
      expect(classes - RedSands::Events.constants.map(&:to_s)).to be_empty
    end
  end
end
