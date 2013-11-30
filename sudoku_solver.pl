
% Inclusion de librairie pour la réduction des domaines de recherches
:- use_module(library('clp/bounds')).




/* Permet d'intialiser les grilles que l'on veut résoudre */

initTab(Test, Easy, Normal, Hard, VeryHard) :-


    /* Veuillez initialiser la grille de Sudoku ici. Pour les chiffres à trouver,
       il faut utiliser un underscore */
    Test =
    [ _,_,_,_,_,_,_,_,_,
      _,_,_,_,_,_,_,_,_,
      _,_,_,_,_,_,_,_,_,
      _,_,_,_,_,_,_,_,_,
      _,_,_,_,_,_,_,_,_,
      _,_,_,_,_,_,_,_,_,
      _,_,_,_,_,_,_,_,_,
      _,_,_,_,_,_,_,_,_,
      _,_,_,_,_,_,_,_,_
    ],

    Easy =
    [ 1,_,_,8,3,_,_,_,2,
      5,7,_,_,_,1,_,_,_,
      _,_,_,5,_,9,_,6,4,
      7,_,4,_,_,8,5,9,_,
      6,_,3,_,1,_,4,_,7,
      _,5,1,4,_,_,3,_,6,
      3,6,_,7,_,4,_,_,_,
      _,_,_,6,_,_,_,7,9,
      _,_,_,_,5,2,_,_,3
    ],

    Normal =
    [ 8,_,4,_,_,_,2,_,9,
      _,_,9,_,_,_,1,_,_,
      1,_,_,3,_,2,_,_,7,
      _,5,_,1,_,4,_,8,_,
      _,_,_,_,3,_,_,_,_,
      _,1,_,7,_,9,_,2,_,
      5,_,_,4,_,3,_,_,8,
      _,_,3,_,_,_,4,_,_,
      4,_,6,_,_,_,3,_,1
    ],

    Hard =
    [ _,_,8,_,_,_,5,_,_,
      _,1,_,6,_,8,_,3,_,
      3,_,_,_,7,_,_,_,4,
      _,7,_,8,_,1,_,9,_,
      _,_,3,_,_,_,2,_,_,
      _,5,_,9,_,2,_,8,_,
      2,_,_,_,6,_,_,_,8,
      _,4,_,2,_,5,_,7,_,
      _,_,7,_,_,_,4,_,_
    ],

    VeryHard =
    [ 1,_,_,_,_,7,_,9,_,
      _,3,_,_,2,_,_,_,8,
      _,_,9,6,_,_,5,_,_,
      _,_,5,3,_,_,9,_,_,
      _,1,_,_,8,_,_,_,2,
      6,_,_,_,_,4,_,_,_,
      3,_,_,_,_,_,_,1,_,
      _,4,_,_,_,_,_,_,7,
      _,_,7,_,_,_,3,_,_
    ].
    

main :-
    initTab(Test, Easy, Normal, Hard, VeryHard),
    % On passe en premier paramètre la grille que l'on veut résoudre
    sudoku(Easy,Solution),
    fwritef(Solution).


