<?php

namespace service;

require_once __DIR__ . '/../../Autoloader.php';

use model\ModelR;
use config\Exception;

class HomeService
{
    public static function getAllPlayer():array{
        
        return ModelR::CallProcedure(array(),"getAllPlayer","account");
        
    } 
    public static function getAllCharacter():array{
        
        return ModelR::CallProcedure(array(),"getAllPlayer","player");
        
    } 
    public static function getLastDayOnlinePlayer():array{
        
        return ModelR::CallProcedure(array(),"getLastDayOnlinePlayer","account");
        
    } 
    public static function getOnlinePlayerNumber():array{
        
        return ModelR::CallProcedure(array(),"getOnlinePlayerNumber","account");
        
    } 
}
