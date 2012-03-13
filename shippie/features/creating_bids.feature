Feature: Creating bids
  In order to bid on deliveries
  As a transport provider
  I want to be able to select the delivery and bid

  Background:
    Given there are the following users:
      | email            | password | role        |
      | user@shippie.com | password | transporter |
    And I am signed in as them
    And there is a delivery called "Furniture"
    And there is a delivery called "Old delivery" with expiration date "01/01/2009"
    And there is an accepted delivery "Useless delivery"
    And I am on the homepage

  Scenario: Creating a bid
    When I follow "Furniture"
    And I follow "New Bid"
    And I create a bid
    Then I should see it was created by respective user
    And I should be on the delivery page for "Furniture"

  Scenario: Creating a bid without valid attributes fails
    When I follow "Furniture"
    And I follow "New Bid"
    And I create a bid with invalid attributes
    Then I should see "Bid has not been created."

  Scenario: No customer user can see "New Bid" link
    When I sign out
    And there are the following users:
      | email                | password | role     |
      | customer@shippie.com | password | customer |
    And I am signed in as them
    When I follow "Furniture"
    Then I should not see "New Bid"

  Scenario: No user can see "New Bid" link for expired delivery
    When I follow "Old delivery"
    Then I should not see "New Bid"

  Scenario: No user can see "New Bid" link for accepted delivery
    When I follow "Useless delivery"
    Then I should not see "New Bid"
