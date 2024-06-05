<?php

namespace model;

require_once __DIR__ . '/../../Autoloader.php';

use model\Db;
use config\Req;
class ModelR{
        public static function CallProcedure($array,$storeProcedure,$dbName):array{

            $db = Db::connectToDatabasePDO($dbName, $_SESSION["db"]["db_username"], $_SESSION["db"]["db_pass"],$_SESSION["db"]["db_host"]);

        return Db::Call($storeProcedure, $array, $db);
    }
}