<?php 

namespace App\Entity;

class Arme {
    private $nom;
    private $desc;
    private $degats;

    public static $armes = [];

    public function __construct($nom, $desc, $degats) {
        $this->nom = $nom;
        $this->desc = $desc;
        $this->degats = $degats;
        self::$armes[] = $this; 
    }

    public function getNom() { return $this->nom; }
    public function getDesc() { return $this->desc; }
    public function getDegats() { return $this->degats; }

    public function setNom($nom) { 
        $this->nom = $nom;
        return $this;
    }
    public function setDesc($desc) { 
        $this->desc = $desc;
        return $this;
    }
    public function setDegats($degats) {
        $this->degats = $degats;
        return $this;
    }

    public static function creerArmes() {
        $a1 = new Arme("épée", "Une superbe épée tranchante", 10);
        $a2 = new Arme("hache", "Une arme ou un outil", 15);
        $a3 = new Arme("arc", "Une arme à distance", 7);
    }

    public static function getArmeParNom($nom) {
        foreach(self::$armes as $arme) {
            if (strtolower(str_replace("é", "e", $arme->nom)) === $nom) {
                return $arme;
            }
        }
    }
}

?>