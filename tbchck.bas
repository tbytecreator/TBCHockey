10 ' *****************************************************
20 ' TBC Hockey - Manoel Neto - 2022-09-20
30 ' *****************************************************
40 DEFINT A-Z:SCREEN 2:COLOR 7,1,1:KEY OFF:CLS
50 OPEN "GRP:" FOR OUTPUT AS #1
60 PRESET(40,30):PRINT #1,"[TByteCreator]"
70 PRESET(85,40):PRINT #1,"Hockey"
80 PRESET(35,140):PRINT #1,"<tecle qualquer coisa>"
90 OP$ = INPUT$(1)
100 ' *****************************************************
110 ' DESENHAR OS HUDS
120 ' *****************************************************
130 COLOR 13,1,1:CLS
140 LINE(0,0)-(255,20),7,BF
150 LINE(0,171)-(255,191),7,BF
160 PSET(5,7):PRINT #1,"Computador => "
170 PSET(5,180):PRINT #1,"Jogador => "
180 ' *****************************************************
190 ' ROTINA DE CARGA DOS SPRITES  
200 ' ***************************************************** 
220 ' SPRITE DAS PALETAS 
230 A$(1) = CHR$(&B11111111)
240 A$(2) = CHR$(&B11111111)
250 A$(3) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
260 A$(4) = CHR$(&B00000000)
270 A$(5) = CHR$(&B00000000)
280 A$(6) = CHR$(&B00000000)
290 A$(7) = CHR$(&B00000000)
300 A$(8) = CHR$(&B00000000)
400 FOR I = 1 TO 8 
410 	B$ = B$ + A$(I)
420 NEXT I
430 SPRITE$(1)=B$
440 ' SPRITE DA BOLA
450 A$(1) = CHR$(&B00000000)
460 A$(2) = CHR$(&B00011000)
470 A$(3) = CHR$(&B00111100)
480 A$(4) = CHR$(&B01111110)
490 A$(5) = CHR$(&B01111110)
500 A$(6) = CHR$(&B00111100)
510 A$(7) = CHR$(&B00011000)
520 A$(8) = CHR$(&B00000000)
530 FOR I = 1 TO 8 
540 	C$ = C$ + A$(I)
550 NEXT I
560 SPRITE$(2)=C$
570 ' *****************************************************
580 ' ESTADO INICIAL
590 ' *****************************************************
600 PC = 0 					      : ' PONTOS DO COMPUTADOR
610 PJ = 0					      : ' PONTOS DO JOGADOR
620 ' REINICIAR O PONTO 
630 CX = 120				      : ' POSICAO X DO COMPUTADOR
640 JX = 120				      : ' POSICAO X DO JOGADOR
650 JV = 5 					      : ' VELOCIDADE DO JOGADOR
660 XB = 120				      : ' POSICAO X DA BOLA
670 YB = 94					      : ' POSICAO Y DA BOLA
680 VBX = -5				      : ' VELOCIDADE DA BOLA NO EIXO X
690 VBY = -5    			    : ' VELOCIDADE DA BOLA NO EIXO Y 
700 ON SPRITE GOSUB 9000 	: ' CHECA COLISAO DE SPRITES
1000 ' *****************************************************
1010 ' MOVE A BOLA
1020 ' *****************************************************  
1030 XB = XB + VBX              : 'ADICIONA VELOCIDADE X A BOLA 
1040 YB = YB + VBY              : 'ADICIONA VELOCIDADE Y A BOLA
1050 PUT SPRITE 2,(XB,YB),10,2	: 'POSICIONA A BOLA DO JOGO
1060 ' *****************************************************
1070 ' MOVE O COMPUTADOR
1080 ' ***************************************************** 
1090 IF VBX < 0 THEN CX = CX - JV ELSE CX = CX + JV 
1100 PUT SPRITE 0,(CX,25),6,1 	: 'POSICIONA A PALETA DO COMPUTADOR
1110 ' *****************************************************
1120 ' MOVE O JOGADOR 
1130 ' *****************************************************
1140 CR = STICK(0)
1150 IF CR = 3 AND JX < 239 THEN JX = JX + JV : GOTO 1170
1160 IF CR = 7 AND JX > 1 THEN JX = JX - JV
1170 PUT SPRITE 1,(JX,165),6,1	: ' PALETA DO JOGADOR
1180 ' *****************************************************
1190 ' CHECA COLISAO
2000 ' *****************************************************
2010 IF YB < 20  	THEN PJ = PJ+1 : GOTO 6000 : 'ATUALIZA HUD
2020 IF YB > 175 	THEN PC = PC+1 : GOTO 6000 : 'ATUALIZA HUD
2030 IF XB < 1 		THEN VBX = VBX *-1
2040 IF XB > 254 	THEN VBX = VBX *-1
2050 GOTO 1000
6000 ' *****************************************************
6010 ' ATUALIZA HUD
6020 ' *****************************************************
6030 LINE(115,7)-(130,15),7,BF		 : 'LIMPA A AREA 
6035 PRESET(115,7):PRINT #1,PC		 : 'IMPRIME PONTOS DO COMPUTADOR
6040 LINE(85,180)-(100,188),7,BF	 : 'LIMPA A AREA 
6519 PRESET(85,180):PRINT #1,PJ		 : 'IMPRIME OS PONTOS DO JOGADOR
6759 IF PC = 5 OR PJ = 5 GOTO 8000 : ' ENCERRA O JOGO
7000 GOTO 620                      : ' REINICIA O PONTO
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
9050 XB = XB + VBX
9060 YB = YB + VBY 
9070 RETURN