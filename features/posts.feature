Feature: Show posts for a Blog

  Background:
    Given there are the following blogs:
      | title                   |
      | The Mysteries of Life   |
    When I visit /

  Scenario: A blog can have no posts
    When I follow "The Mysteries of Life"
    Then I should see "This blog has 0 posts"

  Scenario: A blog can show many posts
    Given the blog "The Mysteries of Life" has the following posts
      | title         | body                                    |
      | Frist Post!   | I am so cool because I got here first!  |
      | BRILLANT      | I am the bestest coder EVAR             |
    And I follow "The Mysteries of Life"

    Then I should see "This blog has 2 posts"
    And I should see "Frist Post!"
    And I should see "I am so cool because I got here first!"

    And I should see "BRILLANT"
    And I should see "I am the bestest coder EVAR"

  Scenario: Can add a post to a blog
    When I follow "The Mysteries of Life"
    And I follow "Add a Post"

    Then I should see "Add a New Post"
    When I fill in "FRIST!" for "Title"
    And I fill in "This is such an honor" for "Body"
    And I press "Create Post"

    Then I should see "This blog has 1 post"
    And I should see "FRIST!"
    And I should see "This is such an honor"

  Scenario: Blogs have their own posts
