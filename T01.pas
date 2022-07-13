Program T01;
{O problema a ser resolvido é saber calcular a idade de uma pessoa 
em anosc, mesc, diasc (anos calculado, meses calculado, dias calculado) 
a partir da data atual (diaa, mesa, anoa) e da data de nascimento (dian, mesn, anon). 
Não pode transformar as datas atual e data de nascimento em dias.}

var
diaa, mesa, anoa:integer;
dian, mesn,anon:integer;
diaf, mesf, anof:integer;
bis,addia:integer;

Begin
  
  Writeln('Escreva o dia, mês e ano atual.');
  Readln(diaa,mesa,anoa);
  WritelN('escreva o dia, mês e ano de seu nascimento');
  Readln(dian,mesn,anon);
  
  bis:=0;
  
  
  begin //2
    anof:= anoa-anon;
    //addia:= anof/4;
    if ((anoa mod 4) = 0 ) then
    bis := 1;
  end; //2
  
  begin //3
    mesf:= mesa-mesn;
    if (mesf<0) then
    begin //4
      anof:= anof-1;
      mesf:= +(12)+(mesf);
    end; //4
  end; //3
  
  begin //5
    diaf:= diaa-dian;
    if diaf<0 then
    begin //6
      mesf:= mesf-1;
      if (mesf<0) then
      begin //7
        anof:= anof-1;
        mesf:= +(12)+(mesf);
      end; //7
    end; //5
  end;
  
  if (mesf=1) or (mesf=3) or (mesf=5) or (mesf=7) or (mesf=8) or (mesf=10) or (mesf=12) then
  diaf:= 31+(diaf);
  
  if (mesf=11) or (mesf=4) or (mesf=6) or (mesf=9) then
  diaf:= 30+(diaf);
  
  if mesf=2 then
  begin //8
    if bis=1 then
    diaf:= 29+(diaf);
    if bis=0 then
    diaf:= 28+(diaf);
  end; //8
  
  
  
  write('voce tem');
  write(anof:3);
  write(' anos');
  write(mesf:3);
  write(' meses e');
  write(diaf:3);
  write(' dias de vida');
  
End. //1