Feature: Player Setup
  Scenario: Players have an associated Leader
    When a player is created
    Then the player has a Leader

  Scenario: Players have a score
    When a player is created
    Then the player has an initial score of 0

  Scenario: Players have a hand of zero or more cards
    When a player is created
    Then the player has an empty hand

  Scenario: Players start with a 10-card starter deck
    When a player is created
    Then the player has a starter deck of 10 cards