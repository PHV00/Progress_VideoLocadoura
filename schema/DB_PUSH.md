O sistema utilizado criar dois arquivos o videolocadora.df responsável pelos schema do banco e o seu respectivo carregador (carregar-schema.p) responsável pela aplicação das mudanças e execução do "schema", isso se dando por meio do comando abaixo(o qual executa uma instancia do progress e roda seu schema)

prowin.exe ^
  -db "C:\Progress_Final\video_locadora\db\videolocadora" ^
  -p "C:\Progress_Final\video_locadora\carregar-schema.p" ^
  -param "C:\Progress_Final\video_locadora\schema\videolocadora.df"