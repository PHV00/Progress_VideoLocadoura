/*
    Trigger WRITE - Filmes
*/
TRIGGER PROCEDURE FOR WRITE OF Filmes
    OLD BUFFER bOldFilmes.

ASSIGN
    Filmes.NomFilme   = TRIM(Filmes.NomFilme)
    Filmes.DesSinopse = TRIM(Filmes.DesSinopse)
    Filmes.CodGenero  = TRIM(Filmes.CodGenero).

IF bOldFilmes.CodFilme > 0
AND Filmes.CodFilme <> bOldFilmes.CodFilme THEN
    RETURN ERROR "O codigo do filme nao pode ser alterado.".

IF Filmes.CodFilme <= 0 THEN
    RETURN ERROR "O codigo do filme deve ser maior que zero.".

IF Filmes.NomFilme = "" THEN
    RETURN ERROR "Informe o nome do filme.".

IF Filmes.DesSinopse = "" THEN
    RETURN ERROR "Informe a sinopse do filme.".

IF Filmes.CodGenero = "" THEN
    RETURN ERROR "Informe o genero do filme.".

IF Filmes.ValFilme < 0 THEN
    RETURN ERROR "O valor do filme nao pode ser negativo.".
