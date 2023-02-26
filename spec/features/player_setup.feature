Feature: Player Setup
  Background: A player is created
    Given a player is created
  
  Scenario: initial state
    Then the player should have a score of 0
    And the player should have a name
    And the player should have an empty hand
    And the player should have an empty discard pile
    And the player should have a starter deck of 10 cards
    And the player should have 3 reserve troops
    And the player should have 0 diplomatic progress with 'all'