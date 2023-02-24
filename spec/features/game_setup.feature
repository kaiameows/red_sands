Feature: Initial Game Setup
  Background:
    Given a standard game with 2 players
  # most of the game setup can be done as soon as the number of players is known
  # however, players also need to choose their leader, and may have other choices
  # or actions to take based on that leader choice
  # technically, there are different rules for single and two-player games, but
  # in this file we just want to make sure the game initializes in a sane way
  # for n players
  Scenario: Standard Game Rules with 2 Players
    Given the secret power deck should be initialized
    Then the buyable card deck should be initialized
    And the tournament deck should be initialized
    And the buyable card deck should be initialized
    And the permanent buyable card decks should be initialized

  Scenario: Initial player setup
    Given each player should have 2 workers
    Then each player should have a starter deck
    And each player should have 1 food
    And each player should have 0 score
    And each player should have 3 troops in reserve
    And each player should have 0 diplomatic progress with 'all'

  Scenario: Initial market setup
    Given the market should have 5 cards