Feature: Uploads an image

 Background:
 
    Given url baseUrl
    And path 'pet/'+petId+'/uploadImage'
    And header accept = 'application/json'
    And header Content-Type = 'multipart/form-data'

  @Pet @parallel=false
  Scenario: Upload Image to existing pet
  	And multipart file file = { read: '../images/imageForRequest.png', filename: 'imageForRequest.png', contentType: 'image/png' }
    When method POST
    Then status 200
    * print response