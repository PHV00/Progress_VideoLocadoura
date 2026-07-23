O sistema utilizado, criar dois arquivos o videolocadora.df responsável pelos schema do banco e o seu respectivo carregador (carregar-schema.p) responsável pela aplicação das mudanças e execução do "schema", isso se dando por meio dos comandos abaixo(o qual executa ao final uma instancia do progress e roda seu schema)

// abrir o proenv 

//criar pastas
mkdir C:\Progress_Final\video_locadora\schema\db
cd \Progress_Final\video_locadora\schema\db

//criar bd vazio
prodb videoloc empty

//rodar script com a estrutura
prowin.exe -db "C:\Progress_Final\video_locadora\schema\db\videoloc.db" -1 -p "C:\Progress_Final\video_locadora\schema\carregar-schema.p" -param "C:\Progress_Final\video_locadora\schema\videoloc.df"

// compilar triggers
// necessita conectar o banco pra depois rodar o comando

prowin.exe -db "C:\Progress_Final\video_locadora\schema\db\videoloc.db" -p "C:\Progress_Final\video_locadora\schema\compilar-triggers.p" 
// caso não funcione abra o arquivo compilador e execute ele depois de conectar ao banco

// para deletar 

cd C:\Progress_Final\video_locadora\schema
Remove-Item -Path ".\db" -Recurse -Force