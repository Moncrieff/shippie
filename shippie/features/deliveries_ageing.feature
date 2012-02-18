Feature: Ageing deliveries
  In order to be able to bid on features
  As a transporter
  I want to be able to see, which deliveries are expired

  Background:
    Given I am on the homepage


  Scenario: Viewing unexpired delivery
    When there is an unexpired delivery
    Then I should see "Unexpired"

  Scenario: Viewing expired delivery
    When there is an expired delivery
    Then I should see "Expired"
