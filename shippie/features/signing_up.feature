Feature: Signing up
  In order to put deliveries and bids
  As a user
  I want to be able to sign up

  Background:
    Given I am on the homepage
    When I follow "Sign up"

  Scenario: Signing up as a transporter
    When I'm signing up as a "transporter"
    Then I should see "You have signed up successfully"
  
  Scenario: Signing up as a customer
    When I'm signing up as a "customer"
    Then I should see "You have signed up successfully"
