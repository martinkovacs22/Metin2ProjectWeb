<?php

namespace service;

require_once __DIR__ . '/../../Autoloader.php';

use model\ModelR;
use config\Req;
use config\Exception;
use config\JWThandler;
class RanglistService
{
    public static function getRanglist():array{
    
        return ModelR::CallProcedure(array(),"getRanglist","player");
    }
    public static function getGroupRanglist():array{
    
        return ModelR::CallProcedure(array(),"getGroupRanglist","player");
    }
    public static function filterPlayerRanglist(array $body):array{
        if (isset($body["empire"]) && isset($body["job1"])&&isset($body["job2"])&&isset($body["cl"])&&isset($body["cName"])) {

            $arr = array("empire"=>$body["empire"],"job1"=>$body["job1"],"job2"=>$body["job2"],"cl"=>$body["cl"],"cName"=>$body["cName"]);
            
            return ModelR::CallProcedure($arr,"filterPlayerRanglist","player");
        }
        return array("err" => true, "data" => "Incorrect Data");
        
    }
}
