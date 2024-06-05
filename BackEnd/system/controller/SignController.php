<?php

namespace controller;

require_once __DIR__ . '/../../Autoloader.php';



use config\Req;
use config\Res;
use config\HttpStatus;
use config\Exception;
use service\SignService;

class SignController{
    public static Res $res;

    public static function signUp(){
        
        self::$res = new Res();
        $serviceData = SignService::signUp(Req::getReqBody());
        self::$res->setBody($serviceData);
        $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::BAD_REQUEST) : self::$res->setStatus_code(HttpStatus::OK);
        self::$res->send();
    }

    public static function login(){
        self::$res = new Res();
        $serviceData = SignService::login(Req::getReqBody());
        self::$res->setBody($serviceData);
        //print_r($serviceData);
        $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::BAD_REQUEST) : self::$res->setStatus_code(HttpStatus::OK);
        self::$res->send();
    }
    public static function logout(){
        self::$res = new Res();
        $serviceData = SignService::logout();
        self::$res->setBody($serviceData);
        self::$res->addCookie("token","");
        //print_r($serviceData);
        $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::BAD_REQUEST) : self::$res->setStatus_code(HttpStatus::OK);
        self::$res->send();
    }
    public static function verifyLogin(){
        self::$res = new Res();
        $serviceData = SignService::verifyLogin();
        self::$res->setBody($serviceData);
        //print_r($serviceData);
        $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::BAD_REQUEST) : self::$res->setStatus_code(HttpStatus::OK);
        self::$res->send();
    }
    
}
/*CRUD, if post->Notification, Comment */