<?php

namespace service;

require_once __DIR__ . '/../../Autoloader.php';

use model\ModelR;
use config\Req;
use config\Exception;
use config\JWThandler;

class AdminService
{
    public static function isAdmin(): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {
            $array = array("id" => $jwtValid["data"][0]["id"]);
            $data = ModelR::CallProcedure($array, "isAdmin", "common");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }
    public static function getAdminRang(): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {
            $array = array("id" => $jwtValid["data"][0]["id"]);
            $data = ModelR::CallProcedure($array, "getAdminRang", "common");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }
    public static function getAccountWithAllData(array $body): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {
            $data = ModelR::CallProcedure(array("id" => $body["id"],"adminId"=>$jwtValid["data"][0]["id"]), "getAccountWithAllData", "common");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }
    public static function searchAccount(array $body): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {

            $data = ModelR::CallProcedure(array("accountId"=> $jwtValid["data"][0]["id"] ,  "prompt"=>$body["prompt"],"type" => $body["type"]), "searchAccount", "common");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }

    public static function getAllTypeOfEmails(): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {

            $data = ModelR::CallProcedure(array("id"=>$jwtValid["data"][0]["id"]), "getAllTypeOfEmails", "account");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }
    public static function getAccountByTypeOfEmail($body): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {

            $data = ModelR::CallProcedure(array("id"=>$jwtValid["data"][0]["id"],"typeOfEmail"=>$body["typeOfEmail"]), "getAccountByTypeOfEmail", "account");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }

}
