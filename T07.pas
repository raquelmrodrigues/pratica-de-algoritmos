Program T07;
{Fa�a um programa que leia as respostas de uma prova de m�ltipla escolha de 6 (seis) disciplinas, constantes no arquivo de acesso sequencial tipo texto �prova.txt� (no anexo), cada registro � um string[64] e � composto por:
01-04 = n�mero do candidato
05-64 = as sessenta respostas da prova, assim divididas;
	05 � 09 = respostas da disciplina 1 (05 quest�es);
	10 � 19 = respostas da disciplina 2 (10 quest�es);
20 � 29 = respostas da disciplina 3 (10 quest�es);
	30 � 49 = respostas da disciplina 4 (20 quest�es);
	50 � 59 = respostas da disciplina 5 (10 quest�es);
	60 � 64 = respostas da disciplina 6 (05 quest�es);
Ap�s ler o registro, o programa dever� corrigir a prova do candidato, por disciplina e gravar o n�mero do candidato e as notas das 6 (seis) disciplinas no arquivo de acesso sequencial tipo texto �notas.txt�, cujo registro ser� um string[28]. A nota m�xima de cada uma das 6 (seis) disciplinas  � 100. Os registros de �notas.txt� devem ficar como abaixo
01 � 04 = n�mero do candidato
05 � 08 = nota da disciplina 1;
09 � 12 = nota da disciplina 2; 
13 � 16 = nota da disciplina 3;
17 � 20 = nota da disciplina 4; 
21 � 24 = nota da disciplina 5;
25 � 28 = nota da disciplina 6; }

Uses BIBLIONT;

Var ARQL1,ARQL2:TEXT;
REG1:STRING[64];//REGISTRO QUE CONTER� O N�MERO E AS RESPOSTAS // prova.txt
REG2:STRING[28];//REGISTRO QUE CONTER� O N�MERO E AS NOTAS  //nota.txt 
NOTAS:ARRAY[1..6] OF INTEGER;//PARA AS NOTAS E TOTAL DE QUEST�ES POR DISCIPLINA
NN:STRING[4];//PARA CONTER A NOTA CONVERTIDA DE INTEGER PARA STRING

//OUTRAS VARI�VEIS
num, nninteger, validar, teste, a, b, c, d, e, f, g, x:integer;
notastr:array[1..6] OF string;
gabarito:string[60];
numstr:string;
chave:boolean;

const	inidis:array[1..6] of integer=(5, 10, 20, 30, 50 ,60);
fimdis:ARRAY[1..6] of integer=(9, 19, 29, 49, 59, 64);
peso:array[1..6] of integer=(20,10,10,5,10,20);


//================================ programa principal
begin  
  assign(arql1,'PROVA.TXT');
  reset(arql1);
  assign(arql2,'NOTAS.TXT');
  rewrite(arql2);
  
  //LE O GABARITO (V A L I D A R STRING[60])
  begin
    repeat
      chave:=true;
      writeln('insira o gabarito das 60 quest�es');
      readln(gabarito);
      gabarito:=upcase(gabarito);
        c:=length(gabarito);
        f:=1;
        repeat
          if ((c<60) or (c>60)) then
          chave:=false;
          if ((gabarito[f]<'A') or (gabarito[f]>'E')) then
          chave:=false;
          f:=f+1;
        until ((f>60) or (not chave));
      until (chave);
    end;
    
    while not eof (arql1) do //PARA LER DO PRIMEIRO AO ULTIMO
    begin
      A:=A+1;
      readln(arql1,reg1);//LE O N�M E AS RESPOSTAS de cada candidato
      
      numstr:=copy(reg1,1,4);
      insert(numstr,reg2,1);
      
      //CORRIGE A PROVA CALCULANDO A NOTA POR DISCIPLINA
      for d:=1 to 6 do
			begin
			   nninteger:=0;
        for b:=inidis[d] to fimdis[d] do
          if (reg1[b]= gabarito[b-4]) then
          nninteger:= nninteger+1;
          notas[d]:=nninteger; 
					notas[d]:= notas[d]* peso[d]; 
      end;
      
      //USE A �STR� PARA CONVERTER A NOTA INTEGER PARA UM STRING[4] INSERIR NN EM REG2 NA POSI��O CORRESPONDENTE A NOTA DA DISCIPLINA
      teste:=5;
      for x:=1 to 6 do
      begin
        str(notas[x]:4,notastr[x]);
        insert(notastr[x],reg2,teste);
        teste:=teste+4;
      end;
      
      writeln(arql2,reg2);
      
    end;
    
    writeln('REGISTROS LIDOS=',A:7);
    close(arql1);
    close(arql2);
    termine;
  end.