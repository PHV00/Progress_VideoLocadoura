/*
    Trigger DELETE - Clientes
*/
TRIGGER PROCEDURE FOR DELETE OF Clientes.

IF CAN-FIND(
    FIRST Alugueis
    WHERE Alugueis.CodCliente = Clientes.CodCliente
    NO-LOCK
) THEN
    RETURN ERROR
        "O cliente nao pode ser eliminado porque possui aluguel cadastrado.".
