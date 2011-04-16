Feature: Request project membership

    As a user
    When I visit a project page
    I want to be able to request a project membership

    Scenario: Request project membership
        Given I am logged in
        When I visit the projects page
        And I click on a project
        Then I should see become a member link
