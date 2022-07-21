Program T04;
{Fa�a um programa que leia uma s�rie de CPF�s e informe 
se o CPF lido � v�lido ou n�o. CPF �00000000000� (onze zeros) 
encerra o programa. Use o exerc�cio 10 da lista 2 (enviado) 
como refer�ncia. 
Garantir que sejam digitados 11 d�gitos (validar).}

var 
somax,somay,dig10,dig11,restox,restoy:integer;
erro,tamanho,i:integer; 
cpf:string[11];
vet:array[1..11] OF INTEGER;

Begin                                                 
	repeat
  	write('Digite um CPF v�lido, sem os pontos e tra�os');
  	readln(cpf);
		tamanho:=length(cpf);
		if(tamanho<>11) then  
	 		writeln('CPF inv�lido, verifique se escreveu corretamente os numerais e sem os pontos e tra�os');
	 		writeln;
 	until(tamanho=11);
 	while cpf <> '00000000000' do
  	Begin
			FOR i:=1 TO 11 DO
	  		val(cpf[i],vet[i],erro); 
  		somax:=0;
  		somay:=0;
  		dig10:=0;
  		dig11:=0;
			FOR i:=1 TO 9 DO 				
	  		somax:=somax+vet[i]*(11 - i);	
	 			restox:=somax MOD 11;
				 	FOR i:=1 TO 10 DO 						
	  			somay:=somay+vet[i]*(12 - i);	
	 				restoy:=somay MOD 11;               
	  	if(restox>=2) and (restox<=10) then
	  		dig10:=11-restox;
	  	if(restoy>=2) and (restoy<=10) then
	  		dig11:=11-restoy;
	 		if(dig10<>vet[10]) then
	 		Begin
	  		writeln(' CPF inv�lido','  O d�cimo d�gito foi: ',dig10);
	  		writeln('');
	  	End
	  	else	       
	 			if(dig11<>vet[11]) then
	 				Begin
	  				writeln('CPF inv�lido','  O d�cimo primeiro d�gito foi: ',dig11);
	  				writeln('');
	  			End
	 			else
	 				Begin
			 			writeln('   CPF v�lido = ',cpf);                                
			 			writeln('');
			 		End;
		repeat
			write('Digite o CPF (Precisa conter 11 d�gitos) = ');
			readln(cpf);
			tamanho:=length(cpf);
			if(tamanho<>11) then  
	 			writeln('CPF inv�lido, o CPF precisa conter 11 d�gitos');
	 			writeln;
	 	until(tamanho=11);
		End;		
	writeln('Aperte enter para encerrar.');
	readln;
End.