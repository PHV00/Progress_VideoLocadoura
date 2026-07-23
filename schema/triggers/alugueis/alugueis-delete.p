/*
    Trigger DELETE - Alugueis
*/
TRIGGER PROCEDURE FOR DELETE OF Alugueis.

FOR EACH Aluguel_filmes
    WHERE Aluguel_filmes.CodAluguel = Alugueis.CodAluguel
    EXCLUSIVE-LOCK:

    DELETE Aluguel_filmes.
END.
