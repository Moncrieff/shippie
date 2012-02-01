Feature: Viewing deliveries
  In order to choose an appropriate delivery
  As a user
  I want to see a list of available deliveries

  Scenario: Listing all deliveries
    Given there is a delivery called "Some stuff"
    And I am on the homepage
    When I follow "Some stuff"
    Then I should be on the delivery page for "Some stuff"
