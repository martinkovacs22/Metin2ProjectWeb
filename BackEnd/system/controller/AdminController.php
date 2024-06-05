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
     public static function getAllAccountWithAllData(){
      self::$res = new Res();
      $serviceData = AdminService::getAllAccountWithAllData();
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
     public static function getAllPlayerWithAllData(){
      self::$res = new Res();
      $serviceData = AdminService::getAllPlayerWithAllData();
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function searchPlayer(){
      self::$res = new Res();
      $serviceData = AdminService::searchPlayer(Req::getReqBody());
      self::$res->setBody($serviceData);
      $serviceData["err"] ? self::$res->setStatus_code(HttpStatus::UNAUTHORIZED) : self::$res->setStatus_code(HttpStatus::OK);
      self::$res->send();
     }
     public static function search(){
      self::$res = new Res();
      $serviceData = AdminService::search(Req::getReqBody());
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