# Myg Chess Game

This is a chess game for Pharo based on Bloc, Toplo and Myg.

## What is this repository really about

The goal of this repository is not to be a complete full blown game, but a good enough implementation to practice software engineering skills:
 - testing
 - reading existing code
 - refactorings
 - profiling
 - debugging

## Getting started

### Getting the code

This code has been tested in Pharo 12. You can get it by installing the following baseline code:

```smalltalk
Metacello new
	repository: 'github://kbsb0/Chess:main';
	baseline: 'MygChess';
	onConflictUseLoaded;
	load.
```

### Using it

You can open the chess game using the following expression:

```smalltalk
board := MyChessGame freshGame.
board size: 800@600.
space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```

## Explain the basics

1. **what katas you did ?**

	Nous avons choisi de faire les katas : 

 * Fix pawn moves!	
 * Restrict legal moves
 * Add pawn promotion

2. **what difficulties you encountered and how you solved them ?**

	Nous avons rencontré plusieurs difficultés :   
	* Langage pharo :   
		Le projet a été réalisé en pharo qui est un nouveau langage pour nous.   
		Même si son fonctionnement est similaire au langage orienté objet que nous connaissons déjà ( comme java ), sa syntaxe particulière n’a pas été facile à prendre en main.  
		Nous avons donc dû dans un premier temps nous documenter sur ce langage.

	* Compréhension du code fourni :  
	Pour réaliser nos katas, nous disposions d'une base de code préexistante.  
	Étant donné que nous n’avions pas écrit ce code, nous avons dû consacrer du temps à analyser son fonctionnement, à comprendre l’utilité de chaque classe, fonction, etc.   
	Pour mieux comprendre le code, nous avons utilisé les principes vus en cours, notamment le Reverse Engineering.  
	C'est-à-dire, en regardant une partie du code (celle qui nous intéressait sur les pièces et le jeu),  puis aussi en regardant les tests pour savoir ce que faisait le code.

	* Jeu d’échecs :  
	Nous avons passé du temps à comprendre nos katas ( quels étaient les objectifs ).  
	Ne connaissant pas entièrement bien le jeu des échecs, nous avons dû aussi nous documenter ( pour la prise en passant notamment ).


	* Kata :  
	La réalisation des katas à générer plusieurs difficulté : 
		* Prise en passant:  
		Nous avons rencontré plusieurs difficultés pour écrire un code "propre".  
		En effet, après avoir pris le temps de comprendre le code existant, nous avons réussi rapidement à avancer sur le kata.  
		Cependant, ce code nécessitait une refactorisation à cause de duplications. Par exemple, la gestion des couleurs des pions était souvent réalisée à l’aide de conditions comme piece isWhite ifTrue:[] ifFalse:[].  
		De plus, le code était difficile à maintenir, car plusieurs conditions dépendaient du contexte spécifique du jeu.  
		Par exemple, l’état d’un pion était directement lié à sa position sur le plateau (ligne 5), ce qui poserait problème dans un jeu personnalisé où ce comportement pourrait ne plus être valide.  
		Le code était donc à la fois peu clair et peu maintenable.
		Pour résoudre ces problèmes, nous avons cherché différentes solutions, en cherchant quel design pattern pourrait être utilisé pour améliorer la lisibilité et la maintenabilité du code.  
		Cela nous a permis d’adopter des solutions plus flexibles et de limiter les dépendances au contexte du jeu.
		* Logiques d’échec:  
		ll existe plusieurs façons de contrer un échec: 
			1. Soit une pièce peut capturer la pièce menaçante 
			2. Soit une pièce peut bloquer la pièce menaçante 
			3. Le roi peut échapper à la menace en se déplaçant.  

			Pour pouvoir prendre en compte tous les cas il a fallu décomposer le code qui
			permet de déplacer une pièce pour prendre en compte l’échec du roi et quoi
			faire alors dans ce cas.  
			Mais il a fallu aussi conserver la logique actuelle lorsqu’il n’y a pas d’échec.

		* Promotion des pions :  
		La principale difficulté de ce kata résidait dans la compréhension des objets utilisés pour l'affichage.  
		Nous avons d'abord commencé par comprendre et réaliser des exercices simples d'affichage (par exemple, afficher un bouton, générer un comportement lors d'un clic, etc.).  
		Pour approfondir nos connaissances, nous avons cherché où les classes liées à l'affichage étaient utilisées et avons trouvé des tests existants dans Pharo qui montraient des exemples d'utilisation.  
		Ces tests nous ont permis de comprendre comment créer une fenêtre et ajouter les éléments souhaités.

		La deuxième difficulté a été de différencier les cas où le joueur effectue le mouvement du pion manuellement et ceux où le mouvement est effectué automatiquement.  
		Il a été compliqué de cerner quelles fonctions étaient appelées uniquement dans le cas du mouvement automatique.  
		Cependant, grâce au travail préalable sur la compréhension de l'affichage graphique, nous avons pu résoudre ce problème assez facilement.

	Le merge à la fin qui a été dangereux puisque même si nous n'avons pas touché à du code en commun, il y a eu quelques problèmes dans notre jeu qui nous a donné du fil à retordre.   

	Cependant, il s'agissait de petits problèmes d'incohérence qui ont été réglés en reprenant le code présent sur nos branches respectives. 

3. **how well is your code tested and how did you do it. Automated testing, mutation testing, manual testing ?**

	* Test manuel :  
		Tout d'abord, nous avons effectué des tests manuels.  
		En effet, comme nous disposons d'une interface graphique, il était relativement simple et rapide de vérifier que la fonctionnalité ajoutée semblait fonctionner correctement.
	* Tests unitaires :  
		Par ailleurs, nous avons ajouté plusieurs classes de tests unitaires pour nous assurer du bon fonctionnement de nos méthodes.  
		Ces tests ont été écrits de manière à couvrir différents scénarios et comportements du code.
	* Test coverage :   
		Nous avons utilisé les outils abordés en cours pour mesurer la couverture de notre code, qui est actuellement d'environ 66 %.   
		Cela nous permet de nous assurer qu'une grande partie du code est effectivement testée.
	* Tests de mutation :  
		Enfin, nous avons utilisé des tests de mutation pour vérifier l'efficacité de nos tests en termes de détection de bugs.  
		Ces tests consistent à introduire des erreurs dans le code et à vérifier si nos tests sont capables de les détecter.  
		En moyenne, nous obtenons un mutation score de 70 %, ce qui indique que nos tests détectent un bon nombre de mutations.

## Relevant Design Points

1. **Why is the code like this?**

	Nous avons repris en grande partie le code déjà réalisé.  
	Nous avons remarqué plusieurs problèmes dans le code qui existait déjà: 
	* le mouvement des pions mal réalisé
	* les mouvements en cas d’échec
	* les mouvements de la tour
	
	C’est pour cette raison que nous avons choisi ces katas.

	

2. **Why is this part of the code more tested than the other?**

	Nous avons choisi de tester les parties du code que nous avons ajouté en négligeant le code qui est déjà implémenté

3. **Where did you put the priorities?**

	Nous avons choisi d’avoir en priorité quelque chose de fonctionnel (surtout pour les pièces comme le pion), puis nous avons appliqué du refactoring afin de rendre le code plus lisible, clair et agréable.

	Il fallait être certain que des pièces peuvent se déplacer correctement pour appliquer nos katas.


4. **Where did you use (or not) design patterns in the code and why?**

	Nous avons choisi d'utiliser les design pattern :

* **State** :  
	pour différencier la couleur des joueurs, nous avons choisi de mettre en place le pattern State pour pouvoir changer le joueur courrant qui joue.  
	Ce design pattern nous permet ainsi de pouvoir être plus flexible dans le code surtout si l'on doit ajouter de nouvelles couleurs dans le jeu.


 	pour l'état des pièces et en particulier pour le pion.  
	Ce pattern nous permet de savoir si un pion est dans son état initial (il ne s'est jamais déplacé), dans son état où il a effectué un double déplacement(le pion peut être dans cet état lorsqu'il se déplace et qu'il ne s'est jamais déplacé avant), et lorsque le pion s'est déjà déplacé.  

	Ce pattern va nous servir pour appeler le visiteur (méthode accept).  
	Nous avons dons choisi d'utiliser une composition.  

* **Strategy** pour le déplacement du pion 


* **Chain of responsibility** pour le kata Restrict legal moves

	Ce pattern nous a permis d'appliquer un ordre dans l'exécution du kata.  

	En effet, grâce à ce pattern, lorsque le roi est en échec, le jeu décide d'appliquer la logique de capturer une pièce,   
	puis si ce n'est pas possible, il applique la logique de bloquer la pièce menaçante avec une pièce du joueur qui peut jouer.  
	Sinon c'est le roi qui doit se déplacer en dernier recours.  
	Enfin il y a aussi un état par défaut qui conserve la logique qui était déjà existante lorsqu'il n'y a pas d'échec : une pièce aléatoire du joueur qui doit jouer se déplace. 

	L'avantage de ce design pattern dans ce cas est que le code est ainsi décomposé dans plusieurs classes (une pour chaque logique).  
	Il est donc plus facile d'ajouter une nouvelle logique pour contrer l'échec et ces logiques ne sont pas regroupées dans une seule méthode qui serait beaucoup moins lisible. 

* **Visitor** pour le kata Fix pawn moves!		

	Le visiteur nous permet en utilisant la composition de pouvoir déplacer le pion en fonction de son état.