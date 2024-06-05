<?php

namespace service;

require_once __DIR__ . '/../../Autoloader.php';

use model\ModelR;
use config\Exception;
use config\HttpStatus;
use config\JWThandler;
use config\Req;
use Error;

class SignService
{
  public static function signUp(array $body): array
  {
    if (
      isset($body["login"]) &&
      isset($body["email"]) &&
      isset($body["socialId"]) &&
      isset($body["password"])
    ) {
      // Ellenőrizd a login hosszát
      if (strlen($body["login"]) < 5) {
        Exception::msg(array("err" => true, "data" => "username"), HttpStatus::UNAUTHORIZED);
      }

      // Ellenőrizd az email cím formátumát
      if (!filter_var($body["email"], FILTER_VALIDATE_EMAIL)) {
        Exception::msg(array("err" => true, "data" => "email"), HttpStatus::UNAUTHORIZED);
      }

      // Ellenőrizd a jelszó hosszát és komplexitását
      $password = $body["password"];
      if (strlen($password) < 8 || !preg_match('/[A-Z]/', $password) || !preg_match('/[a-z]/', $password)) {
        Exception::msg(array("err" => true, "data" => "password"), HttpStatus::UNAUTHORIZED);
      }

      // Ha minden rendben van, hajtsd végre a regisztrációt

      return ModelR::CallProcedure(array(
        "login" => $body["login"],
        "email" => $body["email"],
        "socialId" => $body["socialId"],
        "password" =>  $password
      ), "signUp", "account");
    } else {
      return array("err" => true, "data" => "Nincs elég adat.");
    }
  }
  public static function verifyLogin(): array
{
    try {
        $oldJwt = JWThandler::verifyJWT(Req::getReqToken());

        if (isset($oldJwt["data"][0]["id"])) {
            $newJwt = JWThandler::generateJWT($oldJwt["data"]);
            return array("err" => false, "jwt" => $newJwt);
        }

        throw new \RuntimeException("Nem jó a verify: hiányzik az 'id' kulcs az adatokban.");
    } catch (\Throwable $th) {
        return array("err" => true, "jwt" => null);
    }
}

  public static function login(array $body): array
  {

    if (
      isset($body["login"]) &&
      isset($body["password"])
    ) {
      // Ellenőrizd a login hosszát
      if (strlen($body["login"]) < 5) {
        Exception::msg(array("err" => true, "data" => "username"), HttpStatus::FORBIDDEN);
      }
      // Ellenőrizd a jelszó hosszát és komplexitását
      $password = $body["password"];
      if (strlen($password) < 8 || !preg_match('/[A-Z]/', $password) || !preg_match('/[a-z]/', $password)) {
        Exception::msg(array("err" => true, "data" => "password"), HttpStatus::FORBIDDEN);
      }

      // Ha minden rendben van, hajtsd végre a regisztrációt
      $model =  ModelR::CallProcedure(array(
        "login" => $body["login"],
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

  public static function logout(): array{
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
