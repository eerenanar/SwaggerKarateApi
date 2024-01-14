Feature: Add New Pet

  Background:
    Given url baseUrl
    And path 'pet'
    And header Content-Type = 'application/json'
    * def jsonPayload = read('../../data/request/AddNewPet.json')

  @Pet , @parallel=false
  Scenario: Create new pet
    And request jsonPayload
    When method POST
    Then status 200
    * print response
