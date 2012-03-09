Feature: Accepting bids
  In order to be able to deliver my goods
  As a customer
  I want to be able to accept bids

  Scenario: Accepting a bid
    Given there are the following users:
      | email            | password | role     |
      | user@shippie.com | password | customer |
    And I am signed in as them
    And there is a delivery "Furniture" created by "user@shippie.com"
    And that delivery has a bid 200
    And I am on the homepage
    When I follow "Furniture"
    And I accept bid
    Then I should see "You've accepted the bid"
    And I should not see "Accept"
    And I should see "Bid taken"

  Scenario: Accept link should be hidden for not owners
    Given there are the following users:
      | email            | password | role     |
      | user@shippie.com | password | customer |
    And I am signed in as them
    And there is a delivery called "Furniture"
    And that delivery has a bid 200
    And I am on the homepage
    When I follow "Furniture"
    Then I should not see "Accept"
