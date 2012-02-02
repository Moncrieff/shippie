Feature: Deleting deliveries
  In order to remove needless deliveries
  As a user
  I want to make them disappear

  Scenario: Deleting a delivery
    Given there is a delivery called "Some stuff"
    And I am on the homepage
    When I follow "Some stuff"
    And I delete a delivery
    Then I should not see "Some stuff"
