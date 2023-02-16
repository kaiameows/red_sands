Feature: Players can have Leaders associated with them
  Background:
    Given a standard game is in progress
  Scenario: Leaders have a Trigger Ability
    When the active player plays a Trigger Card
    Then the Trigger Ability is activated
  Scenario: Trigger Abilities can have associated counters
    When the Trigger Ability has a counter
    And the active player plays a Trigger Card
    Then the Trigger Ability is activated
    Then the next time the Trigger Ability is activated
    Then the counter is incremented