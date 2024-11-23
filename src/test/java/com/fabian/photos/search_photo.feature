Feature: Search photo

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Search a photo
    * def add_a_photo_request =
    """
    {
      "albumId": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    }
    """
    Given path '/photos'
    And request add_a_photo_request
    When method POST
    Then status 201


#    * def photoId = response.id
#    * print 'photo id : ', photoId


  Scenario: Get an existing photo
    Given path '/photos/1'
    When method GET
    Then status 200

    And match response.id == 1
    And match response.title == 'accusamus beatae ad facilis cum similique qui sunt'


  Scenario: Validate response structure
    * def add_a_photo_request =
    """
    {
      "albumId": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    }
    """
    Given path '/photos'
    And request add_a_photo_request
    When method POST
    Then status 201
#    And match response contains
    And match response ==
    """
    {
      "albumId": #number,
      "title": "#present",
      "url": "#string",
      "thumbnailUrl": "#string",
      "id": #number
    }
    """

