Feature: Find Pets By Id

  Background:
    Given url baseUrl
    And path 'pet/'+ petId
    And header Content-Type = 'application/json'
    

  @Pet @parallel=false
  Scenario: Get pets using Id
  	And param status = 'available'
    When method GET
    Then status 200
    * print response  