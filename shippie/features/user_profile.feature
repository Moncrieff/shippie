Feature: User profiles
  In order to see an information about potential partner
  As a user
  I want to be able to see other users' profiles

  Scenario: Viewing transporter's profile
    Given there are the following users:
      | email            | password | role        |
      | user@shippie.com | password | transporter |
    And there is a delivery called "Some delivery"
    And there is a bid for "Some delivery" created by "user@shippie.com"
    And I am on the homepage
    When I follow "Some delivery"
    And I follow "user@shippie.com"
    Then I should see "Profile of user@shippie.com"

