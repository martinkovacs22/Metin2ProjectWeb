<?php

namespace config;
require_once __DIR__ . '/../../Autoloader.php';
class LanguageController
{

    private static array|null $components = null;

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


        LanguageController::$components = json_decode(file_get_contents(__DIR__ . "/jsons/LanguageController.json"), true);
    }


    public static function change(string $from, string $to, array $components)
    {

        $array  = [];

if (array_key_exists($to,LanguageController::$components) && 
array_key_exists($from,LanguageController::$components) ){ 

        foreach ($components as $value) {
            if(array_key_exists($value,LanguageController::$components[$from]) ){
                $array["from"][$value] = LanguageController::$components[$from][$value];
                $array["to"][$value] = LanguageController::$components[$to][$value];
            }else{
                Exception::msg(array("err"=>true,"data"=>"nem találta meg a program a componentst"));
            }
        }

        return array("err"=>false,"data"=>$array);
}else{
    Exception::msg(array("err"=>true,"data"=>"nem találta meg a program a nyelvet"));
}
        
    }
}
