<?php
/**
 * Created by PhpStorm.
 * User: chriton
 * Date: 08.07.2015
 * Time: 17:15
 *
 * Access methods and variables of the FeatureContext class (including mink methods) from insisde ApiContext.php:
 * $this->getMainContext()->visit('/');
 * $this->getMainContext()->variabila_test;
 *
 * Access methods and variables of the ApiContext class from insisde FeatureContext.php:
 * $this->getMainContext()->getSubcontext('ApiContext')->method();
 * $this->getMainContext()->getSubcontext('ApiContext')->variabila_test;
 *
 * Note that PhpStorm will not recognise the methods or variables and will raise a warning, but it will work:
 * Method 'visit' not found in class ...
 * Field 'variabila_test' not found in class...
 */

use Behat\Behat\Context\ClosuredContextInterface,
	Behat\Behat\Context\TranslatedContextInterface,
	Behat\Behat\Context\BehatContext,
	Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
	Behat\Gherkin\Node\TableNode;


//
// Require 3rd-party libraries here:
//
//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';
//
require_once 'api.php';

/**
 * Features context.
 */
class ApiContext extends BehatContext
{
	/**
	 * Initializes context.
	 * Every scenario gets its own context object.
	 *
	 * @param array $parameters context parameters (set them up through behat.yml)
	 */

	//-------for the getToken method-------
	const GRANT_TYPE = 'password';
	const USERNAME = 'test@test.com';
	const PASSWORD = '1111';
	const CLIENT_ID = 'THE_API_CLIENT';
	const CLIENT_SECRET = 'secret';
	//-------------------------------------

	private static $parameter = array(
	'valid_username' => self::USERNAME,
	'invalid_username' => 'xx',
	'blank_username' => '',

	'valid_password' => self::PASSWORD,
	'invalid_password' => 'xx',
	'blank_password' => '',

	'valid_grand_type' => self::GRANT_TYPE,
	'invalid_grand_type' => 'xx',
	'blank_grand_type' => '',

	'valid_client_id' => self::CLIENT_ID,
	'invalid_client_id' => 'xx',
	'blank_client_id' => '',

	'valid_client_secret' => self::CLIENT_SECRET,
	'invalid_client_secret' => 'xx',
	'blank_client_secret' => ''
	);

	private static $the_auth_token = '';
	private static $api_response = [];

	private static $requested_dataIncarcare = '';
	private static $requested_page = '';

	private static $requested_numarHotarare = '';
	private static $requested_dataHotarare = '';


	public function __construct(array $parameters)
	{

	}

	/**
	 * @Given /^I have no authentication token$/
	 */
	public function iHaveNoAuthenticationToken()
	{
		self::$the_auth_token = '';
	}

	/**
	 * @Given /^I have an invalid authentication token$/
	 */
	public function iHaveAnInvalidAuthenticationToken()
	{
		self::$the_auth_token = 'test';
	}

	/**
	 * @Given /^I have a valid authentication token$/
	 */
	public function iHaveAValidAuthenticationToken()
	{
		$my_api = new test_API("test.api.com");

		try
		{
			$obj = $my_api->getToken(self::GRANT_TYPE, self::USERNAME, self::PASSWORD, self::CLIENT_ID, self::CLIENT_SECRET);

			if($obj["http_code"] == 200)
			{
				self::$the_auth_token = $obj["access_token"];
				//print_r($obj);
				echo "\n Access token = " . self::$the_auth_token . "\n";
			}
			else
			{
				//this means the http response code is either 400 or 401
				print_r($obj);
				throw new Exception("Expecting HTTP response to be 200 but received " .  $obj["http_code"]);
			}


		}

		catch(Exception $e)  //if the http response code is other than 200,400 or 401 the getToken method will send an exception
		{
			// Process the error
			throw new Exception($e->getMessage());
		}

	}

	/**
	 * @Given /^I send a POST request to the \'([^\']*)\' method with the values:$/
	 */
	public function iSendAPOSTRequestToTheMethodWithTheValues($method, TableNode $table)
	{
		$tabel = $table->getRowsHash();

		$my_api = new test_API("test.api.com");

		try
		{
			switch($method)
			{
				case 'getstandard':
					self::$api_response = $my_api->getStandard($tabel["dataIncarcare"],$tabel["page"], self::$the_auth_token);
					self::$requested_dataIncarcare = $tabel["dataIncarcare"];
					self::$requested_page = $tabel["page"];
					break;
				case 'getextended':
					self::$api_response = $my_api->getExtended($tabel["dataIncarcare"],$tabel["page"], self::$the_auth_token);
					self::$requested_dataIncarcare = $tabel["dataIncarcare"];
					self::$requested_page = $tabel["page"];
					break;
				case 'getone':
					self::$api_response = $my_api->getOne($tabel["numarHotarare"],$tabel["dataHotarare"], self::$the_auth_token);
					self::$requested_numarHotarare = $tabel["numarHotarare"];
					self::$requested_dataHotarare = $tabel["dataHotarare"];
					break;
				case 'gettoken':
					self::$api_response = $my_api->getToken($tabel["grand_type"],$tabel["username"],$tabel["password"],$tabel["client_id"],$tabel["client_secret"]);
					break;
				default:
					throw new Exception("The method '$method' does not exist in the API.");
			}


		}
		catch(Exception $e)  //if the http response code is other than 200,400 or 401 the 'getStandard','getOne' etc methods will send an exception
		{
			// Process the error
			throw new Exception($e->getMessage());
		}
	}

