Feature: Verify swager api works as expected

    Scenario: Add a new pet on the store
          * def user =
        """
       {
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
        """


      Given url 'https://petstore.swagger.io/#/'
      And request user
      When method POST
      * print response
      Then status 405




      Scenario: Update an existing pet
          * def update =
        """
       {
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
        """




      Given url 'https://petstore.swagger.io/#/'
      And request update
      When method PUT
        * print response
      Then status 405


  Scenario: find by status availability

    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=available'
    * header Accept = 'application/json'
    When method GET
    * print response
    And match response[0].category.id == "0"
    Then status 200

  Scenario: find by status by ID

    Given url 'https://petstore.swagger.io/v2/pet/9223372036854605602'
    * header Accept = 'application/json'
    When method GET
    * print response
    Then status 404

  Scenario: DELETE PET by ID

    Given url 'https://petstore.swagger.io/v2/pet/9223372036854605602'
    * header Accept = 'application/json'
    When method DELETE
    * print response
    Then status 404

