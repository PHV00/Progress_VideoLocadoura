/*
    Trigger CREATE - Cidades
*/
TRIGGER PROCEDURE FOR CREATE OF Cidades.

ASSIGN
    Cidades.CodCidade = NEXT-VALUE(seqCidade).
