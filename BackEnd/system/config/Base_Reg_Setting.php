<?php

namespace config;


class Base_Reg_Setting{


    private $base_cash;
    private $base_gold_expire;
    private $base_silver_expire;
    private $base_safebox_expire;
    private $base_autoloot_expire;
    private $base_fish_mind_expire;
    private $base_money_drop_rate_expire;

    public function __construct()
    {

        $json = file_get_contents(__DIR__.'/baseRegSetting.json'); 
  
        // Decode the JSON file 
        $json_data = json_decode($json,true);

        $this->setCash($json_data["base_cash"]);
        $this->setBaseGold($json_data["base_gold_expire"]);
        $this->setBaseSilver($json_data["base_silver_expire"]);
        $this->setBaseSafeBox($json_data["base_safebox_expire"]);
        $this->setBaseAutoLoot($json_data["base_autoloot_expire"]);
        $this->setBaseFish($json_data["base_fish_mind_expire"]);
        $this->setBaseMoney($json_data["base_money_drop_rate_expire"]);

    }
    public function convertToArray(){
        return array("base_cash"=>$this->getbaseCash(),"base_gold_expire"=>$this->getbaseGold(),"base_silver_expire"=>$this->getbaseSilver(),"base_safebox_expire"=>$this->getbaseSafeBox(),"base_autoloot_expire"=>$this->getbaseAutoLoot(),"base_fish_mind_expire"=>$this->getbaseFish(),"base_money_drop_rate_expire"=>$this->getbaseMoney());
        
    }
    public function saveToBase(){
        $json_data = json_encode($this->convertToArray());
        file_put_contents(__DIR__.'/baseRegSetting.json', $json_data);
    }


    public function getbaseCash(){
        return $this->base_cash;
    }
    public function getbaseGold(){
        return $this->base_gold_expire;
    }
    public function getbaseSilver(){
        return $this->base_silver_expire;
    }
    public function getbaseSafeBox(){
        return $this->base_safebox_expire;
    }
    public function getbaseAutoLoot(){
        return $this->base_autoloot_expire;
    }
    public function getbaseFish(){
        return $this->base_fish_mind_expire;
    }
    public function getbaseMoney(){
        return $this->base_money_drop_rate_expire;
    }

    public function setCash($data){

        $this->base_cash = $data;
        $this->saveToBase();
    }
    public function setBaseGold($data){

        $this->base_gold_expire = $data;
        $this->saveToBase();
    }
    public function setBaseSilver($data){

        $this->base_silver_expire = $data;
        $this->saveToBase();
    }
    public function setBaseSafeBox($data){

        $this->base_safebox_expire = $data;
        $this->saveToBase();
    }
    public function setBaseAutoLoot($data){

        $this->base_autoloot_expire = $data;
        $this->saveToBase();
    }
    public function setBaseFish($data){

        $this->base_fish_mind_expire = $data;
        $this->saveToBase();
    }
    public function setBaseMoney($data){

        $this->base_money_drop_rate_expire = $data;
        $this->saveToBase();
    }

}

?>