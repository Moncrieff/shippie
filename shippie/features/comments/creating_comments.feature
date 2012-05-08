Feature: Creating comments
  In order to ask or answer a question
  As a user
  I want to be able to create a comment

  Background:
    Given there are the following users:
      | email            | password | role        |
      | user@shippie.com | password | transporter |
    And I am signed in as them
    And there is a delivery called "Furniture"
    And I am on the homepage

  Scenario: Creating comment
    Given I follow "Furniture"
    And I follow "New Comment"
    When I create a comment "How many items do you have for delivery?"
    Then I should be on the delivery page for "Furniture"
    And I should see "How many items do you have for delivery?"
    And I should see "Comment has been successfully created."
