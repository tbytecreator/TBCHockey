10 ' *****************************************************
20 ' TBC Hockey - Manoel Neto - 2022-09-20
30 ' *****************************************************
40 DEFINT A-Z:SCREEN 2:COLOR 7,1,1:KEY OFF:CLS
50 OPEN "GRP:" FOR OUTPUT AS #1
60 PRESET(40,30):PRINT #1,"[TByteCreator]"
70 PRESET(85,40):PRINT #1,"Hockey"
80 PRESET(35,140):PRINT #1,"<tecle qualquer coisa>"
90 OP$ = INPUT$(1)
200 ' *****************************************************
210 ' DESENHAR OS HUDS
220 ' *****************************************************
230 COLOR 13,1,1:CLS
240 LINE(0,0)-(255,20),7,BF
250 LINE(0,171)-(255,191),7,BF
270 PSET(5,7):PRINT #1,"Computador => "
280 PSET(5,180):PRINT #1,"Jogador => "
300 ' *****************************************************
310 ' ESTADO INICIAL
320 ' *****************************************************
330 PC = 0 					: ' PONTOS DO COMPUTADOR
340 PJ = 0					: ' PONTOS DO JOGADOR
350 GOSUB 10000				: ' ROTINA DE CARGA DOS SPRITES
360 ' REINICIAR O PONTO 
370 CX = 120				: ' POSICAO X DO COMPUTADOR
380 JX = 120				: ' POSICAO X DO JOGADOR
390 JV = 5 					: ' VELOCIDADE DO JOGADOR
400 XB = 120				: ' POSICAO X DA BOLA
410 YB = 94					: ' POSICAO Y DA BOLA
420 VBX = -5				: ' VELOCIDADE DA BOLA NO EIXO X
430 VBY = -5    			: ' VELOCIDADE DA BOLA NO EIXO Y 
450 ONSPRITE GOSUB 9000 	: ' CHECA COLISAO DE SPRITES
725 SPRITE ON
1000 ' *****************************************************
1010 ' MOVE A BOLA
1020 ' *****************************************************  
2030 XB = XB + VBX              : 'ADICIONA VELOCIDADE X A BOLA 
2040 YB = YB + VBY              : 'ADICIONA VELOCIDADE Y A BOLA
2050 PUT SPRITE 2,(XB,YB),10,2	: 'POSICIONA A BOLA DO JOGO
1000 ' *****************************************************
1010 ' MOVE O COMPUTADOR
1020 ' ***************************************************** 
3030 IF VBX < 0 THEN CX = CX - JV ELSE CX = CX + JV 
3040 PUT SPRITE 0,(CX,25),6,1 	: 'POSICIONA A PALETA DO COMPUTADOR
4000 ' *****************************************************
4010 ' MOVE O JOGADOR 
4020 ' *****************************************************
4030 CR = STICK(0)
4040 IF CR = 3 AND JX < 239 THEN JX = JX + JV : GOTO 4060
4050 IF CR = 7 AND JX > 1 THEN JX = JX - JV
4060 PUT SPRITE 1,(JX,165),6,1	: ' PALETA DO JOGADOR
5000 ' *****************************************************
5010 ' CHECA COLISAO
5020 ' *****************************************************
5030 IF YB < 25  	THEN PJ = PJ+1 : GOTO 370 : 'REINICA O PONTO
5040 IF YB > 165 	THEN PC = PC+1 : GOTO 370 : 'REINICA O PONTO
5050 IF XB < 1 		THEN VBX = VBX *-1
5524 IF XB > 254 	THEN VBX = VBX *-1
6000 ' *****************************************************
6010 ' ATUALIZA HUD
6020 ' *****************************************************
6030 LINE(115,7)-(130,15),7,BF		: 'LIMPA A AREA 
6035 PRESET(115,7):PRINT #1,PC		: 'IMPRIME PONTOS DO COMPUTADOR
6040 LINE(85,180)-(100,188),7,BF	: 'LIMPA A AREA 
6519 PRESET(85,180):PRINT #1,PJ		: 'IMPRIME OS PONTOS DO JOGADOR
6759 IF PC = 5 OR PJ = 5 GOTO 8000
7000 GOTO 1000
8000 ' *****************************************************
8010 ' FINAL DO JOGO 
8020 ' *****************************************************
8030 SCREEN 2: COLOR 7,1,1 : CLS 
8040 IF PC > PJ THEN PSET(70,40): PRINT #1,"VOCE PERDEU?" ELSE PSET(70,40):PRINT #1,"VOCE GANHOU!"
8050 PSET(40,100): PRINT #1,"Quer jogar outra (s/n)?"
8060 OP$ = INPUT$(1)
8065 CLOSE #1
8070 IF OP$ = "s" OR OP$ = "S" THEN GOTO 40   
8999 END
9000 ' *****************************************************
9010 ' COLISAO DE SPRITES 
9020 ' *****************************************************
9030 VBX = VBX * -1  
9040 VBY = VBY * -1 
9999 RETURN
10000 ' *****************************************************
10002 ' ROTINA DE CARGA DOS SPRITES  
10003 ' ***************************************************** 
10004 ' SPRITE DAS PALETAS 
10005 A$(1) = CHR$(&B11111111)
10010 A$(2) = CHR$(&B11111111)
10020 A$(3) = CHR$(&B00000000)
10030 A$(4) = CHR$(&B00000000)
10040 A$(5) = CHR$(&B00000000)
10050 A$(6) = CHR$(&B00000000)
10060 A$(7) = CHR$(&B00000000)
10070 A$(8) = CHR$(&B00000000)
10080 FOR I = 1 TO 8 
10090 	B$ = B$ + A$(I)
10100 NEXT I
10110 SPRITE$(1)=B$
10120 ' SPRITE DA BOLA
10130 A$(1) = CHR$(&B00000000)
10140 A$(2) = CHR$(&B00011000)
10150 A$(3) = CHR$(&B00111100)
10160 A$(4) = CHR$(&B01111110)
10170 A$(5) = CHR$(&B01111110)
10180 A$(6) = CHR$(&B00111100)
10190 A$(7) = CHR$(&B00011000)
10200 A$(8) = CHR$(&B00000000)
10210 FOR I = 1 TO 8 
10220 	C$ = C$ + A$(I)
10230 NEXT I
10240 SPRITE$(2)=C$
10250 RETURN