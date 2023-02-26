<!-- This file is for thinking about code, and planning stuff -->

So I should try to enumerate what can be modeled using this StateMachine thing
This is distinct from what parts of the game have mutable state
State machines more like semi-mutable state, they allow specified transitions between specified states
They *can* store data, but it's probably better if they don't, that's better for the event system
But like the phases of the game are probably very well modeled by a state machine

## GameState
  * the phase of the turn
  * the current player
  * whether the game is over

## Player
  * whether the player has completed their actions for the phase of the turn (i.e. `done?`)
  * whether the player has completed their action phase (i.e. `done_with_actions?`)
  * whether the player has completed their buy phase (i.e. `done_with_buys?`)
  * whether the player has an alliance with each faction

## Locations
  * locations can have a worker present
  * location occupation may or may not block other workers from occupying the same location
  * in the expansion some locations have further state

## Leaders
  * One specific leader has some ability that might be modeled as a state machine

## Cards
  * cards can be played, discarded, in hand, or in the main deck

