Feature: Accepting bids
  In order to be able to deliver my goods
  As a customer
  I want to be able to accept bids

  Scenario: Accepting a bid
    Given there are the following users:
      | email            | password | role        |
      | user@shippie.com | password | transporter |
    And I am signed in as them
    And there is a delivery called "Furniture"
    And that delivery has a bid 200
    And that delivery has a bid 300
    And I am on the homepage
    When I follow "Furniture"
    And I accept bid 200
    Then I should see "Bid has been accepted"
