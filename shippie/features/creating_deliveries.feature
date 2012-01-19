Feature: Creating deliveries
  In order to have deliveries to bid on them
  As a user
  I want to create them easily

  Scenario: Creating a delivery
    Given I am on the homepage
    When I follow "New delivery"
    And I create new delivery
    Then I should see "Delivery has been created."
