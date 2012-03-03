Feature: Deleting deliveries
  In order to remove needless deliveries
  As a user
  I want to make them disappear

  Background:
    Given there are the following users:
      | email            | password | role     |
      | user@shippie.com | password | customer |
    And I am signed in as them
    And there is a delivery "Some stuff" created by "user@shippie.com"
    And there is a delivery called "Another delivery"
    And I am on the homepage

  Scenario: Deleting a delivery
    When I follow "Some stuff"
    And I delete a delivery
    Then I should not see "Some stuff"

  Scenario: Delete link is invisible for not-owner
    When I follow "Another delivery"
    Then I should not see "Delete Delivery"
