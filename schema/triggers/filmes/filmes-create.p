/*
    Trigger CREATE - Filmes
*/
TRIGGER PROCEDURE FOR CREATE OF Filmes.

ASSIGN
    Filmes.CodFilme = NEXT-VALUE(seqFilme).
