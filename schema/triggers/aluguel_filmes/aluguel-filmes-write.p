/*
    Trigger WRITE - Aluguel_filmes
*/
TRIGGER PROCEDURE FOR WRITE OF Aluguel_filmes
    OLD BUFFER bOldAluguelFilmes.

DEFINE BUFFER bItem FOR Aluguel_filmes.

DEFINE VARIABLE iProximoItem  AS INTEGER NO-UNDO.
DEFINE VARIABLE dTotalAluguel AS DECIMAL NO-UNDO.

IF Aluguel_filmes.CodAluguel <= 0 THEN
    RETURN ERROR "Informe um aluguel valido para o item.".

FIND FIRST Alugueis
    WHERE Alugueis.CodAluguel = Aluguel_filmes.CodAluguel
    EXCLUSIVE-LOCK
    NO-ERROR.

IF NOT AVAILABLE Alugueis THEN
    RETURN ERROR "O aluguel informado nao esta cadastrado.".

IF bOldAluguelFilmes.CodAluguel > 0
AND Aluguel_filmes.CodAluguel <> bOldAluguelFilmes.CodAluguel THEN
    RETURN ERROR "O codigo do aluguel do item nao pode ser alterado.".

IF Aluguel_filmes.CodItem <= 0 THEN DO:
    ASSIGN
        iProximoItem = 1.

    FOR EACH bItem
        WHERE bItem.CodAluguel = Aluguel_filmes.CodAluguel
        NO-LOCK
        BY bItem.CodItem DESCENDING:

        ASSIGN
            iProximoItem = bItem.CodItem + 1.

        LEAVE.
    END.

    ASSIGN
        Aluguel_filmes.CodItem = iProximoItem.
END.

IF bOldAluguelFilmes.CodItem > 0
AND Aluguel_filmes.CodItem <> bOldAluguelFilmes.CodItem THEN
    RETURN ERROR "O codigo do item nao pode ser alterado.".

IF Aluguel_filmes.CodFilme <= 0 THEN
    RETURN ERROR "Informe um filme valido para o item.".

FIND FIRST Filmes
    WHERE Filmes.CodFilme = Aluguel_filmes.CodFilme
    NO-LOCK
    NO-ERROR.

IF NOT AVAILABLE Filmes THEN
    RETURN ERROR "O filme informado nao esta cadastrado.".

IF Aluguel_filmes.NumQuantidade <= 0 THEN
    RETURN ERROR "A quantidade deve ser maior que zero.".

ASSIGN
    Aluguel_filmes.ValTotal =
        Aluguel_filmes.NumQuantidade * Filmes.ValFilme
    dTotalAluguel = 0.

FOR EACH bItem
    WHERE bItem.CodAluguel = Aluguel_filmes.CodAluguel
      AND ROWID(bItem) <> ROWID(Aluguel_filmes)
    NO-LOCK:

    ASSIGN
        dTotalAluguel = dTotalAluguel + bItem.ValTotal.
END.

ASSIGN
    dTotalAluguel       = dTotalAluguel + Aluguel_filmes.ValTotal
    Alugueis.ValAluguel = dTotalAluguel.
