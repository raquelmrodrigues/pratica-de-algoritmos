Program T06;
{Alterar os grupos de instruções, indicadas no corpo do programa CRIATEXTO.PAS, utilizando os módulos LEIA1 (da BIBLIONT.pas) e o módulo STR (do PASCALZIM).
}

//LER DO TECLADO ,NUM:4,NOME:35,CPF:11,NASC:8,CARGO:2 (1<->12) , nuM total De 60 caracteres e criar um arquivo
//tipo texto (acesso sequencial - SAI1.TXT), com as informações lidas... num=0, encerra a leitura.
{01-04=NUMERO
05-39=NOME
40-50=CPF
51-58=NASCIMENTO
59-60=CARGO}
uses Bibliont;//<<<<<<<<<<<<<<PARA USAR BIBLIOTECA PARTICULAR --> USES <nome da bi
var regi:string[60];
num,ano:string[4];
mes,dia,cargo:string[2];
cpf:string[11];
nome:string[35];
a,b,c,e,tc,DD,MM,AA:integer;
arq:text; //NOME LOGICO DO ARQUIVO
CHACPF,CHADATA:BOOLEAN;



//=============================================== código principal
Begin
  
assign(arq,'sai1.txt');
append(arq);
write('num');
leia1(num,a);


  
  //UMA VARIÁVEL STRING[4] (NUM)
 str(a,num);
  tc:=length(num);     //pega total de caracteres contidos em NUM     9  -> TC=1
  
  for b:=1 to 4-tc do  //para inserir '0' na frente     1 ATÉ 3
  begin
    insert('0',num,1);  //de num  B=1 NUM=09;  B=2 NUM=009;   B=3 NUM=0009
  end;
  
  write(' nome=>');
  readln(nome);
  nome:=upcase(nome);
    tc:=length(nome);    //pega total de caracteres contidos em nome
    for b:=tc+1 to 35 do //completa com espaços ate 35
    insert(' ',nome,b); //o conteudo de nome
    
    
    //validar o cpf USE A FUNCTION DE BIBLIONT PARA VALIDAR CPF;
    REPEAT
      CHACPF:=TRUE;
      write(' cpf=>');
      readln(cpf);
      IF(LENGTH(CPF) < 11)THEN
      CHACPF:=FALSE
      ELSE
      CHACPF:=VALIDACPF(CPF);
      IF(NOT CHACPF)THEN
      WRITELN('    CPF ILEGAL');
    UNTIL CHACPF;
    validacpf(cpf);
    
    
    //validar a data USE A FUNCTION DE BIBLIONT PARA VALIDAR A DATA
     repeat
    writeln('insira o dia, mês e ano');
    readln(DD, MM, AA);
    until validata(DD,MM,AA);
    str(DD,dia);
    tc:=length(dia);     
	   for b:=1 to 2-tc do  
	    insert('0',dia,1);
    str(MM,mes);
     tc:=length(mes);     
	   for b:=1 to 2-tc do  
	    insert('0',mes,1);
   str(AA,ano);

    
    //VALIDAR O CARGO
    write('cargo');
		leia1(cargo,b);
    
    
    //ANTES, TRANSFORMAR O INTEGER EM UM STRING[2] (CARGO)
    str(B,CARGO);
    if(length(cargo)<2) then  //para inserir '0' na frente
    insert('0',cargo,1);      //de cargo
    
    INSERT(CARGO,REGI,1);
    INSERT(ANO,REGI,1);  
    INSERT(MES,REGI,1); 
    INSERT(DIA,REGI,1);  
    INSERT(CPF,REGI,1);  
    INSERT(NOME,REGI,1); 
    INSERT(NUM,REGI,1);  
    WRITELN(ARQ,REGI);   
    
    write('num');
    leia1(num,a);
	
  TERMINE;
  CLOSE(ARQ);
End.