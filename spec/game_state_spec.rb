# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::GameState do
  let(:players) { [double('player'), double('player')] }
  let(:subject) { described_class.new(players:) }
  context 'object history' do
    describe '.states' do
      before { described_class.clear }

      it 'is initially empty' do
        expect(described_class.states).to be_empty
      end

      it 'adds to the history when a new state is created' do
        described_class.new(players: [])
        expect(described_class.states.size).to eq(1)
      end
    end

    describe '.current' do
      before { described_class.clear }

      it 'is initially nil' do
        expect(described_class.current).to be_nil
      end

      it 'is the last state added' do
        described_class.new(players: [])
        expect(described_class.current).to eq(described_class.states.last)
      end
    end

    describe 'rewind' do
      context 'without arguments' do
        before { described_class.clear }

        it 'removes the last state' do
          described_class.new(players: [])
          described_class.new(players: [])
          described_class.rewind
          expect(described_class.states.size).to eq(1)
        end
      end

      context 'with an argument' do
        before { described_class.clear }

        it 'removes the last n states' do
          described_class.new(players: [])
          described_class.new(players: [])
          described_class.new(players: [])
          described_class.rewind(2)
          # binding.pry
          expect(described_class.states.size).to eq(1)
        end
      end
    end
  end

  context 'state machine' do
    context 'initial state' do
      its(:phase) { is_expected.to eq('setup') }
    end

    context 'events' do
      context 'before and after hooks' do
        it 'fires the before hook' do
          expect { subject.start }.to broadcast(:before_start)
        end

        it 'fires the after hook' do
          expect { subject.start }.to broadcast(:after_start)
        end

        it 'fires the event' do
          expect { subject.start }.to broadcast(:start)
        end
      end

      describe '#start' do
        it 'transitions from setup to draw' do
          expect { subject.start }.to change { subject.phase }.from('setup').to('draw')
        end
      end

      describe '#action_phase' do
        before { subject.phase = 'draw' }

        it 'transitions from draw to action' do
          expect { subject.action_phase }.to change { subject.phase }.from('draw').to('action')
        end
      end

      describe '#buy_phase' do
        before { subject.phase = 'action' }

        context 'before all players have used all their actions' do
          let(:players) do
            [double('player', done_with_actions?: false), double('player', done_with_actions?: false)]
          end
          it 'does not transition' do
            expect { subject.buy_phase }.not_to(change { subject.phase })
          end
        end
        context 'after all players have used all their actions' do
          let(:players) do
            [double('player', done_with_actions?: true), double('player', done_with_actions?: true)]
          end
          it 'transitions from action to buy' do
            expect { subject.buy_phase }.to change { subject.phase }.from('action').to('buy')
          end
        end
      end

      describe '#tournament_phase' do
        before { subject.phase = 'buy' }
        context 'players have not completed their buy phase' do
          let(:players) do
            [double('player', done_with_buys?: false), double('player', done_with_buys?: false)]
          end

          it 'does not transition' do
            expect { subject.tournament_phase }.not_to(change { subject.phase })
          end
        end

        context 'players have completed their buy phase' do
          let(:methods) { { done_with_buys?: true, active_troops: [] } }
          let(:players) do
            [double('player', **methods), double('player', **methods)]
          end
          context 'and there are no active troops' do
            it 'transitions from buy to resolution' do
              expect { subject.tournament_phase }.to change { subject.phase }.from('buy').to('resolution')
            end
          end
          context 'and there are active troops' do
            let(:troops) { [double('troop', active?: true), double('troop', active?: true)] }
            let(:methods) { { done_with_buys?: true, active_troops: troops } }
            before do
              subject.players.each do |player|
                allow(player).to receive(:active_troops).and_return([double('troop')])
              end
            end
            it 'transitions from buy to tournament' do
              expect { subject.tournament_phase }.to change { subject.phase }.from('buy').to('tournament')
            end
          end
        end
      end

      describe '#resolution_phase' do
        before { subject.phase = 'tournament' }
        context 'players have not completed their tournament phase' do
          let(:players) do
            [double('player', done_with_tournament?: false), double('player', done_with_tournament?: false)]
          end

          it 'does not transition' do
            expect { subject.resolution_phase }.not_to(change { subject.phase })
          end
        end

        context 'players have completed their tournament phase' do
          let(:players) do
            [double('player', done_with_tournament?: true), double('player', done_with_tournament?: true)]
          end
          it 'transitions from tournament to resolution' do
            expect { subject.resolution_phase }.to change { subject.phase }.from('tournament').to('resolution')
          end
        end
      end

      describe '#end_turn' do
        before { subject.phase = 'resolution' }
        context 'players do not have the requisite score'
        let(:players) do
          [double('player', score: 0), double('player', score: 0)]
        end

        context 'there are still cards in the tournament deck' do
          before do
            allow(subject.tournament_deck).to receive(:empty?).and_return(false)
          end

          it 'transitions from resolution to draw' do
            expect { subject.end_turn }.to change { subject.phase }.from('resolution').to('draw')
          end
        end

        context 'there are no cards in the tournament deck' do
          before do
            allow(subject.tournament_deck).to receive(:empty?).and_return(true)
          end

          it 'transitions from resolution to end' do
            expect { subject.end_turn }.to change { subject.phase }.from('resolution').to('end_game')
          end
        end

        context 'players have the requisite score' do
          let(:players) do
            [double('player', score: 10), double('player', score: 10)]
          end

          it 'transitions from resolution to end' do
            expect { subject.end_turn }.to change { subject.phase }.from('resolution').to('end_game')
          end
        end
      end
    end
  end
end
