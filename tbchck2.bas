180 ' *****************************************************
190 ' ROTINA DE CARGA DOS SPRITES  
200 ' ***************************************************** 
220 ' SPRITE DAS PALETAS 
230 A$(1) = CHR$(&B11111111)
240 A$(2) = CHR$(&B11111111)
250 A$(3) = CHR$(&B00000000)
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
570 ' *******************************************************
580 ' ESTADO INICIAL 
590 ' *******************************************************
600 ON SPRITE GOSUB 9000 	: ' ROTINA DE COLISAO DE SPRITES
610 SPRITE ON               : ' ATIVA AS COLISOES
600 CX = 120				: ' POSICAO X DO COMPUTADOR
610 JX = 120				: ' POSICAO X DO JOGADOR
620 VJ = 5 					: ' VELOCIDADE DO JOGADOR
630 XB = 120				: ' POSICAO X DA BOLA
640 YB = 94					: ' POSICAO Y DA BOLA
650 VX = 2				    : ' VELOCIDADE DA BOLA NO EIXO X
660 VY = 2    			    : ' VELOCIDADE DA BOLA NO EIXO Y
1110 ' *****************************************************
1120 ' MOVE O JOGADOR 
1130 ' *****************************************************
1140 CR = STICK(0)
1150 IF CR = 3 AND JX < 239 THEN JX = JX + VJ : GOTO 1170
1160 IF CR = 7 AND JX > 1 THEN JX = JX - VJ
1170 PUT SPRITE 1,(JX,165),6	: ' PALETA DO JOGADOR
1180 ' *****************************************************
1190 ' MOVE A BOLA
1200 ' *****************************************************  
1210 XB = XB + VX               : 'ADICIONA VELOCIDADE X A BOLA 
1220 YB = YB + VY               : 'ADICIONA VELOCIDADE Y A BOLA
1230 PUT SPRITE 2,(XB,YB),10	: 'POSICIONA A BOLA DO JOGO
1240 ' *****************************************************
1250 ' MOVE O COMPUTADOR
1260 ' ***************************************************** 
1270 IF VX < 0 THEN CX = CX - VJ ELSE CX = CX + VJ 
1280 PUT SPRITE 3,(CX,25),6 	: 'POSICIONA A PALETA DO COMPUTADOR
1290 ' *****************************************************
1300 ' CHECA COLISAO
1310 ' *****************************************************
2010 IF YB < 20  	THEN VY = VY*-1 
2020 IF YB > 160 	THEN VY = VY*-1
2030 IF XB < 1 		THEN VX = VX*-1
2040 IF XB > 254 	THEN VX = VX*-1
2050 GOTO 1140
3000 ' *****************************************************
3010 ' COLISAO DE SPRITES 
3020 ' *****************************************************
3030 VX = VX*-1  
3040 VY = VY*-1
3050 XB = XB + VX 
3060 YB = YB + VY 
3050 PUT SPRITE 2,(XB,YB) 
3050 RETURN