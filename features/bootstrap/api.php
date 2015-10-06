<?php
/**
 * Created by PhpStorm.
 * User: chriton
 * Date: 02.07.2015
 * Time: 14:26
 */


class test_API
{
	private $apiEndpointDomain;
	const AUTH_USERNAME = 'user';
	const AUTH_PASSWORD = 'password';


	/**
	 * @param string $apiEndpointDomain
	 */
	public function __construct($apiEndpointDomain)
	{
		$this->apiEndpointDomain = "http://" . self::AUTH_USERNAME . ":" . self::AUTH_PASSWORD . "@" . $apiEndpointDomain;
	}


	/**
	 * @param $method
	 * @param array $params
	 * @return array
	 * @throws Exception
	 */
	private function call($method, $params = [])
	{
		$curl = curl_init();

		curl_setopt($curl, CURLOPT_URL, $this->apiEndpointDomain . $method);
		curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
		curl_setopt($curl, CURLOPT_POSTFIELDS, $params);

		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

		$exec = curl_exec($curl);
		$info = curl_getinfo($curl);
		curl_close($curl);

		$obj = json_decode($exec);
		$http_code = $info["http_code"];
		$raspuns = array_merge(array("http_code" => "$http_code"), (array)$obj); //we add the http response code to the array


		switch ($http_code)
		{
			case 200:		//success
				return $raspuns;
        		break;
			case 400:		//the request is missing a required parameter in the header(the token)
				return $raspuns;
        		break;
			case 401:		//access denied, wrong token
				return $raspuns;
        		break;
			default:
				throw new Exception('There was an error contacting the API endpoint.');
		}


	}


	/**
	 * @param string $dataIncarcare
	 * @param string $page
	 * @param string $access_token
	 * @return array
	 * @throws Exception
	 */
	public function getStandard($dataIncarcare = '', $page = '', $access_token = '')
	{
		try
		{
			$parametri = [];

			if($dataIncarcare != '') { $parametri = array_merge(array('dataIncarcare' => $dataIncarcare), $parametri); }
			if($page != '')          { $parametri = array_merge(array('page' => $page), $parametri); }
			if($access_token != '')  { $parametri = array_merge(array('access_token' => $access_token), $parametri); }

			$query = $this->call("/documentapi/getstandard", $parametri);
			//echo "For testing only.To be removed. I am the getStandard method with /documentapi/getstandard \n";

			return array_merge(array("method" => "getstandard"), $query);
		}
		catch(Exception $e)  //if the http response code is other than 200,400 or 401 the 'call' method will send an exception
		{
			// Process the error
			throw new Exception($e->getMessage());
		}

	}


	/**
	 * @param string $dataIncarcare
	 * @param string $page
	 * @param string $access_token
	 * @return array
	 * @throws Exception
	 */
	public function getExtended($dataIncarcare = '', $page = '', $access_token = '')
	{
		try
		{
			$parametri = [];

			if($dataIncarcare != ''){ $parametri = array_merge(array('dataIncarcare' => $dataIncarcare), $parametri); }
			if($page != '')         { $parametri = array_merge(array('page' => $page), $parametri); }
			if($access_token != '') { $parametri = array_merge(array('access_token' => $access_token), $parametri); }

			$query = $this->call("/documentapi/getextended", $parametri);
			//echo "For testing only.To be removed. I am the getExtended method with /documentapi/getextendedd \n";
			return array_merge(array("method" => "getextended"), $query);
		}
		catch(Exception $e)  //if the http response code is other than 200,400 or 401 the 'call' method will send an exception
		{
			// Process the error
			throw new Exception($e->getMessage());
		}

	}


	/**
	 * @param string $numarHotarare
	 * @param string $dataHotarare
	 * @param string $access_token
	 * @return array
	 * @throws Exception
	 */
	public function getOne($numarHotarare = '', $dataHotarare = '', $access_token = '')

	{
		try
		{
			$parametri = [];

			if($numarHotarare != ''){ $parametri = array_merge(array('numarHotarare' => $numarHotarare), $parametri); }
			if($dataHotarare != '') { $parametri = array_merge(array('dataHotarare' => $dataHotarare), $parametri); }
			if($access_token != '') { $parametri = array_merge(array('access_token' => $access_token), $parametri); }

			$query = $this->call("/documentapi/getone", $parametri);
			//echo "For testing only.To be removed. I am the getOne method with /documentapi/getone \n";
			return array_merge(array("method" => "getone"), $query);
		}
		catch(Exception $e)  //if the http response code is other than 200,400 or 401 the 'call' method will send an exception
		{
			// Process the error
			throw new Exception($e->getMessage());
		}

	}


	/**
	 * @param string $grand_type
	 * @param string $username
	 * @param string $password
	 * @param string $client_id
	 * @param string $client_secret
	 * @return array
	 * @throws Exception
	 */
	public function getToken($grand_type = '', $username = '', $password = '', $client_id = '', $client_secret = '')

	{
		try
		{
			$parametri = [];

			if($grand_type != '')   { $parametri = array_merge(array('grant_type' => $grand_type), $parametri); }
			if($username != '')     { $parametri = array_merge(array('username' => $username), $parametri); }
			if($password != '')     { $parametri = array_merge(array('password' => $password), $parametri); }
			if($client_id != '')    { $parametri = array_merge(array('client_id' => $client_id), $parametri); }
			if($client_secret != ''){ $parametri = array_merge(array('client_secret' => $client_secret), $parametri); }

			$query = $this->call("/oauth/access_token", $parametri);
			//echo "For testing only.To be removed. I am the getToken method with /oauth/access_token \n";
			return array_merge(array("method" => "gettoken"), $query);
		}

		catch(Exception $e)  //if the http response code is other than 200,400 or 401 the 'call' method will send an exception
		{
			// Process the error
			throw new Exception($e->getMessage());
		}
	}

}