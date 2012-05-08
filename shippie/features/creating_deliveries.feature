Feature: Creating deliveries
  In order to have deliveries to bid on them
  As a user
  I want to create them easily

  Background:
    Given there are the following users:
      | email            | password | role     |
      | user@shippie.com | password | customer |
    And I am signed in as them
    And I am on the homepage

  Scenario: Creating a delivery
    When I follow "New delivery"
    And I create new delivery
    Then I should see "Delivery has been created."
    And I should be on the delivery page for newly created delivery
  
  Scenario: Creating a delivery without a name
    When I follow "New delivery"
    And I create new delivery without a name
    Then I should see "Delivery has not been created."
    And I should see "Name can't be blank"
  
  Scenario: New Delivery link should be invisible for transporters
    When I sign out
    And there are the following users:
      | email                   | password | role        |
      | transporter@shippie.com | password | transporter |
    And I am signed in as them
    And I am on the homepage
    Then I should not see "New delivery"
