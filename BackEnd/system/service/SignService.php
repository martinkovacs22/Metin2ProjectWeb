<?php

namespace service;

require_once __DIR__ . '/../../Autoloader.php';

use model\ModelR;
use config\Exception;
use config\HttpStatus;
use config\JWThandler;
use config\Base_Reg_Setting;
use config\Req;
use Error;

class SignService
{
  public static function signUp(array $body)
  {
   
if(isset($body["login"])&&    
isset($body["password"])&&
isset($body["real_name"])&&
isset($body["social_id"])&&
isset($body["email"])&&
isset($body["phone1"])&&
isset($body["address"])&&
isset($body["zipcode"])&&
isset($body["language"])){

  $baseRegSettingClass = new Base_Reg_Setting();

 
  $model =  ModelR::CallProcedure(array(
"login"=>$body["login"],
"password"=>$body["password"],
"real_name"=>$body["real_name"],
"social_id"=>$body["social_id"],
"email"=>$body["email"],
"phone1"=>$body["phone1"],
"address"=>$body["address"],
"zipcode"=>$body["zipcode"],
"language"=>$body["language"],
"base_cash"=>$baseRegSettingClass->getbaseCash(),
"base_gold_expire"=>$baseRegSettingClass->getbaseGold(),
"base_silver_expire"=>$baseRegSettingClass->getbaseSilver(),
"base_safebox_expire"=>$baseRegSettingClass->getbaseSafeBox(),
"base_autoloot_expire"=>$baseRegSettingClass->getbaseAutoLoot(),
"base_fish_mind_expire"=>$baseRegSettingClass->getbaseFish(),
"base_money_drop_rate_expire"=>$baseRegSettingClass->getbaseMoney()
  ), "signup", "account");
return $model;
}else{
  Exception::msg(array("err"=>true,"data"=>"Valamit nem talált meg"));
}

  }
  public static function verifyLogin()
  {
      try {
          $token = Req::getReqToken();
          if ($token === null) {
              throw new \RuntimeException("Token hiányzik a kérésekből.");
          }
  
          $oldJwt = JWThandler::verifyJWT($token);
          if (isset($oldJwt["data"][0]["id"])) {
              $newJwt = JWThandler::generateJWT($oldJwt["data"]);
              return array("err" => false, "jwt" => $newJwt);
          }
  
          throw new \RuntimeException("Nem jó a verify: hiányzik az 'id' kulcs az adatokban.");
      } catch (\Throwable $th) {
          return array("err" => true, "jwt" => null, "data" => $th->getMessage());
      }
  }

  public static function login(array $body)
  {
   
    if (
      isset($body["loginAndEmail"]) &&
      isset($body["password"])
    ) {
      // Ellenőrizd a login hosszát
      if (strlen($body["loginAndEmail"]) < 5) {
        Exception::msg(array("err" => true, "data" => "username"), HttpStatus::FORBIDDEN);
      }
      // Ellenőrizd a jelszó hosszát és komplexitását
      $password = $body["password"];
      if (strlen($password) < 8 || !preg_match('/[A-Z]/', $password) || !preg_match('/[a-z]/', $password)) {
        Exception::msg(array("err" => true, "data" => "password"), HttpStatus::FORBIDDEN);
      }

      // Ha minden rendben van, hajtsd végre a regisztrációt
      $model =  ModelR::CallProcedure(array(
        "loginAndEmail" => $body["loginAndEmail"],
        "password" =>  $body["password"]
      ), "login", "account");
      //print_r($model);
      
      if (!$model["err"]) {
        $userJWT = JWThandler::generateJWT($model["data"]);
        
        //   if (array_key_exists("password", $model["data"][0]["password"])) {
      //     unset($model["data"][0]["password"]);
      // }
 
        $returnValue = array("err" => false, "jwt" => $userJWT,"data"=>$model["data"]);
        return $returnValue;
      } else {
        $returnValue = array("err" => true, "jwt" => null,"data"=>null);
        return $returnValue;
      }
    } else {
      return array("err" => true, "jwt" => null,"data"=>null);
    }
  }

  public static function logout(){
    date_default_timezone_set('Europe/Budapest'); // Helyi időzóna beállítása

    $tokenValue = JWThandler::verifyJWT(Req::getReqToken());


// Dátum/idő string konvertálása timestamp formátummá
$tokenTimestamp = strtotime($tokenValue["data"][0]['at_login']);
$currentDateTime = date('Y-m-d H:i:s');

// Token értéke
$tokenDateTime = $tokenValue["data"][0]['at_login'];

// Jelenlegi időpont átalakítása időbélyeggé
$currentTimestamp = strtotime($currentDateTime);

// Token időpont átalakítása időbélyeggé
$tokenTimestamp = strtotime($tokenDateTime);

// Különbség számolása a két időbélyeg között
$secondsDifference =  $currentTimestamp - $tokenTimestamp;

// Különbség kiszámítása percekben
$minutesDifference = round($secondsDifference / 60);

echo $minutesDifference;

    $returnValue = ModelR::CallProcedure(array("accountId"=>$tokenValue["data"][0]["id"],"minute"=>$minutesDifference,"isWebLogin"=>1),"logout","web");
    if ($returnValue["err"]) {
      return array("err" => true,"data"=>null);
    }
    return array("err" => false,"data"=>$returnValue);
  }

}
