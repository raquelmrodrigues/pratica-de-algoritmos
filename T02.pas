Program T02;
{fa�a um programa que leia uma s�rie de notas. A leitura termina 
quando for lida uma nota negativa. Antes de encerrar 
o programa, mostrar o total de notas lidas e a m�dia das notas. }

var
soma,count,notaint,erro:integer;
media:real;
nota:string;


procedure converte(notastr: string; var notin: integer; var codigoErro:integer);
begin
  val (notastr, notin, codigoErro);
end;

begin //1
  writeln('Escreva as notas');
  writeln('o programa se encerra e a quantidade de notas e sua m�dia ser� mostrada assim que for inserida uma nota negativa ou maior que 100');
  readln(nota);
  
  converte(nota,notaint,erro);
  
  
  //=======================  c�digo principal
  
  while (notaint>=0) and (notaint<=100) do
  begin //2
    soma:= soma+notaint;
    count:= count+1;
    readln(nota);
    // fun��o de converter
    converte(nota,notaint,erro);
  end;//2
  
  media:=soma/count;
  writeln('a quantidade de notas inseridas foi');
  writeln(count);
  writeln('a media �:');
  writeln(media);
end. //1