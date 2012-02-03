Feature: Creating bids
  In order to bid on deliveries
  As a transport provider
  I want to be able to select the delivery and bid

  Background:
    Given there is a delivery called "Furniture"
    And I am on the homepage
    When I follow "Furniture"

  Scenario: Creating a bid
    When I create a bid
    Then I should be on the delivery page for "Furniture"

  Scenario: Creating a bid without valid attributes fails
    When I create a bid with invalid attributes
    Then I should see "Bid has not been created."
