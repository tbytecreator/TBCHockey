10 ' *****************************************************
20 ' TBC Hockey - Manoel Neto - 2022-09-20
30 ' *****************************************************
40 SCREEN 3
50 COLOR 7,13,1
60 CLS:KEY OFF:
70 OPEN "GRP:" FOR OUTPUT AS #1
80 PRESET(80,30)
90 PRINT #1,"TBC"
100 PRESET(45,70)
110 PRINT #1,"Hockey"
120 PRESET(30,140)
130 PRINT #1,"<enter>"
140 OP$ = INPUT$(1)
150 ' *****************************************************
160 ' CRIAR OS HUDS
170 ' *****************************************************
180 SCREEN 2
190 LINE(0,0)-(255,20),7,BF
200 LINE(0,171)-(255,191),7,BF
205 COLOR 13,13
210 PRESET(5,7):PRINT #1,"Computador => "
220 PRESET(5,180):PRINT #1,"Jogador => "
10000 OP$ = INPUT$(1)