/*
    Trigger DELETE - Cidades
*/
TRIGGER PROCEDURE FOR DELETE OF Cidades.

IF CAN-FIND(
    FIRST Clientes
    WHERE Clientes.CodCidade = Cidades.CodCidade
    NO-LOCK
) THEN
    RETURN ERROR
        "A cidade nao pode ser eliminada porque esta sendo utilizada por um cliente.".
