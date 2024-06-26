<?php



namespace config;









use model\ModelR;

require_once __DIR__ . '/../../Autoloader.php';

class Req

{

	static public $body;

	static public $fun;

	static public $method;

	static public $funNum = 5;

	static public $token;



	static public $userData;



	static public array $fileData;

	static public function getReqBody(): array

	{

		try {

			return json_decode(file_get_contents('php://input'), true);

		} catch (\Throwable $th) {

			return array();

		}

	}



	static public function setUserData($verifyToken){

		Req::$userData = $verifyToken;

	}

	static public function getUserData(){

		return Req::$userData;

	}



	static public function getIP(){

		return $_SERVER['REMOTE_ADDR'];

	}



	static public function getReqFun(): string

	{

		try {

			return isset(explode("/", $_SERVER['REQUEST_URI'])[Req::$funNum]) ? explode("/", $_SERVER['REQUEST_URI'])[Req::$funNum] : "";

		} catch (\Throwable $th) {

			return "";

		}

	}

	static public function getReqMethod(): string

	{

		return $_SERVER['REQUEST_METHOD'];

	}

	static public function getReqToken(): string | null

	{
		$token = null;

		$token = isset(getallheaders()["token"]) ? getallheaders()["token"] : null;
		$token = isset(getallheaders()["Token"]) && $token == null ? getallheaders()["Token"] : null;
		return $token;
	}

	static public function CONFIG_OPTIMALIZATION()

	{



		$CONFIG_DATA = parse_ini_file(__DIR__ . "/../../config.ini", true);



		foreach ($CONFIG_DATA as $key => $value) {



			// if ($key == "header") {

			// 	foreach ($CONFIG_DATA[$key] as $headerKey => $headerValue) {

			// 		$dataFromHeaderValue = "";

			// 		foreach ($CONFIG_DATA[$key][$headerKey] as $headerDataKey => $headerDataValue) {

			// 			$dataFromHeaderValue = $dataFromHeaderValue . $headerDataValue;

			// 		}

			// 		header($headerKey . ":" . $dataFromHeaderValue);

			// 	}

			// } else

			if ($key == "db") {

				foreach ($CONFIG_DATA[$key] as $dbKey => $dbValue) {

					$_SESSION[$key][$dbKey] = $dbValue;

				}

			}

		}

	}

//	static public function getTokenDataValue(): array | null{

//		if(Req::getReqToken() != null){

//	

//			$verifyToken = JWThandler::verifyJWT(Req::getReqToken());

//			if ($verifyToken === false) {

//				

//				Exception::msg(array("err"=>true,"data"=>"Can Not Verify the Token"),HttpStatus::SERVICE_UNAVAILABLE);

//			}else{

//				//print_r(json_encode($verifyToken));

//				return is_array($verifyToken["data"]["data"])?Req::setUserData($verifyToken["data"]["data"][0]):null;

//			}

//		}

//	}

}







if (isset(Req::getReqBody()['file'])) {

	$File_Data = base64_decode(Req::getReqBody()['file']['content']);

	$bool = true;

	$num = 0;

	while ($bool) {

		$potentialFileName =  __DIR__ . "\\FILES\\" . Req::getReqBody()['file']['name'] . "(" . $num . ")" . "." . Req::getReqBody()['file']['extension'];

		if (!file_exists($potentialFileName)) {

			$bool = false;

		} else {

			$num++;

		}

	}





	Req::$fileData["name"] = Req::getReqBody()['file']['name'];

	Req::$fileData["userID"] = Req::getReqBody()['file']['userID'];

	Req::$fileData["url"] = str_replace("C:\\xampp\\htdocs","http://localhost",__DIR__ . "\\FILES\\" . Req::getReqBody()['file']['name'] . "(" . $num . ")" . "." . Req::getReqBody()['file']['extension']);

	Req::$fileData["type"] = Req::getReqBody()['file']['type'];

	Req::$fileData["extension"] = Req::getReqBody()['file']['extension'];

	Req::$fileData["size"] = Req::getReqBody()['file']['size'];

	if (

		Req::$fileData["name"] != null &&

		Req::$fileData["userID"] != null &&

		Req::$fileData["url"] != null &&

		Req::$fileData["type"] != null &&

		Req::$fileData["extension"] != null &&

		Req::$fileData["size"] != null

	) {

		file_put_contents(__DIR__ . "\\FILES\\" . Req::getReqBody()['file']['name'] . "(" . $num . ")" . "." . Req::$fileData["extension"], $File_Data);



		$dataFormDataBase = ModelR::CallProcedure(Req::$fileData, "createFile");

		Req::$fileData =  $dataFormDataBase["data"][0];

	}

}



