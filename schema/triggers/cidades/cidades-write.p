/*
    Trigger WRITE - Cidades
*/
TRIGGER PROCEDURE FOR WRITE OF Cidades
    OLD BUFFER bOldCidades.

ASSIGN
    Cidades.NomCidade = TRIM(Cidades.NomCidade)
    Cidades.CodUF     = CAPS(TRIM(Cidades.CodUF)).

IF bOldCidades.CodCidade > 0
AND Cidades.CodCidade <> bOldCidades.CodCidade THEN
    RETURN ERROR "O codigo da cidade nao pode ser alterado.".

IF Cidades.CodCidade <= 0 THEN
    RETURN ERROR "O codigo da cidade deve ser maior que zero.".

IF Cidades.NomCidade = "" THEN
    RETURN ERROR "Informe o nome da cidade.".

IF LENGTH(Cidades.CodUF) <> 2 THEN
    RETURN ERROR "A UF deve possuir exatamente dois caracteres.".
