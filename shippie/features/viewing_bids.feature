Feature: Viewing bids
  In order to view bids for a delivery
  As a user
  I want to see them on that delivery page

  Background:
    Given there is a delivery called "Furniture"
    And that delivery has a bid 100
    And there is a delivery called "Some stuff"
    And that delivery has a bid 50
    And I am on the homepage

  Scenario: Viewing bids for a given delivery
    When I follow "Furniture"
    Then I should see a bid with price 100

    When I follow "Home"
    And I follow "Some stuff"
    Then I should see a bid with price 50
