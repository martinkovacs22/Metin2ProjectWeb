<?php

namespace config;
require_once __DIR__ . '/../../Autoloader.php';
class LanguageController
{

    private static array|null $componens = null;

    private static $inc = null;

    public static function getInc() :LanguageController
    {
        if (LanguageController::$inc == null) {
            LanguageController::$inc = new LanguageController();
        }
        return LanguageController::$inc;
    }

    private function __construct()
    {


        LanguageController::$componens = json_decode(file_get_contents(__DIR__ . "/jsons/LanguageController.json"), true);
    }


    public static function change(string $from, string $to, array $componens)
    {

        $array  = [];

if (array_key_exists($to,LanguageController::$componens) && 
array_key_exists($from,LanguageController::$componens) ){ 

        foreach ($componens as $value) {
            if(array_key_exists($value,LanguageController::$componens[$from]) ){
                $array["from"][$value] = LanguageController::$componens[$from][$value];
                $array["to"][$value] = LanguageController::$componens[$to][$value];
            }else{
                Exception::msg(array("err"=>true,"data"=>"nem találta meg a program a componenst"));
            }
        }

        return array("err"=>false,"data"=>$array);
}else{
    Exception::msg(array("err"=>true,"data"=>"nem találta meg a program a nyelvet"));
}
        
    }
}
