Feature: Creating bids
  In order to bid on deliveries
  As a transport provider
  I want to be able to select the delivery and bid

  Background:
    Given there is a confirmed user
    Given there is a delivery called "Furniture"
    And I am on the homepage
    When I follow "Furniture"
    And I follow "New Bid"
    Then I should see "You need to sign in or sign up before continuing."
    When I fill in my credentials
    Then I should see "New Bid"

  Scenario: Creating a bid
    When I create a bid
    Then I should be on the delivery page for "Furniture"

  Scenario: Creating a bid without valid attributes fails
    When I create a bid with invalid attributes
    Then I should see "Bid has not been created."
