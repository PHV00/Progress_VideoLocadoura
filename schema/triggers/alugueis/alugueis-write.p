/*
    Trigger WRITE - Alugueis
*/
TRIGGER PROCEDURE FOR WRITE OF Alugueis
    OLD BUFFER bOldAlugueis.

ASSIGN
    Alugueis.Observacao = TRIM(Alugueis.Observacao).

IF bOldAlugueis.CodAluguel > 0
AND Alugueis.CodAluguel <> bOldAlugueis.CodAluguel THEN
    RETURN ERROR "O codigo do aluguel nao pode ser alterado.".

IF Alugueis.CodAluguel <= 0 THEN
    RETURN ERROR "O codigo do aluguel deve ser maior que zero.".

IF Alugueis.CodCliente <= 0 THEN
    RETURN ERROR "Informe um cliente valido para o aluguel.".

IF NOT CAN-FIND(
    FIRST Clientes
    WHERE Clientes.CodCliente = Alugueis.CodCliente
    NO-LOCK
) THEN
    RETURN ERROR "O cliente informado nao esta cadastrado.".

IF Alugueis.DatAluguel = ? THEN
    RETURN ERROR "Informe uma data valida para o aluguel.".

IF Alugueis.ValAluguel < 0 THEN
    RETURN ERROR "O total do aluguel nao pode ser negativo.".
