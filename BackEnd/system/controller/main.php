<?php
session_start();
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Headers:Content-Type,Authorization,X-Requested-With,token");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Credentials:true");
header("Content-Type:application/json");
header("Access-Control-Allow-Methods:POST,OPTIONS");


 use config\Req;
use controller\HomeController;
use controller\AdminController;
use config\Exception;
use config\HttpStatus;
use controller\SignController;
use controller\ThrowErrorController;
use controller\RanglistController;
use controller\SupportController;
 require_once __DIR__ . '/../../Autoloader.php';
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

Req::CONFIG_OPTIMALIZATION();
  $logFile = __DIR__ . '/../../change_log.txt';

    $headerCode_Res;

if (Req::getReqMethod() === "POST") {

   if(method_exists(SignController::class, Req::getReqFun())) {
        SignController::{Req::getReqFun()}();
        $headerCode_Res =  SignController::$res->getStatus_code();
    }
    elseif(method_exists(HomeController::class, Req::getReqFun())) {
        HomeController::{Req::getReqFun()}();
        $headerCode_Res =  HomeController::$res->getStatus_code();
    }
    elseif(method_exists(AdminController::class, Req::getReqFun())) {
        AdminController::{Req::getReqFun()}();
        $headerCode_Res =  AdminController::$res->getStatus_code();
    }
    elseif(method_exists(RanglistController::class, Req::getReqFun())) {
        RanglistController::{Req::getReqFun()}();
        $headerCode_Res =  RanglistController::$res->getStatus_code();
    }
    elseif(method_exists(SupportController::class, Req::getReqFun())) {
        SupportController::{Req::getReqFun()}();
        $headerCode_Res =  SupportController::$res->getStatus_code();
    }
    else {
        ThrowErrorController::ThrowError(array("err"=>true,"data"=>"No Valid Method"),HttpStatus::METHOD_NOT_ALLOWED);
    }
    if (!file_exists($logFile)) {
        touch($logFile);
        chmod($logFile, 0666);
    }
    // print_r($headerCode_Res);
    if (!empty(Req::getReqBody())) {
        $body = Req::getReqBody();

        $body["password"] = isset($body["password"])? hash("sha256", $body["password"]):false;
        $data = date('Y-m-d H:i:s') . " - " . json_encode($body) ."/ip : ".Req::getIP(). " / route : ". Req::getReqFun(). " / Status : {$headerCode_Res}" . "\n";
        file_put_contents($logFile, $data, FILE_APPEND | LOCK_EX);
        // echo"fds";
    }
}else {
    $logFile = __DIR__ . '/../../change_log.txt';

    $headerCode_Res = 404;
    if (!file_exists($logFile)) {
        touch($logFile);
        chmod($logFile, 0666);
    }
    // print_r($headerCode_Res);
        $body = Req::getReqBody();

        $body["password"] = isset($body["password"])? hash("sha256", $body["password"]):false;
        $data = date('Y-m-d H:i:s') . " - " . json_encode($body) ."/ip : ".Req::getIP(). " / route : ". Req::getReqFun(). " / Status : {$headerCode_Res}" . "\n";
        file_put_contents($logFile, $data, FILE_APPEND | LOCK_EX);
        // echo"fds";
    //Exception::msg(array("err" => true, "data" => Req::getReqMethod() . " not found."));
}
