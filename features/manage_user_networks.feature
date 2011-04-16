Feature: Manage user networks

    As a user
    When I go manage networks page for myself
    I want to be able to connect multiple networks

    Scenario: List of connectable networks
        Given I am logged in
        When I visit the edit user network page
        Then I should see a list of connectable networks

    Scenario: List of connected networks
        Given I am logged in
        And I am connected to at least "1" network
        When I visit the edit user network page
        Then I should see a list of "1" connected networks

    @javascript
    @pause
    @wip
    Scenario: Add a network to the mix
        Given I am logged in
        When I visit the edit user network page
        And I click the add network link for "facebook"
        Then the new "facebook" should be added to my networks
