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

  Scenario: Posts are ordered by created date, descending

  Scenario: Blogs have their own posts
