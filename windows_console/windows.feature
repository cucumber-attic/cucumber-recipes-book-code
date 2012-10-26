# START:coding
# -*- coding: utf-8 -*-
# END:coding

# START:colors
Feature: Windows console

  Scenario: Pass/fail colors
    Given I am on Windows
    When I run Cucumber
    Then I should see colors
# END:colors

  # START:characters
  Scenario: European characters
    Given I am on Windows
    When my step contains an accented é
    Then it should show up in the output
  # END:characters
