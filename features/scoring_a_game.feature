Feature: Scoring a game

  In order to see how terrible I am at bowling,
  As a Bowling Site User,
  I should be able to enter in scores and see an accurate final sum
  
  Background: Setting up players
    Given a player named Jeff
    And a player named Bob
    And a new bowling game
    
  Scenario: Going into the frame page
    Given I am on the game page
    When I follow "Enter in next frame"
    Then I should be on the edit frame page
    
  Scenario: Inputting a frame score from the frame page
    Given I am on the game page
    And I follow "Enter in next frame"
    When I fill in "First Frame" with "4"
    And I fill in "Second Frame" with "5"
    And I press "Update"
    Then I should be on the game page
    And Jeff should have 9 points
    
  Scenario: Winning a game
    Given Jeff has the following scores:
      | turn | first_frame | second_frame |
      |  1   |   0   |   0    |
      |  2   |   0   |   0    |
      |  3   |   0   |   0    |
      |  4   |   0   |   0    |
      |  5   |   0   |   0    |
      |  6   |   0   |   0    |
      |  7   |   0   |   0    |
      |  8   |   0   |   0    |
      |  9   |   0   |   0    |
      |  10  |   0   |   0    |
    And Bob has the following scores:
      | turn | first_frame | second_frame |
      |  1   |   0   |   0    |
      |  2   |   0   |   0    |
      |  3   |   0   |   0    |
      |  4   |   0   |   0    |
      |  5   |   0   |   0    |
      |  6   |   0   |   0    |
      |  7   |   0   |   0    |
      |  8   |   0   |   0    |
      |  9   |   0   |   0    |
    And I am on the game page
    When I follow "Enter in next frame"
    And I fill in "First Frame" with "1"
    And I fill in "Second Frame" with "0"
    And I press "update"
    Then I should be on the game page
    And I should see "Bob is the winner"
    
  Scenario: Scoring a strike
    Given Jeff has the following scores:
      | turn | first_frame | second_frame |
      |  1   |   10  |   0    |
    When Jeff bowls a 5 and a 4 for the next frame
    Then Jeff should have 28 points
    And Jeff should see "X" for frame 1
    
  Scenario: Scoring a spare
    Given Jeff has the following scores:
      | turn | first_frame | second_frame |
      |  1   |   9  |   1    |
    When Jeff bowls a 5 and a 4 for the next frame
    Then Jeff should have 24 points
    And Jeff should see "/" for frame 1
  
      