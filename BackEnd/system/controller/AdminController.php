<?php

namespace controller;

require_once __DIR__ . '/../../Autoloader.php';



use config\Req;
use config\Res;
use config\HttpStatus;
use config\Exception;
use service\AdminService;

class AdminController{
    public static Res $res;
     public static function isAdmin(){
      self::$res = new Res();
      $serviceData = AdminService::isAdmin();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function getAdminRang(){
      self::$res = new Res();
      $serviceData = AdminService::getAdminRang();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function getAccountWithAllData(){
      self::$res = new Res();
      $serviceData = AdminService::getAccountWithAllData(Req::getReqBody());
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function searchAccount(){
      self::$res = new Res();
      $serviceData = AdminService::searchAccount(Req::getReqBody());
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function getAllTypeOfEmails(){
      self::$res = new Res();
      $serviceData = AdminService::getAllTypeOfEmails();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function getAccountByTypeOfEmail(){
      self::$res = new Res();
      $serviceData = AdminService::getAccountByTypeOfEmail(Req::getReqBody());
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }


}
/*CRUD, if post->Notification, Comment */