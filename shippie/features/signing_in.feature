Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

  Scenario: Signing in via confirmation
    Given there is an unconfirmed user
    And "user@shippie.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should be registered and signed in

  Scenario: Signing in via form
    Given there is a confirmed user
    And I am on the homepage
    And user signs in
    Then I should see "Signed in successfully"
