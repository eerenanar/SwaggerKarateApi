Feature: Delete existing pet

  Background:
    Given url baseUrl
    And path 'pet/'+petId
    And header Content-Type = 'application/json'

  @Pet @parallel=false
  Scenario: Delete Pet
    When method DELETE
    Then status 200
    * print response