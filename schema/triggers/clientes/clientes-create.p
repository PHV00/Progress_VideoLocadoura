/*
    Trigger CREATE - Clientes
*/
TRIGGER PROCEDURE FOR CREATE OF Clientes.

ASSIGN
    Clientes.CodCliente = NEXT-VALUE(seqCliente).
