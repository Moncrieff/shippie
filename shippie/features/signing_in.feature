Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

  Scenario: Signing in via confirmation
    Given there is a user
    #Given there are the following users:
    #  | email | password | unconfirmed |
    #  | user@shippie.com | password | true |
    And "user@shippie.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should be registered and signed in
