
# PREMIERS PROJETS SYMFONY 

## ***Développé par Hugo Fief***


**COMMENCEMENT : **  

- Commencer par changer le **DATABASE_URL** du fichier .env à la racine du projet si besoin
- Puis exécuter la commande **php bin/console doctrine:database:create** pour créer la base de donnée
- Ensuite exécuter la commande **php bin/console doctrine:migration:migrate** pour récupérer toutes les tables
- Et enfin exécuter cette commande pour ajouter les donnée en base **php bin/console doctrine:fixtures:load**

--- 

- PS : Si vous rencontrer un problème avec la base de donnée
-  Sachez que vous pouvez récupérer le point sql qui se trouve dans le dossier sql à la racine du projet