	/**
	 * @Then /^the HTTP response should be \'([^\']*)\'$/
	 */
	public function theHTTPResponseShouldBe($arg)
	{
		$api_response = self::$api_response["http_code"];

		if($api_response != $arg)
		{
			throw new Exception("Expecting HTTP response to be $arg but received $api_response.");
		}

		else
		{
			//do we print the http code in case of success?
			//echo "http_code =$api_response ";
		}

	}

	/**
	 * @Given /^I should receive an error from the API$/
	 */
	public function iShouldReceiveAnErrorFromTheAPI()
	{
		if(!isset(self::$api_response["error"]))
		{
			throw new Exception("The API should have sent an error but it didn't !");
		}

		else
		{
			print_r(self::$api_response);
		}

	}

	/**
	 * @Given /^I should receive the requested data from the API$/
	 */
	public function iShouldReceiveTheRequestedDataFromTheAPI()
	{
		//this works only for getStandard,getExtended,getOne methods

		$api_response = (array)self::$api_response["response"];

		//note that we arrive here only if the http response is 200
		//if http is 200 we have only 2 possibilities of failure - the requested data is not found or we didn't sent all the parameters
		if($api_response["success"] == false)  //the search did't had any results or there is a parameter missing in the search (eg. dataIncarcare)
		{
			print_r($api_response["messages"][0]);
			throw new Exception("There was an error receiving data from the API");
		}

		else
		{
			if(self::$api_response["method"] == 'getone')
			{
				$received_numarHotarare = self::$api_response["response"]->results[0]->numar;
				$received_dataHotarare = date("Y-m-d",self::$api_response["response"]->results[0]->data->sec);

				echo "Expected numarHotarare: " . self::$requested_numarHotarare ."\nReceived numarHotarare: $received_numarHotarare\n" ;
				echo "\nExpected dataHotarare: " . self::$requested_dataHotarare . "\nReceived dataHotarare: $received_dataHotarare\n" ;

				if((self::$requested_numarHotarare != $received_numarHotarare) || (self::$requested_dataHotarare != $received_dataHotarare))
				{
					throw new Exception("We've received wrong data from the API");
				}
			}

			else  //getstandard or getextended methods
			{
				$nr_results_returned = count($api_response["results"]->data);
				$expected_results = ($api_response["results"]->to - $api_response["results"]->from) + 1;
				$received_current_page = $api_response["results"]->current_page;

				echo "Expected results: $expected_results. From {$api_response["results"]->from} to {$api_response["results"]->to}\n";
				echo "Received results: $nr_results_returned  \n";

				echo "\nExpected page: " . self::$requested_page . "\nReceived page: $received_current_page\n";

				if (($expected_results != $nr_results_returned) || (self::$requested_page != $received_current_page))
				{
					throw new Exception("We've received wrong data from the API");
				}

				//print_r($api_response["results"]);   //to do - do not print document_content key, array pop?
			}

		}

	}

	/**
	 * @Given /^the error code returned by the API should be \'([^\']*)\'$/
	 */
	public function theErrorCodeReturnedByTheAPIShouldBe($arg1)
	{
		$erorr_code = self::$api_response['response']->messages[0]->errorCode;
		$erorr_message = self::$api_response['response']->messages[0]->errorMessage;


		if($erorr_code != $arg1)
		{
			throw new Exception("Expecting error code to be $arg1 but received $erorr_code.");
		}

		else
		{
			echo "Error code received is correct: $erorr_code. \nError message received is correct: $erorr_message\n";
		}

	}

	/**
	 * @Given /^I request a token with a (.*) username, (.*) password, (.*) grand_type, (.*) client_id and (.*) client_secret$/
	 */
	public function iRequestATokenWithAUsernamePasswordGrand_typeClient_idAndClient_secret($username, $password, $grand_type, $client_id, $client_secret)
	{
//		$parameter["{$username}_username"]
//		$parameter["{$password}_password"]
//		$parameter["{$grand_type}_grand_type"]
//		$parameter["{$client_id}_client_id"]
//		$parameter["{$client_secret}_client_secret"]

		$my_api = new test_API("test.api.com");

	try
 		{
		self::$api_response = $my_api->getToken(self::$parameter["{$grand_type}_grand_type"],self::$parameter["{$username}_username"],self::$parameter["{$password}_password"],self::$parameter["{$client_id}_client_id"],self::$parameter["{$client_secret}_client_secret"]);
		//var_dump(self::$api_response);
		}

	catch(Exception $e)  //if the http response code is other than 200,400 or 401 the 'getToken' method will send an exception
	{
		// Process the error
		throw new Exception($e->getMessage());
	}

	}

	/**
	 * @Given /^I should receive a valid authentication token from the API$/
	 */
	public function iShouldReceiveAValidAuthenticationTokenFromTheAPI()
	{
		if(strlen(self::$api_response["access_token"])<40)
		{
			throw new Exception("Invalid token received.");
		}
		echo "\nAccess token = " . self::$api_response["access_token"] . "\n";
	}

}