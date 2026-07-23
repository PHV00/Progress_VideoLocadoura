/*
    Trigger DELETE - Filmes
*/
TRIGGER PROCEDURE FOR DELETE OF Filmes.

IF CAN-FIND(
    FIRST Aluguel_filmes
    WHERE Aluguel_filmes.CodFilme = Filmes.CodFilme
    NO-LOCK
) THEN
    RETURN ERROR
        "O filme nao pode ser eliminado porque esta sendo utilizado em um aluguel.".
