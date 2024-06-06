<?php

namespace controller;

require_once __DIR__ . '/../../Autoloader.php';



use config\Req;
use config\Res;
use config\HttpStatus;
use config\Exception;
use service\HomeService;

class HomeController{
    public static Res $res;
     public static function getAllAccount(){
      self::$res = new Res();
      $serviceData = HomeService::getAllAccount();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function getAllCharacter(){
      self::$res = new Res();
      $serviceData = HomeService::getAllCharacter();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function getLastDayOnlinePlayer(){
      self::$res = new Res();
      $serviceData = HomeService::getLastDayOnlinePlayer();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function getOnlinePlayerNumber(){
      self::$res = new Res();
      $serviceData = HomeService::getOnlinePlayerNumber();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
}
/*CRUD, if post->Notification, Comment */