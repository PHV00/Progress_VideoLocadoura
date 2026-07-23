/*
    Trigger DELETE - Aluguel_filmes
   */
TRIGGER PROCEDURE FOR DELETE OF Aluguel_filmes.

DEFINE BUFFER bItem FOR Aluguel_filmes.

DEFINE VARIABLE dTotalAluguel AS DECIMAL NO-UNDO.

FIND FIRST Alugueis
    WHERE Alugueis.CodAluguel = Aluguel_filmes.CodAluguel
    EXCLUSIVE-LOCK
    NO-ERROR.

IF AVAILABLE Alugueis THEN DO:
    ASSIGN
        dTotalAluguel = 0.

    FOR EACH bItem
        WHERE bItem.CodAluguel = Aluguel_filmes.CodAluguel
        NO-LOCK:

        ASSIGN
            dTotalAluguel = dTotalAluguel + bItem.ValTotal.
    END.

    ASSIGN
        Alugueis.ValAluguel = dTotalAluguel.
END.
