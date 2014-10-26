Feature: Generate document with current buffer
  In ordre to generate a document
  As a user
  I send current buffer content to remote site

  Scenario: I create an activity diagram
    Given I switch to buffer "schema"
    Given I clear the buffer
    Given I insert "(start)->(test)->(end)" in buffer and save to "/tmp/schema"
    Then I should be in buffer matching regexp "schema"
    Given I start an action chain
    And I press "M-x"
    And I type "eyuml-create-activity-diagram"
    When I press "RET"
    And I execute the action chain
    Then check file "/tmp/schema.png" exists after "5" seconds
    Then md5 checksum of "/tmp/schema.png" is "b89e885003917a7e40ddd01ef96d77e7"

  Scenario: I create a class diagram
    Given I switch to buffer "schema"
    Given I clear the buffer
    Given I insert "[Test 1]++-0..*>[Test 2]" in buffer and save to "/tmp/schema"
    Then I should be in buffer matching regexp "schema"
    Given I start an action chain
    And I press "M-x"
    And I type "eyuml-create-class-diagram"
    When I press "RET"
    And I execute the action chain
    Then check file "/tmp/schema.png" exists after "5" seconds
    Then md5 checksum of "/tmp/schema.png" is "65988da2c8d111748ab3421dbc389444"

  Scenario: I create a use case diagram
    Given I switch to buffer "schema"
    Given I clear the buffer
    Given I insert "[User]-(Action)" in buffer and save to "/tmp/schema"
    Then I should be in buffer matching regexp "schema"
    Given I start an action chain
    And I press "M-x"
    And I type "eyuml-create-usecase-diagram"
    When I press "RET"
    And I execute the action chain
    Then check file "/tmp/schema.png" exists after "5" seconds
    Then md5 checksum of "/tmp/schema.png" is "7b351944507747d967617571322d61bb"
