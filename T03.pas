Program T03;
{FUP que leia dia, m�s e ano e informe se a data 
lida � v�lida ou n�o. Para a data ser considerada v�lida, 
ano lido entre 1950 e 2000, m�s lido entre 1 e 12 e dia lido 
entre 1 e dias m�ximo do m�s lido.
USAR uma fun��o l�gica para validar a data e uma fun��o 
para devolver o n�mero m�ximo de dias do m�s lido. Usar tamb�m a PROCEDURE}

var
ano, mes, dia, bis:integer;

function anoval(ano1:integer):boolean;
var
chave : boolean;
//anov: integer;
begin
  if (ano1<1950) then
	chave:= false;
  if (ano1>2000) then
  begin
  chave:= false;
  end
  else
  chave:= true;
  
  anoval:=chave;
end;

function mesval(mes1:integer):boolean;
 var
chave : boolean;
begin
  if (mes1<1) then
  begin
    chave:= false;
  end;
  if (mes1>12) then
  begin
    chave:= false;
  end
  else
  chave:= true;
  
  mesval:=chave;
end;

function diaval(dia1, mes2, ano2, bis2:integer):boolean;
var
chave : boolean;
begin
  if (dia1<1) then
  chave:= false
  else
  
  bis2:=0;
  if ((ano2 mod 4) = 0 ) then
  bis2 := 1;
  
  if (mes2=1) or (mes2=3) or (mes2=5) or (mes2=7) or (mes2=8) or (mes2=10) or (mes2=12) then
  begin
    if (dia1>31) then
    chave:= false
    else
     chave:= true;
  end
  else
  if (mes2=11) or (mes2=4) or (mes2=6) or (mes2=9) then
  begin
    if (dia1>30) then
    chave:= false
    else
     chave:= true;
  end
  else
  if mes2=2 then
  begin //8
    if bis=1 then
    if(dia1>29) then
    chave:= false
    else
     chave:= true;
    if bis=0 then
    if (dia1>28) then
    chave:= false
    else
    chave:= true;
  end; //8
   diaval:=chave;
  
end;

procedure chamar(diax:integer; var mesx, anox, bisx:integer);
begin
	anoval(anox);
  mesval(mesx);
  diaval(diax, mesx,anox,bisx);
end;

//======================================

Begin
  
  writeln('insira o dia, m�s e ano');
  readln(dia, mes, ano);
  
  chamar(dia, mes, ano, bis);
  
  if (anoval(ano)) and (mesval(mes)) and (diaval(dia, mes,ano,bis)) then
  write('data v�lida')
  else 
  write('data inv�lida');
  
End.