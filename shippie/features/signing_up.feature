Feature: Signing up
  In order to put deliveries and bids
  As a user
  I want to be able to sign up

  Scenario: Signing up
    Given I am on the homepage
    When I'm signing up
    Then I should see "You have signed up successfully"
