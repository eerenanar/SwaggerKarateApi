Feature: Update pet with Form Data

  Background:
    Given url baseUrl
    And path 'pet/'+petId
    And header Content-Type = 'application/x-www-form-urlencoded'

  @Pet @parallel=false
  Scenario: Update pet with form data
    And form field name = petNameFormData
    And form field status = petStatusFormData
    When method POST
    Then status 200
    * print response