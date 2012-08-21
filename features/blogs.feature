Feature: Display list of Blogs

  Background:
    Given there are the following blogs:
      | title                   |
      | Much Ado about Nothing  |
      | Ruby vs Python          |

  Scenario: Hitting the root of the site displays the list of available blogs
    When I visit /
    Then I should see "Much Ado about Nothing"
    And I should see "Ruby vs Python"

  Scenario: Can visit an individual blog
    When I visit /
    And I follow "Ruby vs Python"
    Then I should see "Ruby vs Python"
    And I should see "This blog has"

  Scenario: Can create a new blog
    When I visit /
    And I follow "New Blog"
    Then I should see "New Blog"

    When I fill in "This is a blog title" for "Title"
    And I press "Create Blog"
    Then I should see "This is a blog title"

    When I follow "This is a blog title"
    Then I should see "This is a blog title"
    And I should see "This blog has"

