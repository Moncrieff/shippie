Feature: Ageing deliveries
  In order to be able to bid on features
  As a transporter
  I want to be able to see, which deliveries are expired

  Background:
    Given there is a delivery called "Unexpired delivery"
    And there is a delivery called "Old delivery" with expiration date "01/01/2009"
    And I am on the homepage

  Scenario: Viewing unexpired delivery
    When I follow "Unexpired delivery"
    Then I should not see "Expired"

  Scenario: Viewing expired delivery
    When I follow "Old delivery"
    Then I should see "Expired"
