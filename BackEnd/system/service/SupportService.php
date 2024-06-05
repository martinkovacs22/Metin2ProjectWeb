<?php

namespace service;

require_once __DIR__ . '/../../Autoloader.php';

use model\ModelR;
use config\Exception;
use config\JWThandler;
use config\Req;

class SupportService
{
    public static function CreateSupport($body): array
    {
        if (
            isset($body["email"]) &&
            isset($body["type"])
        ) {

            $jwtvalidate = JWThandler::verifyJWT(Req::getReqToken());


            $sendArray = array('id' => "Sup" . $body['type'] . rand(100, 999), 'accountId' => $jwtvalidate["data"][0]["id"], 'type' => $body["type"]);
            return ModelR::CallProcedure($sendArray, "CreateSupport", "web");
        } else {
            return array("err" => true, "data" => "Incorrect Data");
        }
    }
    public static function getMessageBySupportId($body): array
    {
        if (
            isset($body["id"])
        ) {

            $jwtvalidate = JWThandler::verifyJWT(Req::getReqToken());

            if (isset($jwtvalidate["data"][0]["id"])) {
                $sendArray = array('id' => $body["id"]);
                return ModelR::CallProcedure($sendArray, "getMessageBySupportId", "web");
            } else {
                return array("err" => true, "data" => "Not Valid JWT");
            }
        } else {
            return array("err" => true, "data" => "Incorrect Data");
        }
    }
    public static function getAllSupportByAccountId(): array
    {


        $jwtvalidate = JWThandler::verifyJWT(Req::getReqToken());

        if (isset($jwtvalidate["data"][0]["id"])) {
            $sendArray = array('accountId' => $jwtvalidate["data"][0]["id"]);
            return ModelR::CallProcedure($sendArray, "getAllSupportByAccountId", "web");
        } else {
            return array("err" => true, "data" => "Not Valid JWT");
        }
    }
    public static function setInActiveMessage(array $body): array
    {

        if (isset($body["id"])) {
            $jwtvalidate = JWThandler::verifyJWT(Req::getReqToken());

            if (isset($jwtvalidate["data"][0]["id"])) {
                $sendArray = array('supportId' => $body["id"]);
                return ModelR::CallProcedure($sendArray, "setInActiveMessage", "web");
            } else {
                return array("err" => true, "data" => "Not Valid JWT");
            }
        } else {
            return array("err" => true, "data" => "Incorrect Data");
        }
    }
    public static function addMessage(array $body): array
    {

        $need = array(
            "supportId",
            "userSend",
            "adnimSend",
            "userFileId",
            "adminFileId",
            "adminId"
        );
        $runable = true;
        foreach ($body as $key => $value) {

            if (!in_array($key, $need, true)) {
                $runable = false;
            }
        }


        if ($runable) {

            $jwtvalidate = JWThandler::verifyJWT(Req::getReqToken());

            if (isset($jwtvalidate["data"][0]["id"])) {
                $sendArray = array(
                    "supportId" => $body["supportId"],
                    "userSend" => $body["userSend"],
                    "adnimSend" => $body["adnimSend"],
                    "userFileId" => $body["userFileId"],
                    "adminFileId" => $body["adminFileId"],
                    "adminId" => $body["adminId"]
                );
                return ModelR::CallProcedure($sendArray, "addMessage", "web");
            } else {
                return array("err" => true, "data" => "Not Valid JWT");
            }
        } else {
            return array("err" => true, "data" => "Incorrect Data", "body" => $body);
        }
    }
}
