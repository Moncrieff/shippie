Feature: Signing out
  In order to protect my account from unauthorized access
  As a signed in user
  I want to be able to sign out

  Scenario: User signs out
    Given there is a confirmed user
    And user signs in
    When I sign out
    Then I should see a signed out message
    When I return to the site
    Then I should be signed out
