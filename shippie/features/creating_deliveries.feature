Feature: Creating deliveries
  In order to have deliveries to bid on them
  As a user
  I want to create them easily

  Background:
    Given I am on the homepage
    When I follow "New delivery"

  Scenario: Creating a delivery
    And I create new delivery
    Then I should see "Delivery has been created."
    And I should be on the delivery page for newly created delivery
  
  Scenario: Creating a delivery without a name
    And I create new delivery without a name
    Then I should see "Delivery has not been created."
    And I should see "Name can't be blank"
