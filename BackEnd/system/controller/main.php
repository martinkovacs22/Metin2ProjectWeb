<?php
session_start();
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Headers:Content-Type,Authorization,X-Requested-With,token");
header("Access-Control-Max-Age:86400");
#header("Access-Control-Allow-Credentials:true");

header("Access-Control-Allow-Methods:GET,POST,OPTIONS");


use config\Req;
use controller\HomeController;
use controller\AdminController;
use config\Exception;
use config\HttpStatus;
use controller\SignController;
use controller\ThrowErrorController;
use controller\RanglistController;
use controller\LanguageController;
use controller\SupportController;
use config\Base_Reg_Setting;

require_once __DIR__ . '/../../Autoloader.php';
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

Req::CONFIG_OPTIMALIZATION();
$logFile = __DIR__ . '/../../change_log.txt';

$headerCode_Res;

if (Req::getReqMethod() === "POST") {
    header("Content-Type:application/json");
    if (method_exists(SignController::class, Req::getReqFun())) {
        SignController::{Req::getReqFun()}();
        $headerCode_Res =  SignController::$res->getStatus_code();
    } elseif (method_exists(HomeController::class, Req::getReqFun())) {
        HomeController::{Req::getReqFun()}();
        $headerCode_Res =  HomeController::$res->getStatus_code();
    } elseif (method_exists(AdminController::class, Req::getReqFun())) {
        AdminController::{Req::getReqFun()}();
        $headerCode_Res =  AdminController::$res->getStatus_code();
    } elseif (method_exists(RanglistController::class, Req::getReqFun())) {
        RanglistController::{Req::getReqFun()}();
        $headerCode_Res =  RanglistController::$res->getStatus_code();
    } elseif (method_exists(LanguageController::class, Req::getReqFun())) {
        LanguageController::{Req::getReqFun()}();
        $headerCode_Res =  LanguageController::$res->getStatus_code();
    }
    // elseif(method_exists(SupportController::class, Req::getReqFun())) {
    //     SupportController::{Req::getReqFun()}();
    //     $headerCode_Res =  SupportController::$res->getStatus_code();
    // }
    else {
        ThrowErrorController::ThrowError(array("err" => true, "data" => "No Valid Method"), HttpStatus::METHOD_NOT_ALLOWED);
    }
    if (!file_exists($logFile)) {
        touch($logFile);
        chmod($logFile, 0666);
    }
    // print_r($headerCode_Res);
    if (!empty(Req::getReqBody())) {
        $body = Req::getReqBody();

        $body["password"] = isset($body["password"]) ? hash("sha256", $body["password"]) : false;
        $data = date('Y-m-d H:i:s') . " - " . json_encode($body) . "/ip : " . Req::getIP() . " / route : " . Req::getReqFun() . " / Status : {$headerCode_Res}" . "\n";
        file_put_contents($logFile, $data, FILE_APPEND | LOCK_EX);
        // echo"fds";
    }
} else if (Req::getReqMethod() === "GET") {
    $reqFun = Req::getReqFun();
    $fileExtension = pathinfo($reqFun, PATHINFO_EXTENSION);
    $fileBaseName = pathinfo($reqFun, PATHINFO_FILENAME);

    // Kép fájlok kezelése (png vagy jpg)
    if ($fileExtension && ($fileExtension == "png" || $fileExtension == "jpg") && file_exists(__DIR__ . "/../img/buttons/" . $reqFun)) {
        header('Content-Type: image/' . $fileExtension);
        readfile(__DIR__ . "/../img/buttons/" . $reqFun);
        return;
    }

    // HTML fájlok kezelése
    if (file_exists(__DIR__ . '/html/' . $reqFun . '.html')) {
        header('Content-Type: text/html; charset=utf-8');
        $doc = new DOMDocument();
        $doc->loadHTML(file_get_contents(__DIR__ . '/html/' . $reqFun . '.html'));
        echo $doc->saveHTML();
        return;
    }

    // JavaScript fájlok kezelése
    if (file_exists(__DIR__ . '/js/' . $reqFun . '.js')) {
        header('Content-Type: application/javascript');
        readfile(__DIR__ . '/js/' . $reqFun . '.js');
        return;
    }

    // CSS fájlok kezelése
    if (file_exists(__DIR__ . '/css/' . $reqFun . '.css')) {
        header('Content-Type: text/css');
        readfile(__DIR__ . '/css/' . $reqFun . '.css');
        return;
    }

    // Főoldal kezelése
    if (($reqFun == "main.php" || $reqFun == "main" || $reqFun == "") && file_exists(__DIR__ . '/html/baseSideHTML.html')) {
        $doc = new DOMDocument();
        $doc->loadHTML(file_get_contents(__DIR__ . '/html/baseSideHTML.html'));
        echo $doc->saveHTML();
        return;
    }

    // 404-es oldal kezelése
    header('Content-Type: text/html; charset=utf-8');
    $doc = new DOMDocument();
    $doc->loadHTML(file_get_contents(__DIR__ . '/html/404.html'));
    echo $doc->saveHTML();
}
else {
    header("Content-Type:application/json");
    $logFile = __DIR__ . '/../../change_log.txt';

    $headerCode_Res = 404;
    if (!file_exists($logFile)) {
        touch($logFile);
        chmod($logFile, 0666);
    }
    // print_r($headerCode_Res);
    $body = Req::getReqBody();

    $body["password"] = isset($body["password"]) ? hash("sha256", $body["password"]) : false;
    $data = date('Y-m-d H:i:s') . " - " . json_encode($body) . "/ip : " . Req::getIP() . " / route : " . Req::getReqFun() . " / Status : {$headerCode_Res}" . "\n";
    file_put_contents($logFile, $data, FILE_APPEND | LOCK_EX);
    $baseReg = new Base_Reg_Setting();

    print_r($baseReg->convertToArray());
    // echo"fds";
    //Exception::msg(array("err" => true, "data" => Req::getReqMethod() . " not found."));
}
