Feature: Find Pets By status

  Background:
    Given url baseUrl
    And path 'pet/findByStatus'
    And header Content-Type = 'application/json'
    

  @Pet @parallel=false
  Scenario Outline: Get pets using status
  	And param <param_name> = <param_value>
    When method GET
    Then status 200
    * print response
    Examples:
      | param_name  | param_value |
      | status   | "pending" |