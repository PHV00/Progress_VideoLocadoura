BLOCK-LEVEL ON ERROR UNDO, THROW.

DEFINE VARIABLE cBase     AS CHARACTER NO-UNDO.
DEFINE VARIABLE cArquivos AS CHARACTER NO-UNDO.
DEFINE VARIABLE iArquivo  AS INTEGER   NO-UNDO.

ASSIGN
    cBase = "C:/Progress_Final/video_locadora/schema"

    cArquivos =
        "triggers/cidades/cidades-create.p,"
      + "triggers/cidades/cidades-write.p,"
      + "triggers/cidades/cidades-delete.p,"
      + "triggers/clientes/clientes-create.p,"
      + "triggers/clientes/clientes-write.p,"
      + "triggers/clientes/clientes-delete.p,"
      + "triggers/filmes/filmes-create.p,"
      + "triggers/filmes/filmes-write.p,"
      + "triggers/filmes/filmes-delete.p,"
      + "triggers/alugueis/alugueis-create.p,"
      + "triggers/alugueis/alugueis-write.p,"
      + "triggers/alugueis/alugueis-delete.p,"
      + "triggers/aluguel_filmes/aluguel-filmes-write.p,"
      + "triggers/aluguel_filmes/aluguel-filmes-delete.p".

PROPATH = cBase + "," + PROPATH.

DO iArquivo = 1 TO NUM-ENTRIES(cArquivos):

    COMPILE VALUE(
        cBase + "/" + ENTRY(iArquivo, cArquivos)
    ) SAVE.

END.

QUIT.