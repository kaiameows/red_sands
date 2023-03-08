# typed: false
# frozen_string_literal: true

module RedSands
  module Cards
    StandardTreasureCards = T.let(
      TreasureCardEvaluator.new.tap do |evaluator|
        plot_phase = T.let(%i[action buy], T::Array[Symbol])
        evaluator.instance_eval do
          T.bind(self, TreasureCardEvaluator)
          card 'Friends in High Places' do
            T.bind(self, Rules::RuleFactory)
            allowed_phases [:action] # theoretically buy too but only the action phase makes sense
            effect do
              T.bind(self, Rules::EffectEvaluator)
              # no idea how this one is going to work, but somehow we will need to evaluate this
              # before the next card is played
              next_card_played do |card|
                T.bind(self, Rules::EffectEvaluator)
                card.sectors = game_state.board.diplomatic_sectors
              end
            end
          end

          card 'Mercenaries' do
            T.bind(self, Rules::RuleFactory)
            allowed_phases plot_phase
            effect do
              T.bind(self, Rules::EffectEvaluator)
              choice 'Pay 3 money to gain 3 troops' do
                T.bind(self, Rules::ChoiceEvaluator)
                option 'Pay 3 money to gain 3 troops' do
                  cost money: 3
                  gain troops: 3
                end
                option do_nothing
              end
            end
          end
        end
      end.cards.deep_freeze,
      T::Array[TreasureCard]
    )
  end
end
