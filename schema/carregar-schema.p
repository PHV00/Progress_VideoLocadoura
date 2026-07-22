BLOCK-LEVEL ON ERROR UNDO, THROW.

DEFINE VARIABLE cArquivoDF AS CHARACTER NO-UNDO.

ASSIGN
    cArquivoDF = SESSION:PARAMETER.

IF cArquivoDF = "" OR cArquivoDF = ? THEN DO:
    MESSAGE
        "O caminho do arquivo .df esta incorreto."
        VIEW-AS ALERT-BOX ERROR.

    QUIT.
END.

IF SEARCH(cArquivoDF) = ? THEN DO:
    MESSAGE
        "Arquivo nao encontrado:"
        SKIP
        cArquivoDF
        VIEW-AS ALERT-BOX ERROR.

    QUIT.
END.

RUN prodict/load_df.p (
    INPUT cArquivoDF
).

MESSAGE
    "Estrutura carregada com sucesso."
    SKIP
    cArquivoDF
    VIEW-AS ALERT-BOX INFORMATION.

QUIT.