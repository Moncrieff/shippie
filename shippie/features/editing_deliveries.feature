Feature: Editing deliveries
  In order to update delivery information
  As a user
  I want to be able to do that through the interface

  Background:
    Given there are the following users:
      | email            | password | role     |
      | user@shippie.com | password | customer |
    And I am signed in as them
    And there is a delivery "Some stuff" created by "user@shippie.com"
    And I am on the homepage
    And I follow "Some stuff"

  Scenario: Updating a delivery
    And I update delivery
    Then I should be on the delivery page for "Some stuff beta"

  Scenario: Updating a delivery with invalid attributes
    And I update delivery with invalid attributes
    Then I should see "Delivery has not been updated."
