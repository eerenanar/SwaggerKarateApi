Feature: Update an existing Pet

  Background:
    Given url baseUrl
    And path 'pet'
    And header Content-Type = 'application/json'
    * def jsonPayload = read('../../data/request/UpdatePet.json')

  @Pet , @parallel=false
  Scenario: Update pet
    And request jsonPayload
    When method PUT
    Then status 200
    * print response