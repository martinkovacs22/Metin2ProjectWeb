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
    public static function getAllAccountWithAllData(): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {
            $data = ModelR::CallProcedure(array("id" => $jwtValid["data"][0]["id"]), "getAllAccountWithAllData", "account");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }
    public static function searchAccount($body): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {

            $data = ModelR::CallProcedure(array("id" => $body["propt"], "type" => $body["type"]), "searchAccount", "account");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }
    public static function getAllPlayerWithAllData(): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {
            $data = ModelR::CallProcedure(array("id" => $jwtValid["data"][0]["id"]), "getAllPlayerWithAllData", "player");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }
    public static function searchPlayer($body): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());
        if (isset($jwtValid["data"][0]["id"])) {

            $data = ModelR::CallProcedure(array("id" => $body["propt"], "type" => $body["type"]), "searchPlayer", "player");
            return $data;
        }
        return array("err" => true, "data" => "Nem tartalmaz megfelelő Adatot");
    }
    public static function search($body): array
    {
        $jwtValid = JWThandler::verifyJWT(Req::getReqToken());

        

        if (
            isset($jwtValid["data"][0]["id"])
            && isset($body["inputText"])
            && isset($body["isAccount"])
            && isset($body["isCharacter"])
            && isset($body["isEmail"])
            && isset($body["isId"])
            && isset($body["isPontos"])
            && isset($body["name"])
            && isset($body["ip"])
        ) {

            $data = ModelR::CallProcedure(array(
                "id"=>$jwtValid["data"][0]["id"],
                "inputText" => $body["inputText"],
                "isAccount" => $body["isAccount"],
                "isCharacter" => $body["isCharacter"],
                "isEmail" => $body["isEmail"],
                "isId" => $body["isId"],
                "isPontos" => $body["isPontos"],
                "name" => $body["name"],
                "ip" => $body["ip"]
            ), "search", "account");
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
