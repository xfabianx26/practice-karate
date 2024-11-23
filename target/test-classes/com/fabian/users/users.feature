
  Feature:  User Tests for users

    Background:
      * url 'https://jsonplaceholder.typicode.com'

    #Buscando usuario por id
    Scenario: Get a user by ID
      Given path '/users/1'
      When  method get
      Then status 200

      And  match response.id == 1
      And match response.username == 'Bret'
      And match response.email == 'Sincere@april.biz'


      #CREANDO USUARIO
      Scenario: Create a new user
        * def create_user_request =
        """
            {
          name: 'Fabián Test',
          username: 'fabian',
          email: 'fabian@test.com',
          phone: '123-456-7890',
          website: 'fabian.com'
          }
        """

        Given path '/users'
        And  request create_user_request
        When method post
        Then status 201

        * def expectedName = create_user_request.name
        * def expectedEmail = create_user_request.email
        * def expectedWebsite = create_user_request.website

        And match response.name == expectedName
        And match response.email == expectedEmail
        And match response.website == expectedWebsite






