<!-- This file is for thinking about code, and planning stuff -->

So I should try to enumerate what can be modeled using this StateMachine thing
This is distinct from what parts of the game have mutable state
State machines more like semi-mutable state, they allow specified transitions between specified states
They *can* store data, but it's probably better if they don't, that's better for the event system
But like the phases of the game are probably very well modeled by a state machine

## GameState
  * the phase of the turn
  * the current player
  * which players have which diplomatic alliances

## Player
  * whether the player has completed their actions for the phase of the turn (i.e. `done?`)
  * whether the player has completed their action phase (i.e. `done_with_actions?`)
  * whether the player has completed their buy phase (i.e. `done_with_buys?`)

## Locations
  * locations and the board probably shouldn't have state

## Workers
  * workers can be deployed or not
  * if deployed, they have a location

## Leaders
  * One specific leader has some ability that might be modeled as a state machine

## Cards
  * cards can be played, discarded, in hand, or in the main deck



workers need a reference to player, and locations need a reference to sector
sectors don't need to exist and workers should be nilable on gamestate(?) and created on demand with a reference to the player object
