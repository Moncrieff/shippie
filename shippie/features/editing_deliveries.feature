Feature: Editing deliveries
  In order to update delivery information
  As a user
  I want to be able to do that through the interface

  Background:
    Given there is a delivery called "Some stuff"
    And there is a confirmed user
    And I am on the homepage
    When user signs in
    And I follow "Some stuff"

  Scenario: Updating a delivery
    And I update delivery
    Then I should be on the delivery page for "Some stuff beta"

  Scenario: Updating a delivery with invalid attributes
    And I update delivery with invalid attributes
    Then I should see "Delivery has not been updated."
