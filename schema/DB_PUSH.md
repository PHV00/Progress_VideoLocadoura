O sistema utilizado, criar dois arquivos o videolocadora.df responsável pelos schema do banco e o seu respectivo carregador (carregar-schema.p) responsável pela aplicação das mudanças e execução do "schema", isso se dando por meio dos comandos abaixo(o qual executa ao final uma instancia do progress e roda seu schema)

//criar pastas
mkdir C:\Progress_Final\video_locadora\schema\db
cd C:\Progress_Final\video_locadora\schema\db

// abrir o proenv 

//criar bd vazio
prodb videoloc empty

//rodar script com a estrutura
prowin.exe -db "C:\Progress_Final\video_locadora\schema\db\videoloc.db" -1 -p "C:\Progress_Final\video_locadora\schema\carregar-schema.p" -param "C:\Progress_Final\video_locadora\schema\videoloc.df"

// para deletar 

cd C:\Progress_Final\video_locadora\schema
Remove-Item -Path ".\db" -Recurse -Force