<?php

namespace controller;

require_once __DIR__ . '/../../Autoloader.php';



use config\Req;
use config\Res;
use config\HttpStatus;
use config\Exception;
use service\RanglistService;

class RanglistController{
    public static Res $res;
     public static function getRanglist(){
      self::$res = new Res();
      $serviceData = RanglistService::getRanglist();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function getGroupRanglist(){
      self::$res = new Res();
      $serviceData = RanglistService::getGroupRanglist();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function filterPlayerRanglist(){
        self::$res = new Res();
        $serviceData = RanglistService::filterPlayerRanglist(Req::getReqBody());
        self::$res->setBody($serviceData);
        $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
        self::$res->send();
     }
}
/*CRUD, if post->Notification, Comment */