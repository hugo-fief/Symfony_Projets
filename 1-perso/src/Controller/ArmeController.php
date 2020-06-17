<?php

namespace App\Controller;

use App\Entity\Arme;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ArmeController extends AbstractController
{
    /**
     * @Route("/arme", name="armes")
     */
    public function arme()
    {
        Arme::creerArmes();
        return $this->render('arme/armes.html.twig', [
            "arme" => Arme::$armes
        ]);
    }

    /**
     * @Route("/arme/{nom}", name="afficher_arme")
     */
    public function afficherArme($nom)
    {
        Arme::creerArmes();
        $arme = Arme::getArmeParNom($nom);
        return $this->render('arme/arme.html.twig', [
            "arme" => $arme
        ]);
    }
}