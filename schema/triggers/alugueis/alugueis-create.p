/*
    Trigger CREATE - Alugueis
*/
TRIGGER PROCEDURE FOR CREATE OF Alugueis.

ASSIGN
    Alugueis.CodAluguel = NEXT-VALUE(seqAluguel)
    Alugueis.DatAluguel = TODAY
    Alugueis.ValAluguel = 0.
