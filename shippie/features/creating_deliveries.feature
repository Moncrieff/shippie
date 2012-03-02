Feature: Creating deliveries
  In order to have deliveries to bid on them
  As a user
  I want to create them easily

  Background:
    Given there is a "customer" user
    Given I am on the homepage
    When I follow "New delivery"
    Then I should see "You need to sign in or sign up before continuing."
    When I fill in my credentials
    Then I should see "New Delivery"

  Scenario: Creating a delivery
    And I create new delivery
    Then I should see "Delivery has been created."
    And I should be on the delivery page for newly created delivery
  
  Scenario: Creating a delivery without a name
    And I create new delivery without a name
    Then I should see "Delivery has not been created."
    And I should see "Name can't be blank"
  
  Scenario: Creating a delivery without mandatory fields filled
    And I create new delivery without mandatory fields filled
    Then I should see "Delivery has not been created."

  Scenario: Transporter shouldn't be able to create deliveries
    Given I sign out
    And there is a "transporter" user
    And user signs in
    And I am on the homepage
    Then I should not see "New delivery"
