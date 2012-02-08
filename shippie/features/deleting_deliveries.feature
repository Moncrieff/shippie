Feature: Deleting deliveries
  In order to remove needless deliveries
  As a user
  I want to make them disappear

  Background:
    Given there is a confirmed user
    And there is a delivery called "Some stuff"
    And I am on the homepage
    Then user signs in

  Scenario: Deleting a delivery
    When I follow "Some stuff"
    And I delete a delivery
    Then I should not see "Some stuff"
