/*
    Trigger WRITE - Clientes
*/
TRIGGER PROCEDURE FOR WRITE OF Clientes
    OLD BUFFER bOldClientes.

ASSIGN
    Clientes.NomCliente  = TRIM(Clientes.NomCliente)
    Clientes.CodEndereco = TRIM(Clientes.CodEndereco)
    Clientes.Observacao  = TRIM(Clientes.Observacao).

IF bOldClientes.CodCliente > 0
AND Clientes.CodCliente <> bOldClientes.CodCliente THEN
    RETURN ERROR "O codigo do cliente nao pode ser alterado.".

IF Clientes.CodCliente <= 0 THEN
    RETURN ERROR "O codigo do cliente deve ser maior que zero.".

IF Clientes.NomCliente = "" THEN
    RETURN ERROR "Informe o nome do cliente.".

IF Clientes.CodCidade <= 0 THEN
    RETURN ERROR "Informe uma cidade valida para o cliente.".

IF NOT CAN-FIND(
    FIRST Cidades
    WHERE Cidades.CodCidade = Clientes.CodCidade
    NO-LOCK
) THEN
    RETURN ERROR "A cidade informada nao esta cadastrada.".
