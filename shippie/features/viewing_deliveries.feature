Feature: Viewing deliveries
  In order to choose an appropriate delivery
  As a user
  I want to see a list of available deliveries

  Background: 
    Given there is a delivery called "Some stuff"
    And there is a delivery called "Other delivery"
    And I am on the homepage

  Scenario: Listing all deliveries
    Then I should see list of deliveries with fields

  Scenario: Viewing a delivery
    When I follow "Other delivery"
    Then I should be on the delivery page for "Other delivery"
    And I should see a "Other delivery" delivery info
