;Programa 4 de Microprocesadores
;Programa para generar 3 patrones de bits

INICIO: LD A,82H        ;Configurar el PPI de salida
	OUT (03),A      ;PB de entrada y PC de salida modo 0

CHECAR: IN A, (01H)      ;Selecccionar el patron a exhibir
	AND 07H
	CP 04H
	JR Z,ENCENDER
	IN A,(01H)
	AND 07H
	CP 02H
	JR Z,BLINK
	IN A,(01H)
	AND 07H
	CP 01H
	JR Z,MOVER
	LD A,00H
	OUT (00H), A
	JP CHECAR

ENCENDER:
        LD A,0FFH       ;Encender los leds permanentemente
        OUT (00H),  A
        JP CHECAR

BLINK:
        LD A,0FFH       ;Parpadeo de leds
        OUT (00H), A

        LD DE,0002H     ;Consumo de tiempo
        LD BC,0002H
CICLO1: LD HL,0FFFFH
CICLO2: ADD HL,BC
        JP C,CICLO2
        EX DE,HL
        ADD HL,BC
        EX DE,HL
        JP C,CICLO1

        LD A,00H
        OUT (00H),A

        LD DE,0002H
        LD BC,0002H
CICLO3: LD HL,0FFFFH
CICLO4: ADD HL,BC
        JP C,CICLO4
        EX DE,HL
        ADD HL,BC
        EX DE,HL
        JP C,CICLO3

        JP CHECAR
MOVER:  LD A,0C0H         ;Corrimiento de leds
	OUT (00H), A

	LD DE,0002H
	LD BC,0002H
CICLO5: LD HL,0FFFFH
CICLO6: ADD HL,BC
        JP C,CICLO6
        EX DE,HL
        ADD HL,BC
        EX DE,HL
        JP C,CICLO5

        LD A,30H
        OUT (00H),A

        LD DE,0002H
        LD BC,0002H
CICLO7: LD HL,0FFFFH
CICLO8: ADD HL,BC
        JP C,CICLO8
        EX DE,HL
        ADD HL,BC
        EX DE,HL
        JP C,CICLO7

        LD A,0CH
        OUT (00H),A

        LD DE,0002H
        LD BC,0002H
CICLO9: LD HL,0FFFFH
CICLO10: ADD HL,BC
        JP C,CICLO10
        EX DE,HL
        ADD HL,BC
        EX DE,HL
        JP C,CICLO9

        LD A,03H
        OUT (00H),A

        LD DE,0002H
        LD BC,0002H
CICLO11: LD HL,0FFFFH
CICLO12: ADD HL,BC
        JP C,CICLO12
        EX DE,HL
        ADD HL,BC
        EX DE,HL
        JP C,CICLO11

        JP CHECAR

        END