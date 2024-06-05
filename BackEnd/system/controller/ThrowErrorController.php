<?php

namespace controller;

require_once __DIR__ . '/../../Autoloader.php';



use config\Req;
use config\Res;
use config\HttpStatus;
use config\Exception;
use service\SignService;

class ThrowErrorController{
    public static Res $res;

    public static function ThrowError($data, $httpStatus){
        
        self::$res = new Res();
        self::$res->setBody($data);
        self::$res->setStatus_code($httpStatus);
        self::$res->send();
    }

}
/*CRUD, if post->Notification, Comment */