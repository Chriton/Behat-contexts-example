	Feature: API
		In order to receive documents from the database
		As a authenticated user
		I want to be able to receive API responses



	 ############################## Get Standard #############################


	@api @api_standard
	Scenario: Send POST request to 'standard document' without the authentication token
		Given I have no authentication token
		And I send a POST request to the 'getstandard' method with the values:
		|dataIncarcare  |2010-02-25  |
		|page           |1           |
		Then the HTTP response should be '400'
		And I should receive an error from the API

	@api @api_standard
	Scenario: Send POST request to 'standard document' with wrong authentication
		Given I have an invalid authentication token
		And I send a POST request to the 'getstandard' method with the values:
		|dataIncarcare  |2010-02-25  |
		|page           |1           |
		Then the HTTP response should be '401'
		And I should receive an error from the API

	@api @api_standard
	Scenario: Send POST request to 'standard document' with correct authentication and valid search values
		Given I have a valid authentication token
		And I send a POST request to the 'getstandard' method with the values:
		|dataIncarcare  |2010-04-22  |
		|page           |1           |
		Then the HTTP response should be '200'
		And I should receive the requested data from the API

	@api @api_standard
	Scenario: Send POST request to 'standard document' with correct authentication but with no results found
		Given I have a valid authentication token
		And I send a POST request to the 'getstandard' method with the values:
		|dataIncarcare  |some random data  |
		|page           |1                 |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1201'

	@api @api_standard
	Scenario: Send POST request to 'standard document' with correct authentication but without 'dataIncarcare'
		Given I have a valid authentication token
		And I send a POST request to the 'getstandard' method with the values:
		|dataIncarcare  |             |
		|page           |1            |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1101'

	@api @api_standard
	Scenario: Send POST request to 'standard document' with correct authentication but without 'page'
		Given I have a valid authentication token
		And I send a POST request to the 'getstandard' method with the values:
		|dataIncarcare  |2010-02-25   |
		|page           |             |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1102'

	@api @api_standard
	Scenario: Send POST request to 'standard document' with correct authentication but with 'page' as a text
		Given I have a valid authentication token
		And I send a POST request to the 'getstandard' method with the values:
		|dataIncarcare  |2010-02-25   |
		|page           |abc          |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1107'

	@api @api_standard
	Scenario: Send POST request to 'standard document' with correct authentication but with 'page' as a negative number
		Given I have a valid authentication token
		And I send a POST request to the 'getstandard' method with the values:
		|dataIncarcare  |2010-02-25   |
		|page           |-25          |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1109'


	############################## Get Extended #############################


	@api @api_extended
	Scenario: Send POST request to 'extended document' without the authentication token
		Given I have no authentication token
		And I send a POST request to the 'getextended' method with the values:
		|dataIncarcare  |2010-02-25  |
		|page           |1           |
		Then the HTTP response should be '400'
		And I should receive an error from the API

	@api @api_extended
	Scenario: Send POST request to 'extended document' with wrong authentication
		Given I have an invalid authentication token
		And I send a POST request to the 'getextended' method with the values:
		|dataIncarcare  |2010-02-25  |
		|page           |1           |
		Then the HTTP response should be '401'
		And I should receive an error from the API

	@api @api_extended
	Scenario: Send POST request to 'extended document' with correct authentication and valid search values
		Given I have a valid authentication token
		And I send a POST request to the 'getextended' method with the values:
		|dataIncarcare  |2010-02-25  |
		|page           |1           |
		Then the HTTP response should be '200'
		And I should receive the requested data from the API

	@api @api_extended
	Scenario: Send POST request to 'extended document' with correct authentication but with no results found
		Given I have a valid authentication token
		And I send a POST request to the 'getextended' method with the values:
		|dataIncarcare  |some random data  |
		|page           |1                 |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1202'

	@api @api_extended
	Scenario: Send POST request to 'extended document' with correct authentication but without 'dataIncarcare'
		Given I have a valid authentication token
		And I send a POST request to the 'getextended' method with the values:
		|dataIncarcare  |             |
		|page           |1            |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1103'

	@api @api_extended
	Scenario: Send POST request to 'extended document' with correct authentication but without 'page'
		Given I have a valid authentication token
		And I send a POST request to the 'getextended' method with the values:
		|dataIncarcare  |2010-02-25   |
		|page           |             |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1104'

	@api @api_extended
	Scenario: Send POST request to 'extended document' with correct authentication but with 'page' as a text
		Given I have a valid authentication token
		And I send a POST request to the 'getextended' method with the values:
		|dataIncarcare  |2010-02-25   |
		|page           |abc          |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1108'

	@api @api_extended
	Scenario: Send POST request to 'extended document' with correct authentication but with 'page' as a negative number
		Given I have a valid authentication token
		And I send a POST request to the 'getextended' method with the values:
		|dataIncarcare  |2010-02-25   |
		|page           |-25          |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1110'


	############################## Get One ##################################


	@api @api_one
	Scenario: Send POST request to 'search document' without the authentication token
		Given I have no authentication token
		And I send a POST request to the 'getone' method with the values:
		|numarHotarare  |883/2013    |
		|dataHotarare   |2013-06-18  |
		Then the HTTP response should be '400'
		And I should receive an error from the API

	@api @api_one
	Scenario: Send POST request to 'search document' with wrong authentication
		Given I have an invalid authentication token
		And I send a POST request to the 'getone' method with the values:
		|numarHotarare  |883/2013    |
		|dataHotarare   |2013	-06-18  |
		Then the HTTP response should be '401'
		And I should receive an error from the API

	@api @api_one
	Scenario: Send POST request to 'search document' with correct authentication and valid search values
		Given I have a valid authentication token
		And I send a POST request to the 'getone' method with the values:
		|numarHotarare  |883/2013    |
		|dataHotarare   |2013-06-18  |
		Then the HTTP response should be '200'
		And I should receive the requested data from the API

	@api @api_one
	Scenario: Send POST request to 'search document' with correct authentication but with no results found
		Given I have a valid authentication token
		And I send a POST request to the 'getone' method with the values:
		|numarHotarare  |some random data  |
		|dataHotarare   |2013-06-18        |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1203'

	@api @api_one
	Scenario: Send POST request to 'search document' with correct authentication but with no results found
		Given I have a valid authentication token
		And I send a POST request to the 'getone' method with the values:
		|numarHotarare  |883/2013          |
		|dataHotarare   |some random data  |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1203'

	@api @api_one
	Scenario: Send POST request to 'search document' with correct authentication but without 'numarHotarare'
		Given I have a valid authentication token
		And I send a POST request to the 'getone' method with the values:
		|numarHotarare  |            |
		|dataHotarare   |2013-06-18  |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1105'

	@api @api_one
	Scenario: Send POST request to 'search document' with correct authentication but without 'dataHotarare'
		Given I have a valid authentication token
		And I send a POST request to the 'getone' method with the values:
		|numarHotarare  |883/2013    |
		|dataHotarare   |            |
		Then the HTTP response should be '200'
		And the error code returned by the API should be '1106'


	 ############################## Get Token ################################


	@api @api_token
	Scenario: Send POST request to 'get token' with correct data
		Given I send a POST request to the 'gettoken' method with the values:
		|grand_type    | password          |
		|username      | test@test.com     |
		|password      | 1111              |
		|client_id     | THE_API_CLIENT    |
		|client_secret | secret            |
		Then the HTTP response should be '200'
		And I should receive a valid authentication token from the API

	@api @api_token
	Scenario Outline: Send POST request to 'get token' with invalid or incomplete data
		Given I request a token with a <username> username, <password> password, <grand_type> grand_type, <client_id> client_id and <client_secret> client_secret
		Then I should receive an error from the API

		Examples:
		|username	|password	|grand_type	|client_id	|client_secret	|
		|	invalid	|	valid	|	valid	|	valid	|	valid		|
		|	blank	|	valid	|	valid	|	valid	|	valid		|
		|	valid	|	invalid	|	valid	|	valid	|	valid		|
		|	invalid	|	invalid	|	valid	|	valid	|	valid		|
		|	blank	|	invalid	|	valid	|	valid	|	valid		|
		|	valid	|	blank	|	valid	|	valid	|	valid		|
		|	invalid	|	blank	|	valid	|	valid	|	valid		|
		|	blank	|	blank	|	valid	|	valid	|	valid		|
		|	valid	|	valid	|	invalid	|	valid	|	valid		|
		|	invalid	|	valid	|	invalid	|	valid	|	valid		|
		|	blank	|	valid	|	invalid	|	valid	|	valid		|
		|	valid	|	invalid	|	invalid	|	valid	|	valid		|
		|	invalid	|	invalid	|	invalid	|	valid	|	valid		|
		|	blank	|	invalid	|	invalid	|	valid	|	valid		|
		|	valid	|	blank	|	invalid	|	valid	|	valid		|
		|	invalid	|	blank	|	invalid	|	valid	|	valid		|
		|	blank	|	blank	|	invalid	|	valid	|	valid		|
		|	valid	|	valid	|	blank	|	valid	|	valid		|
		|	invalid	|	valid	|	blank	|	valid	|	valid		|
		|	blank	|	valid	|	blank	|	valid	|	valid		|
		|	valid	|	invalid	|	blank	|	valid	|	valid		|
		|	invalid	|	invalid	|	blank	|	valid	|	valid		|
		|	blank	|	invalid	|	blank	|	valid	|	valid		|
		|	valid	|	blank	|	blank	|	valid	|	valid		|
		|	invalid	|	blank	|	blank	|	valid	|	valid		|
		|	blank	|	blank	|	blank	|	valid	|	valid		|
		|	valid	|	valid	|	valid	|	invalid	|	valid		|
		|	invalid	|	valid	|	valid	|	invalid	|	valid		|
		|	blank	|	valid	|	valid	|	invalid	|	valid		|
		|	valid	|	invalid	|	valid	|	invalid	|	valid		|
		|	invalid	|	invalid	|	valid	|	invalid	|	valid		|
		|	blank	|	invalid	|	valid	|	invalid	|	valid		|
		|	valid	|	blank	|	valid	|	invalid	|	valid		|
		|	invalid	|	blank	|	valid	|	invalid	|	valid		|
		|	blank	|	blank	|	valid	|	invalid	|	valid		|
		|	valid	|	valid	|	invalid	|	invalid	|	valid		|
		|	invalid	|	valid	|	invalid	|	invalid	|	valid		|
		|	blank	|	valid	|	invalid	|	invalid	|	valid		|
		|	valid	|	invalid	|	invalid	|	invalid	|	valid		|
		|	invalid	|	invalid	|	invalid	|	invalid	|	valid		|
		|	blank	|	invalid	|	invalid	|	invalid	|	valid		|
		|	valid	|	blank	|	invalid	|	invalid	|	valid		|
		|	invalid	|	blank	|	invalid	|	invalid	|	valid		|
		|	blank	|	blank	|	invalid	|	invalid	|	valid		|
		|	valid	|	valid	|	blank	|	invalid	|	valid		|
		|	invalid	|	valid	|	blank	|	invalid	|	valid		|
		|	blank	|	valid	|	blank	|	invalid	|	valid		|
		|	valid	|	invalid	|	blank	|	invalid	|	valid		|
		|	invalid	|	invalid	|	blank	|	invalid	|	valid		|
		|	blank	|	invalid	|	blank	|	invalid	|	valid		|
		|	valid	|	blank	|	blank	|	invalid	|	valid		|
		|	invalid	|	blank	|	blank	|	invalid	|	valid		|
		|	blank	|	blank	|	blank	|	invalid	|	valid		|
		|	valid	|	valid	|	valid	|	blank	|	valid		|
		|	invalid	|	valid	|	valid	|	blank	|	valid		|
		|	blank	|	valid	|	valid	|	blank	|	valid		|
		|	valid	|	invalid	|	valid	|	blank	|	valid		|
		|	invalid	|	invalid	|	valid	|	blank	|	valid		|
		|	blank	|	invalid	|	valid	|	blank	|	valid		|
		|	valid	|	blank	|	valid	|	blank	|	valid		|
		|	invalid	|	blank	|	valid	|	blank	|	valid		|
		|	blank	|	blank	|	valid	|	blank	|	valid		|
		|	valid	|	valid	|	invalid	|	blank	|	valid		|
		|	invalid	|	valid	|	invalid	|	blank	|	valid		|
		|	blank	|	valid	|	invalid	|	blank	|	valid		|
		|	valid	|	invalid	|	invalid	|	blank	|	valid		|
		|	invalid	|	invalid	|	invalid	|	blank	|	valid		|
		|	blank	|	invalid	|	invalid	|	blank	|	valid		|
		|	valid	|	blank	|	invalid	|	blank	|	valid		|
		|	invalid	|	blank	|	invalid	|	blank	|	valid		|
		|	blank	|	blank	|	invalid	|	blank	|	valid		|
		|	valid	|	valid	|	blank	|	blank	|	valid		|
		|	invalid	|	valid	|	blank	|	blank	|	valid		|
		|	blank	|	valid	|	blank	|	blank	|	valid		|
		|	valid	|	invalid	|	blank	|	blank	|	valid		|
		|	invalid	|	invalid	|	blank	|	blank	|	valid		|
		|	blank	|	invalid	|	blank	|	blank	|	valid		|
		|	valid	|	blank	|	blank	|	blank	|	valid		|
		|	invalid	|	blank	|	blank	|	blank	|	valid		|
		|	blank	|	blank	|	blank	|	blank	|	valid		|
		|	valid	|	valid	|	valid	|	valid	|	invalid		|
		|	invalid	|	valid	|	valid	|	valid	|	invalid		|
		|	blank	|	valid	|	valid	|	valid	|	invalid		|
		|	valid	|	invalid	|	valid	|	valid	|	invalid		|
		|	invalid	|	invalid	|	valid	|	valid	|	invalid		|
		|	blank	|	invalid	|	valid	|	valid	|	invalid		|
		|	valid	|	blank	|	valid	|	valid	|	invalid		|
		|	invalid	|	blank	|	valid	|	valid	|	invalid		|
		|	blank	|	blank	|	valid	|	valid	|	invalid		|
		|	valid	|	valid	|	invalid	|	valid	|	invalid		|
		|	invalid	|	valid	|	invalid	|	valid	|	invalid		|
		|	blank	|	valid	|	invalid	|	valid	|	invalid		|
		|	valid	|	invalid	|	invalid	|	valid	|	invalid		|
		|	invalid	|	invalid	|	invalid	|	valid	|	invalid		|
		|	blank	|	invalid	|	invalid	|	valid	|	invalid		|
		|	valid	|	blank	|	invalid	|	valid	|	invalid		|
		|	invalid	|	blank	|	invalid	|	valid	|	invalid		|
		|	blank	|	blank	|	invalid	|	valid	|	invalid		|
		|	valid	|	valid	|	blank	|	valid	|	invalid		|
		|	invalid	|	valid	|	blank	|	valid	|	invalid		|
		|	blank	|	valid	|	blank	|	valid	|	invalid		|
		|	valid	|	invalid	|	blank	|	valid	|	invalid		|
		|	invalid	|	invalid	|	blank	|	valid	|	invalid		|
		|	blank	|	invalid	|	blank	|	valid	|	invalid		|
		|	valid	|	blank	|	blank	|	valid	|	invalid		|
		|	invalid	|	blank	|	blank	|	valid	|	invalid		|
		|	blank	|	blank	|	blank	|	valid	|	invalid		|
		|	valid	|	valid	|	valid	|	invalid	|	invalid		|
		|	invalid	|	valid	|	valid	|	invalid	|	invalid		|
		|	blank	|	valid	|	valid	|	invalid	|	invalid		|
		|	valid	|	invalid	|	valid	|	invalid	|	invalid		|
		|	invalid	|	invalid	|	valid	|	invalid	|	invalid		|
		|	blank	|	invalid	|	valid	|	invalid	|	invalid		|
		|	valid	|	blank	|	valid	|	invalid	|	invalid		|
		|	invalid	|	blank	|	valid	|	invalid	|	invalid		|
		|	blank	|	blank	|	valid	|	invalid	|	invalid		|
		|	valid	|	valid	|	invalid	|	invalid	|	invalid		|
		|	invalid	|	valid	|	invalid	|	invalid	|	invalid		|
		|	blank	|	valid	|	invalid	|	invalid	|	invalid		|
		|	valid	|	invalid	|	invalid	|	invalid	|	invalid		|
		|	invalid	|	invalid	|	invalid	|	invalid	|	invalid		|
		|	blank	|	invalid	|	invalid	|	invalid	|	invalid		|
		|	valid	|	blank	|	invalid	|	invalid	|	invalid		|
		|	invalid	|	blank	|	invalid	|	invalid	|	invalid		|
		|	blank	|	blank	|	invalid	|	invalid	|	invalid		|
		|	valid	|	valid	|	blank	|	invalid	|	invalid		|
		|	invalid	|	valid	|	blank	|	invalid	|	invalid		|
		|	blank	|	valid	|	blank	|	invalid	|	invalid		|
		|	valid	|	invalid	|	blank	|	invalid	|	invalid		|
		|	invalid	|	invalid	|	blank	|	invalid	|	invalid		|
		|	blank	|	invalid	|	blank	|	invalid	|	invalid		|
		|	valid	|	blank	|	blank	|	invalid	|	invalid		|
		|	invalid	|	blank	|	blank	|	invalid	|	invalid		|
		|	blank	|	blank	|	blank	|	invalid	|	invalid		|
		|	valid	|	valid	|	valid	|	blank	|	invalid		|
		|	invalid	|	valid	|	valid	|	blank	|	invalid		|
		|	blank	|	valid	|	valid	|	blank	|	invalid		|
		|	valid	|	invalid	|	valid	|	blank	|	invalid		|
		|	invalid	|	invalid	|	valid	|	blank	|	invalid		|
		|	blank	|	invalid	|	valid	|	blank	|	invalid		|
		|	valid	|	blank	|	valid	|	blank	|	invalid		|
		|	invalid	|	blank	|	valid	|	blank	|	invalid		|
		|	blank	|	blank	|	valid	|	blank	|	invalid		|
		|	valid	|	valid	|	invalid	|	blank	|	invalid		|
		|	invalid	|	valid	|	invalid	|	blank	|	invalid		|
		|	blank	|	valid	|	invalid	|	blank	|	invalid		|
		|	valid	|	invalid	|	invalid	|	blank	|	invalid		|
		|	invalid	|	invalid	|	invalid	|	blank	|	invalid		|
		|	blank	|	invalid	|	invalid	|	blank	|	invalid		|
		|	valid	|	blank	|	invalid	|	blank	|	invalid		|
		|	invalid	|	blank	|	invalid	|	blank	|	invalid		|
		|	blank	|	blank	|	invalid	|	blank	|	invalid		|
		|	valid	|	valid	|	blank	|	blank	|	invalid		|
		|	invalid	|	valid	|	blank	|	blank	|	invalid		|
		|	blank	|	valid	|	blank	|	blank	|	invalid		|
		|	valid	|	invalid	|	blank	|	blank	|	invalid		|
		|	invalid	|	invalid	|	blank	|	blank	|	invalid		|
		|	blank	|	invalid	|	blank	|	blank	|	invalid		|
		|	valid	|	blank	|	blank	|	blank	|	invalid		|
		|	invalid	|	blank	|	blank	|	blank	|	invalid		|
		|	blank	|	blank	|	blank	|	blank	|	invalid		|
		|	valid	|	valid	|	valid	|	valid	|	blank		|
		|	invalid	|	valid	|	valid	|	valid	|	blank		|
		|	blank	|	valid	|	valid	|	valid	|	blank		|
		|	valid	|	invalid	|	valid	|	valid	|	blank		|
		|	invalid	|	invalid	|	valid	|	valid	|	blank		|
		|	blank	|	invalid	|	valid	|	valid	|	blank		|
		|	valid	|	blank	|	valid	|	valid	|	blank		|
		|	invalid	|	blank	|	valid	|	valid	|	blank		|
		|	blank	|	blank	|	valid	|	valid	|	blank		|
		|	valid	|	valid	|	invalid	|	valid	|	blank		|
		|	invalid	|	valid	|	invalid	|	valid	|	blank		|
		|	blank	|	valid	|	invalid	|	valid	|	blank		|
		|	valid	|	invalid	|	invalid	|	valid	|	blank		|
		|	invalid	|	invalid	|	invalid	|	valid	|	blank		|
		|	blank	|	invalid	|	invalid	|	valid	|	blank		|
		|	valid	|	blank	|	invalid	|	valid	|	blank		|
		|	invalid	|	blank	|	invalid	|	valid	|	blank		|
		|	blank	|	blank	|	invalid	|	valid	|	blank		|
		|	valid	|	valid	|	blank	|	valid	|	blank		|
		|	invalid	|	valid	|	blank	|	valid	|	blank		|
		|	blank	|	valid	|	blank	|	valid	|	blank		|
		|	valid	|	invalid	|	blank	|	valid	|	blank		|
		|	invalid	|	invalid	|	blank	|	valid	|	blank		|
		|	blank	|	invalid	|	blank	|	valid	|	blank		|
		|	valid	|	blank	|	blank	|	valid	|	blank		|
		|	invalid	|	blank	|	blank	|	valid	|	blank		|
		|	blank	|	blank	|	blank	|	valid	|	blank		|
		|	valid	|	valid	|	valid	|	invalid	|	blank		|
		|	invalid	|	valid	|	valid	|	invalid	|	blank		|
		|	blank	|	valid	|	valid	|	invalid	|	blank		|
		|	valid	|	invalid	|	valid	|	invalid	|	blank		|
		|	invalid	|	invalid	|	valid	|	invalid	|	blank		|
		|	blank	|	invalid	|	valid	|	invalid	|	blank		|
		|	valid	|	blank	|	valid	|	invalid	|	blank		|
		|	invalid	|	blank	|	valid	|	invalid	|	blank		|
		|	blank	|	blank	|	valid	|	invalid	|	blank		|
		|	valid	|	valid	|	invalid	|	invalid	|	blank		|
		|	invalid	|	valid	|	invalid	|	invalid	|	blank		|
		|	blank	|	valid	|	invalid	|	invalid	|	blank		|
		|	valid	|	invalid	|	invalid	|	invalid	|	blank		|
		|	invalid	|	invalid	|	invalid	|	invalid	|	blank		|
		|	blank	|	invalid	|	invalid	|	invalid	|	blank		|
		|	valid	|	blank	|	invalid	|	invalid	|	blank		|
		|	invalid	|	blank	|	invalid	|	invalid	|	blank		|
		|	blank	|	blank	|	invalid	|	invalid	|	blank		|
		|	valid	|	valid	|	blank	|	invalid	|	blank		|
		|	invalid	|	valid	|	blank	|	invalid	|	blank		|
		|	blank	|	valid	|	blank	|	invalid	|	blank		|
		|	valid	|	invalid	|	blank	|	invalid	|	blank		|
		|	invalid	|	invalid	|	blank	|	invalid	|	blank		|
		|	blank	|	invalid	|	blank	|	invalid	|	blank		|
		|	valid	|	blank	|	blank	|	invalid	|	blank		|
		|	invalid	|	blank	|	blank	|	invalid	|	blank		|
		|	blank	|	blank	|	blank	|	invalid	|	blank		|
		|	valid	|	valid	|	valid	|	blank	|	blank		|
		|	invalid	|	valid	|	valid	|	blank	|	blank		|
		|	blank	|	valid	|	valid	|	blank	|	blank		|
		|	valid	|	invalid	|	valid	|	blank	|	blank		|
		|	invalid	|	invalid	|	valid	|	blank	|	blank		|
		|	blank	|	invalid	|	valid	|	blank	|	blank		|
		|	valid	|	blank	|	valid	|	blank	|	blank		|
		|	invalid	|	blank	|	valid	|	blank	|	blank		|
		|	blank	|	blank	|	valid	|	blank	|	blank		|
		|	valid	|	valid	|	invalid	|	blank	|	blank		|
		|	invalid	|	valid	|	invalid	|	blank	|	blank		|
		|	blank	|	valid	|	invalid	|	blank	|	blank		|
		|	valid	|	invalid	|	invalid	|	blank	|	blank		|
		|	invalid	|	invalid	|	invalid	|	blank	|	blank		|
		|	blank	|	invalid	|	invalid	|	blank	|	blank		|
		|	valid	|	blank	|	invalid	|	blank	|	blank		|
		|	invalid	|	blank	|	invalid	|	blank	|	blank		|
		|	blank	|	blank	|	invalid	|	blank	|	blank		|
		|	valid	|	valid	|	blank	|	blank	|	blank		|
		|	invalid	|	valid	|	blank	|	blank	|	blank		|
		|	blank	|	valid	|	blank	|	blank	|	blank		|
		|	valid	|	invalid	|	blank	|	blank	|	blank		|
		|	invalid	|	invalid	|	blank	|	blank	|	blank		|
		|	blank	|	invalid	|	blank	|	blank	|	blank		|
		|	valid	|	blank	|	blank	|	blank	|	blank		|
		|	invalid	|	blank	|	blank	|	blank	|	blank		|
		|	blank	|	blank	|	blank	|	blank	|	blank		|