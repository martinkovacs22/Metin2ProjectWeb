<?php

namespace service;

require_once __DIR__ . '/../../Autoloader.php';

use model\ModelR;
use config\Exception;

class HomeService
{
    public static function getAllAccount():array{
        
        return ModelR::CallProcedure(array(),"getAllAccount","account");
        
    } 
    public static function getAllCharacter():array{
        
        return ModelR::CallProcedure(array(),"getAllCharacter","player");
        
    } 
    public static function getLastDayOnlinePlayer():array{
        
        return ModelR::CallProcedure(array(),"getLastDayOnlinePlayer","player");
        
    } 
    public static function getOnlinePlayerNumber():array{
        
        return ModelR::CallProcedure(array(),"getOnlinePlayerNumber","player");
        
    } 
}
