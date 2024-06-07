<?php
namespace controller;

require_once __DIR__ . '/../../Autoloader.php';



use config\Req;
use config\Res;
use config\HttpStatus;
use config\LanguageController as Language;
class LanguageController{

    public static Res $res;
    public static function change(){
        self::$res = new Res();
        $from = Req::getReqBody()["from"];
        $to = Req::getReqBody()["to"];
        $componens = Req::getReqBody()["componens"];

        $languageJsonController = Language::getInc();
        

        $change = $languageJsonController->change($from,$to,$componens);
        $change["err"] ? self::$res->setStatus_code(HttpStatus::NOT_FOUND) : self::$res->setStatus_code(HttpStatus::OK);
        self::$res->setBody($change);
        self::$res->send();
    }

}

?>
