Feature: Creating comments
  In order to communicate with other users
  As a user
  I want to be able to comment on deliveries

  Background:
    Given there are the following users:
      | email            | password | role        |
      | user@shippie.com | password | transporter |
    And I am signed in as them
    And there is a delivery called "Furniture"
    And I am on the dileveries page

  Scenario: Creating a comment
    When I follow "Furniture"
    And I follow "New Comment"
    And I write a comment "What about a delivery?"
    Then I should see "What about a delivery? by user@shippie.com"

  Scenario: Creating an empty comment
    When I follow "Furniture"
    And I follow "New Comment"
    And I write a comment ""
    Then I should see "Comment has not been created"
