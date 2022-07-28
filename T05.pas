Program T05;
{Fa�a um programa que leia uma s�rie de no m�ximo 50 nomes (40 caracteres), 
encerrada por nome igual a �FIM� (que n�o deve fazer parte da lista). 
Para cada nome lido, colocar o sobrenome na frente (conforme exerc�cio 11 da lista 2). 
O nome transformado (com o sobrenome na frente) deve ser colocado em um vetor. 
Ap�s o encerramento da leitura, mostrar os nomes lidos e transformados, 
com sobrenomes menores que LZ..., em ordem alfab�tica crescente (A ? menor LZ) 
e os nomes transformados, com sobrenomes maiores ou iguais a LZ..., 
em ordem alfab�tica decrescente (Z ? maior ou igual a LZ...). e}

uses crt;
var nominho:array[0..50] of string[40];
i,total,j,yo:integer;
nomeup:STRING[40];
LZ:string[2];
qtmaior, qtmenor,esp:integer;
nome, aux:string[40];
troca,validanome:boolean;


//============================   fun��o obrigat�ria do professor
function sobrenom(NOME:STRING[40]):string[40];
var TCN,ESP,PCSN,UCPN,A,PAUX:INTEGER;
NOMSOBR:string[40];

Begin
  TCN:=LENGTH(NOME);//FUNCAO QUE DEVOLVE O TOTAL DE CARACTERES DO STRING
  ESP:=TCN;
  REPEAT
    ESP:=ESP-1;      //a partir do total de caracteres do string, de traz para frente procura o primeiro espa�o
    //lembrar que se n�o houver sobrenome, o programa ir� abortar, pois esp chegar� a zero..
  UNTIL(NOME[ESP]=' ');
  PCSN:=ESP+1;      //espa�o + 1, prim. caractere do sobrenome
  UCPN:=ESP-1;      //espa�o - 1, ultimo caractere do pre-nome
  paux:=0;          //paux=conta as posicoes para transferir sobrenome, nome para variavel aux...
  NOMSOBR:='                                         ';         //preenche com espa�os o string NOMSOBR;
  FOR A:=PCSN TO TCN DO
  Begin
    paux:=paux+1;
    NOMSOBR[paux]:=NOME[A]; //transfere sobrenome para vari�vel auxiliar
  end;
  paux:=paux+1;
  NOMSOBR[paux]:=','; //coloca a , na vari�vel auxiliar
  paux:=paux+1;
  NOMSOBR[paux]:=' '; //coloca o esp na vari�vel auxiliar
  FOR A:=1 TO UCPN DO
  begin
    paux:=paux+1;
    NOMSOBR[paux]:=NOME[A]; //transfere prenome para vari�vel auxiliar
  end;
  sobrenom:=NOMSOBR;    //transfere o resultado da tarefa para o nome da funcao
  
End;


//====================== programa principal


begin
  LZ:= 'LZ';
  qtmaior:=0;
  qtmenor:=0;
  i:=1;
  
  
  writeln(' Escreva os nomes e sobrenomes, n�o esquecer do espa�o! Para terminar digite "fim"');
  
  while (nome<>'fim') and (i<=50) do
  begin
    readln(nome);
    if (nome<>'fim') then
    begin
      nome:= upcase(nome);
        nome:= sobrenom(nome);
        nominho[i]:= nome;
        i:=i+1;
      end;
      
    end;
    
 // ========== colocando em ordem alfab�tica  
    total:=i;
    
    repeat                                                  
      total:=total-1;
       troca:=true;
      
      for j:=1 to total do
      if(nominho[j]>nominho[j+1])then
      begin
        aux:=nominho[j];
        nominho[j]:=nominho[j+1];
        nominho[j+1]:=aux;
        troca:=false;
      end;
      
    until troca;
   
	 //============== escrevendo os nomes
    
    
    writeln('Nomes menores que "LZ"');
    
    for j:=1 to i do
    begin
      if (nominho[j]<'LZ') then
      begin
        writeln(nominho[j]);
        qtmenor:=qtmenor+1;
      end;
    end;
    
    
    if qtmenor = 0 then
    writeln('nenhum nome menor que "LZ"');
    writeln;
    writeln('Nomes maiores que "LZ"');
    
    for j:=i downto 1 do
    begin
      if (nominho[j]>='LZ') then
      begin
        writeln(nominho[j]);
        qtmaior:=qtmaior+1;
      end;
    end;
    
    if qtmaior = 0 then
    writeln('nenhum nome maior que "LZ"');
    
end.
  
  