/* Lance la construction de la grille de solution et résout le Sudoku */
sudoku(Grille,Solution) :-

    Solution = 
     [
        A1,A2,A3,A4,A5,A6,A7,A8,A9,
        B1,B2,B3,B4,B5,B6,B7,B8,B9,
        C1,C2,C3,C4,C5,C6,C7,C8,C9,
        D1,D2,D3,D4,D5,D6,D7,D8,D9,
        E1,E2,E3,E4,E5,E6,E7,E8,E9,
        F1,F2,F3,F4,F5,F6,F7,F8,F9,
        G1,G2,G3,G4,G5,G6,G7,G8,G9,
        H1,H2,H3,H4,H5,H6,H7,H8,H9,
        I1,I2,I3,I4,I5,I6,I7,I8,I9
     ],
    % On défini le domaine des variables de la liste
    Solution in 1..9,

    /* Spécifications des contraintes : 
       On sélectionne des variables toutes différentes pour les lignes, colonnes et matrices */
    all_different([A1,A2,A3,A4,A5,A6,A7,A8,A9]),
    all_different([B1,B2,B3,B4,B5,B6,B7,B8,B9]),
    all_different([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
    all_different([D1,D2,D3,D4,D5,D6,D7,D8,D9]),
    all_different([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
    all_different([F1,F2,F3,F4,F5,F6,F7,F8,F9]),
    all_different([G1,G2,G3,G4,G5,G6,G7,G8,G9]),
    all_different([H1,H2,H3,H4,H5,H6,H7,H8,H9]),
    all_different([I1,I2,I3,I4,I5,I6,I7,I8,I9]),

    all_different([A1,B1,C1,D1,E1,F1,G1,H1,I1]),
    all_different([A2,B2,C2,D2,E2,F2,G2,H2,I2]),
    all_different([A3,B3,C3,D3,E3,F3,G3,H3,I3]),
    all_different([A4,B4,C4,D4,E4,F4,G4,H4,I4]),
    all_different([A5,B5,C5,D5,E5,F5,G5,H5,I5]),
    all_different([A6,B6,C6,D6,E6,F6,G6,H6,I6]),
    all_different([A7,B7,C7,D7,E7,F7,G7,H7,I7]),
    all_different([A8,B8,C8,D8,E8,F8,G8,H8,I8]),
    all_different([A9,B9,C9,D9,E9,F9,G9,H9,I9]),

    all_different([A1,A2,A3,B1,B2,B3,C1,C2,C3]),
    all_different([A4,A5,A6,B4,B5,B6,C4,C5,C6]),
    all_different([A7,A8,A9,B7,B8,B9,C7,C8,C9]),
    all_different([D1,D2,D3,E1,E2,E3,F1,F2,F3]),
    all_different([D4,D5,D6,E4,E5,E6,F4,F5,F6]),
    all_different([D7,D8,D9,E7,E8,E9,F7,F8,F9]),
    all_different([G1,G2,G3,H1,H2,H3,I1,I2,I3]),
    all_different([G4,G5,G6,H4,H5,H6,I4,I5,I6]),
    all_different([G7,G8,G9,H7,H8,H9,I7,I8,I9]),

    % On rempli la grille de sortie
    grid(Grille, Solution),
    
    % On effectue la recherche
    label(Solution).
    
    

/* Initialise la grille de sortie avec les valeurs déjà entrées */
grid([],[]) :- !.
grid([0|Q1],[_|Q2]) :-
  !,
  grid(Q1,Q2).

grid([Val|Q1],[Var|Q2]) :-
  !,
  Var #= Val,
  grid(Q1,Q2).




/* Permet d'écrire la solution du sudoku dans un fichier nommé 'solutionSudoku9x9' */
fwritef(Solution) :-

    Solution = 
     [
        A1,A2,A3,A4,A5,A6,A7,A8,A9,
        B1,B2,B3,B4,B5,B6,B7,B8,B9,
        C1,C2,C3,C4,C5,C6,C7,C8,C9,
        D1,D2,D3,D4,D5,D6,D7,D8,D9,
        E1,E2,E3,E4,E5,E6,E7,E8,E9,
        F1,F2,F3,F4,F5,F6,F7,F8,F9,
        G1,G2,G3,G4,G5,G6,G7,G8,G9,
        H1,H2,H3,H4,H5,H6,H7,H8,H9,
        I1,I2,I3,I4,I5,I6,I7,I8,I9
     ],

	open('solutionSudoku9x9',write,H),	
	nl(H),
	
	write(H,'      Solution du sudoku :'), nl(H),nl(H),
	
	write(H,'   +-------+-------+-------+'),nl(H),
	
	write(H,'   | '),write(H,A1),tab(H,1),write(H,A2),tab(H,1),write(H,A3),tab(H,1),write(H,'| '),
	write(H,A4),tab(H,1),write(H,A5),tab(H,1),write(H,A6),tab(H,1),write(H,'| '),
	write(H,A7),tab(H,1),write(H,A8),tab(H,1),write(H,A9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   | '),write(H,B1),tab(H,1),write(H,B2),tab(H,1),write(H,B3),tab(H,1),write(H,'| '),
	write(H,B4),tab(H,1),write(H,B5),tab(H,1),write(H,B6),tab(H,1),write(H,'| '),
	write(H,B7),tab(H,1),write(H,B8),tab(H,1),write(H,B9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   | '),write(H,C1),tab(H,1),write(H,C2),tab(H,1),write(H,C3),tab(H,1),write(H,'| '),
	write(H,C4),tab(H,1),write(H,C5),tab(H,1),write(H,C6),tab(H,1),write(H,'| '),
	write(H,C7),tab(H,1),write(H,C8),tab(H,1),write(H,C9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   +-------+-------+-------+'),nl(H),
	
	write(H,'   | '),write(H,D1),tab(H,1),write(H,D2),tab(H,1),write(H,D3),tab(H,1),write(H,'| '),
	write(H,D4),tab(H,1),write(H,D5),tab(H,1),write(H,D6),tab(H,1),write(H,'| '),
	write(H,D7),tab(H,1),write(H,D8),tab(H,1),write(H,D9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   | '),write(H,E1),tab(H,1),write(H,E2),tab(H,1),write(H,E3),tab(H,1),write(H,'| '),
	write(H,E4),tab(H,1),write(H,E5),tab(H,1),write(H,E6),tab(H,1),write(H,'| '),
	write(H,E7),tab(H,1),write(H,E8),tab(H,1),write(H,E9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   | '),write(H,F1),tab(H,1),write(H,F2),tab(H,1),write(H,F3),tab(H,1),write(H,'| '),
	write(H,F4),tab(H,1),write(H,F5),tab(H,1),write(H,F6),tab(H,1),write(H,'| '),
	write(H,F7),tab(H,1),write(H,F8),tab(H,1),write(H,F9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   +-------+-------+-------+'),nl(H),
	
	write(H,'   | '),write(H,G1),tab(H,1),write(H,G2),tab(H,1),write(H,G3),tab(H,1),write(H,'| '),
	write(H,G4),tab(H,1),write(H,G5),tab(H,1),write(H,G6),tab(H,1),write(H,'| '),
	write(H,G7),tab(H,1),write(H,G8),tab(H,1),write(H,G9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   | '),write(H,H1),tab(H,1),write(H,H2),tab(H,1),write(H,H3),tab(H,1),write(H,'| '),
	write(H,H4),tab(H,1),write(H,H5),tab(H,1),write(H,H6),tab(H,1),write(H,'| '),
	write(H,H7),tab(H,1),write(H,H8),tab(H,1),write(H,H9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   | '),write(H,I1),tab(H,1),write(H,I2),tab(H,1),write(H,I3),tab(H,1),write(H,'| '),
	write(H,I4),tab(H,1),write(H,I5),tab(H,1),write(H,I6),tab(H,1),write(H,'| '),
	write(H,I7),tab(H,1),write(H,I8),tab(H,1),write(H,I9),tab(H,1),write(H,'|'),nl(H),
	
	write(H,'   +-------+-------+-------+'),nl(H),
	
	close(H).
